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

## Mandatory FIRG Pre-Read And External-Change Safeguard

- Before material work read this file and applicable scoped instructions. For fixes or external integration, read `FIRG/AGENTS.md`, `FIRG/README.md`, and relevant `FIRG/FIX-HISTORY.md` entries before edits or decisions.
- Review functional changes from upstream, contributors, forks or vendors through FIRG before accepting, applying, merging, rebasing or cherry-picking into the protected branch.
- If required FIRG files or tools are missing, repair them against the approved specification before treating incoming changes as reviewed; preserve unknown material.
- Record each material fix's source, intent, commit evidence, components, expected behavior and tests in the canonical registry; validate and regenerate the ledger. Follow native history rules independently.
- Use an isolated branch, worktree or equivalent non-destructive review. Run applicable validation and regression tests. A clean merge or AI judgment is not proof. Report and resolve or obtain approval for FAIL and UNVERIFIED outcomes before integration.
- Never bypass, disable or forge checks, records or evidence. Preserve unrelated work and escalate unresolved owner-level conflicts.
