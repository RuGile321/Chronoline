# Chronoline

Build your own history timeline as you learn, and see how events fit together: events on a line, periods as blocks, colour-coded categories, flashcards for revision, and import/export to swap timelines with friends.

The site is a single page (`index.html`). Logins and saved timelines use [Supabase](https://supabase.com) (free plan). Hosting is [GitHub Pages](https://pages.github.com) (free).

## Files

| File | What it is |
|---|---|
| `index.html` | The whole app |
| `config.js` | Your Supabase project's address and public key |
| `supabase-setup.sql` | Creates the database table and the privacy rules (run once in Supabase) |

## Setup

### 1. Put the site on GitHub Pages

1. On github.com, click **+** (top right) → **New repository**.
2. Name it `chronoline`, keep it **Public**, leave every "Add…" box unticked, and click **Create repository**.
3. On the new, empty repository page, click the link **uploading an existing file**.
4. Drag in all four files (`index.html`, `config.js`, `supabase-setup.sql`, `README.md`) and click **Commit changes**.
5. Open the repository's **Settings** → **Pages**. Under *Build and deployment*, set **Source** to *Deploy from a branch*, **Branch** to `main` and `/ (root)`, then **Save**.
6. After a minute or two, the Pages screen shows your address: `https://YOUR-USERNAME.github.io/chronoline/`.

The site already works at this point. Without step 2 everyone's timeline is saved in their own browser.

### 2. Turn on accounts with Supabase

1. Go to supabase.com and sign up (signing in with GitHub is quickest).
2. Create a **new project**: name it `chronoline`, choose a database password (keep it somewhere safe), and pick a region near you (e.g. London). Wait a couple of minutes while it's created.
3. Open the **SQL Editor**, start a new query, paste the whole of `supabase-setup.sql`, and click **Run**. It should say *Success*.
4. Open **Authentication** → **URL Configuration**. Set **Site URL** to your GitHub Pages address from step 1.6, and add the same address under **Redirect URLs**. Save. This makes the confirmation and password-reset emails link back to your site.
5. Find your project's **URL** and **anon / publishable key**: click **Connect** at the top of the project, or look in **Project Settings** → **API**.
6. Back on GitHub, open `config.js`, click the pencil icon (Edit), paste the two values in place of the placeholders, and click **Commit changes**.
7. Wait a minute, then reload your site. You'll see the log-in screen.

The anon/publishable key is meant to be public. The row-level security rules from step 2.3 make sure each person can only ever read and change their own timeline. Never put the **service_role / secret** key in `config.js`.

### 3. Bring over your existing timeline

On the claude.ai version: **Import / Export** → **Export** → save the file. On your new site: log in → **Import / Export** → **Import** → choose the file → **Merge into my timeline**.

## Good to know

- **Confirmation emails.** By default Supabase asks new users to confirm their email. Its built-in email sender only sends a few emails per hour, which is fine for friends but not for a big launch. You can switch confirmation off (Authentication → Sign In / Providers → Email → *Confirm email*), or connect your own email service later.
- **Updating the site.** Edit a file on GitHub (pencil icon) or upload a new version. GitHub Pages republishes within a minute or two.
- **Inactive free projects.** Supabase may pause a free project after a week with no activity. Opening the Supabase dashboard and restoring it wakes it up again.
- **Your own domain.** You can point a domain you own at GitHub Pages in Settings → Pages → *Custom domain*. Then update the Site URL in Supabase to match.
