// Chronoline settings.
// Paste the two values from your Supabase project here:
// Supabase dashboard → Project Settings → API (also shown as "Connect" → "App Frameworks").
//
// The "anon" / "publishable" key is meant to be public. Your data stays private because of the
// row-level security rules in supabase-setup.sql. Never paste the "service_role" / "secret" key here.
//
// Until these are filled in, the site still works: everyone's timeline is saved in their own browser.
window.CHRONOLINE_CONFIG = {
  supabaseUrl: "https://YOUR-PROJECT-ID.supabase.co",
  supabaseAnonKey: "YOUR-ANON-KEY"
};
