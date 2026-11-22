# Project Agent Instructions

## Independent Release Identification (R-E-I)

- This fork uses its own release identifiers, independent of upstream Notepad++ releases. The first identifier is `v2026.11.15.01`.
- Use `vYYYY.MM.DD.NN` for release tags and displayed release identifiers: the calendar date followed by a two-digit sequence starting at `01` for that date. Increment the sequence for additional releases on the same date; never reuse a published identifier.
- Keep project-owned version declarations, release documentation, build outputs, and package names consistent with the applicable R-E-I identifier. Preserve third-party component versions and historical references as provenance.
- Where Windows requires four numeric version fields, represent `vYYYY.MM.DD.NN` as `YYYY,MM,DD,NN` in numeric resources and retain the canonical zero-padded identifier in displayed strings. Verify platform-specific limits and update mechanisms before changing their version comparisons.

## Release Naming And Description

- Set each GitHub Release name to the application name followed by its independent release identifier, for example `Notepad++ v2026.11.15.01`.
- Begin the release description with a Markdown H1 containing the project name, application name, and identifier in this form: `# ReCodera-AI Community Edition | Notepad++ v2026.11.15.01`.
- Write release descriptions in the established format of the `v2026.11.15.01` release, retaining its concise change summary, categorized release details, verification evidence, and download information as applicable. Keep the release name, description heading, tag, and project-owned version declarations consistent.

## Release Packaging And Platform Distribution Standards

- **Canonical Asset Matrix & Naming**:
  - Standalone Executables: `Notepad++_vYYYY.MM.DD.NN_<arch>.exe` (e.g. `_x64.exe`, `_x86.exe`, `_ARM64.exe`).
  - Portable Archives: `Notepad++_vYYYY.MM.DD.NN_Portable_<arch>.zip` containing the standalone executable, runtime model files (`langs.model.xml`, `stylers.model.xml`), and license/changelog files.
  - Windows Installers: `Notepad++_vYYYY.MM.DD.NN_Installer_<arch>.exe` (for `x64`, `x86`, and `ARM64`).
  - Compatibility Archives: `Notepad++_vYYYY.MM.DD.NN_<Platform>_Wine_x64.tar.gz` for `Linux` and `macOS` (running the Windows x64 build via Wine or CrossOver).

- **Windows Installer (NSIS) Architecture & Path Standards**:
  - **Administrative Execution Level (`RequestExecutionLevel admin`)**: Windows installers must require administrative elevation to install into system directories and write to machine-level registry keys (`HKLM`).
  - **Target Installation Path Governance**:
    - For 64-bit (`x64`) and ARM64: Default to `$PROGRAMFILES64\Notepad++` (typically `C:\Program Files\Notepad++`).
    - For 32-bit (`x86`): Default to `$PROGRAMFILES\Notepad++` (`C:\Program Files (x86)\Notepad++` on 64-bit Windows; `C:\Program Files\Notepad++` on 32-bit Windows).
    - **In-Place Upgrade & Overwrite Rule**: The installer must inspect `HKLM\Software\Notepad++` for existing installations. If present, it must target that existing location to cleanly overwrite and update the prior version in-place. Never divert installers to user-scoped directories (such as `%LOCALAPPDATA%\Programs\...`) unless explicitly commissioned as a dedicated per-user package.
  - **Running Process & Mutex Guard**:
    - The installer must inspect the `nppInstance` mutex upon startup. If a running instance is detected, it must prompt the user to close Notepad++ and click Retry before copying files, preventing file-lock errors (`ERROR_ACCESS_DENIED`) on `notepad++.exe`.
  - **System Registration & Shortcuts**:
    - Register installation paths in `HKLM\Software\Notepad++` and `HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe` so system invocation commands resolve to the installed build.
    - Register in `HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Notepad++` with full metadata (Publisher: `ReCodera-AI`, URL: `https://github.com/ReCodera-AI/notepad-plus-plus`, and version).
    - Create the primary all-users Start Menu shortcut: `$SMPROGRAMS\Notepad++.lnk`.
    - Automatically clean up obsolete per-user shortcuts and registry keys left by prior experimental installations.
    - Provide a Finish page run option (`MUI_FINISHPAGE_RUN`) to launch the installed application immediately.

- **Linux & macOS Wine Compatibility Packages**:
  - Wrap the verified Windows x64 binaries with a standard launcher script (`notepad++.sh`), bundled configuration, and environment bootstrap.
  - Clearly document that the packages require a local installation of Wine (Linux) or Wine/CrossOver (macOS).

- **Packaging Verification & Release Lifecycle**:
  - Always verify binary architecture, `ProductVersion`, and About dialog strings (`NOTEPAD_PLUS_VERSION` and repository URL) before packaging.
  - Extract and verify installer payloads in a contained sandbox prior to uploading.
  - Replace assets on the existing release tag using atomic deletion and upload (`gh release upload ... --clobber`) rather than fracturing release history across multiple release pages.

## Mandatory FIRG Pre-Read And External-Change Safeguard

- Before material work read this file and applicable scoped instructions. For fixes or external integration, read `FIRG/AGENTS.md`, `FIRG/README.md`, and relevant `FIRG/FIX-HISTORY.md` entries before edits or decisions.
- Review functional changes from upstream, contributors, forks or vendors through FIRG before accepting, applying, merging, rebasing or cherry-picking into the protected branch.
- If required FIRG files or tools are missing, repair them against the approved specification before treating incoming changes as reviewed; preserve unknown material.
- Record each material fix's source, intent, commit evidence, components, expected behavior and tests in the canonical registry; validate and regenerate the ledger. Follow native history rules independently.
- Use an isolated branch, worktree or equivalent non-destructive review. Run applicable validation and regression tests. A clean merge or AI judgment is not proof. Report and resolve or obtain approval for FAIL and UNVERIFIED outcomes before integration.
- Never bypass, disable or forge checks, records or evidence. Preserve unrelated work and escalate unresolved owner-level conflicts.
