# Publish The Project Homepage

The Pages workflow is configured in `.github/workflows/pages.yml`. The first deployment failed at `actions/configure-pages` because the repository had no GitHub Pages site enabled (`Get Pages site failed: Not Found`). The source and workflow were checked out successfully; the failure is a repository setting, not a missing website file.

Enable Pages once in the ReCodera-AI repository:

1. Open **Settings → Pages**.
2. Under **Build and deployment**, set **Source** to **GitHub Actions**.
3. Save the setting.
4. Open **Actions → Publish project homepage** and rerun the failed run, or push a later change under `docs/`.

The workflow already declares `pages: write` and `id-token: write`. The current release is source-only; this Pages setting does not create or verify Notepad++ application binaries.