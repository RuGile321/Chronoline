-- Chronoline database setup.
-- Run this once in Supabase: dashboard → SQL Editor → New query → paste everything → Run.

-- One row per person, holding their whole timeline (events, categories, notes, theme).
create table if not exists public.timelines (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  constraint timeline_size_limit check (pg_column_size(data) < 1000000)
);

-- Row-level security: each person can only see and change their own timeline.
alter table public.timelines enable row level security;

create policy "Read own timeline"   on public.timelines for select using (auth.uid() = user_id);
create policy "Create own timeline" on public.timelines for insert with check (auth.uid() = user_id);
create policy "Update own timeline" on public.timelines for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Delete own timeline" on public.timelines for delete using (auth.uid() = user_id);
