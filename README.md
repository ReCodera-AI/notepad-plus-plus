<div align="center">
  <img src="docs/assets/covers/cover-chameleon-ribbon-branded.png" alt="Notepad++ and ReCodera-AI Community Build wordmark over emerald chameleon code artwork" width="100%">
  <br>
  <p><img alt="Community Version 8.9.8.2" src="https://img.shields.io/badge/Community%20Version-v8.9.8.2-62e49b?style=for-the-badge&labelColor=111e2c"></p>
  <p>Careful, AI-assisted improvements to an editor trusted by developers around the world.</p>
  <p>
    <a href="https://github.com/ReCodera-AI/notepad-plus-plus/releases">ReCodera-AI Releases</a>
    &nbsp;·&nbsp;
    <a href="https://recodera-ai.github.io/notepad-plus-plus/">Project Homepage</a>
    &nbsp;·&nbsp;
    <a href="https://github.com/notepad-plus-plus/notepad-plus-plus">Original Notepad++ Project</a>
  </p>
</div>

---

## About This Build

Notepad++ is the open-source Windows editor maintained by its original project at [notepad-plus-plus/notepad-plus-plus](https://github.com/notepad-plus-plus/notepad-plus-plus). This repository is an independent ReCodera-AI community build based on that project. It preserves the upstream project’s open-source foundation while exploring focused fixes for real user issues.

ReCodera-AI uses AI-assisted investigation, engineering, and verification to improve open-source software. The original application and project belong to their upstream maintainers; this community build is not an official Notepad++ release and is not affiliated with the upstream maintainers.

## Fixes In This Build

- **Arabic and English text in LTR documents:** corrected visual placement of mixed right-to-left Arabic and left-to-right text while the document remains left-to-right.
- **Remembered RTL display direction:** retain and restore a file’s right-to-left view direction when switching files, reopening files, and restoring sessions.
- **DirectWrite with text direction changes:** keep the preferred DirectWrite renderer available in LTR mode and use a compatible rendering path for RTL mode.

The fixes are implemented in the editor and Scintilla rendering paths. See the [release notes](docs/releases/v8.9.8.2.md) for the detailed change summary and verification record.

## Choose A Cover

Three original cover-art options are included in the [project homepage](https://recodera-ai.github.io/notepad-plus-plus/). The selected cover prints the Notepad++ name and ReCodera-AI project name directly into the artwork; the page displays the community version below it. The first Pages run failed because Pages was not enabled in repository settings. Follow [the deployment steps](docs/DEPLOYMENT.md) to enable **GitHub Actions** as the Pages source.

| Option | Artwork |
| --- | --- |
| Chameleon Ribbon | `docs/assets/covers/cover-chameleon-ribbon-branded.png` |
| Code Architecture | `docs/assets/covers/cover-code-architecture.png` |
| Paper Ribbon | `docs/assets/covers/cover-paper-ribbon.png` |

## Build And Contribute

- Read the upstream [build guide](BUILD.md) before compiling the Windows application.
- Review the upstream [contribution guide](CONTRIBUTING.md) before proposing changes.
- Compare changes against the original [Notepad++ repository](https://github.com/notepad-plus-plus/notepad-plus-plus) when preparing an upstream pull request.
- Read the [GPL license](LICENSE) that governs this project.

## Project Links

- [ReCodera-AI source and releases](https://github.com/ReCodera-AI/notepad-plus-plus)
- [Original Notepad++ project and ownership](https://github.com/notepad-plus-plus/notepad-plus-plus)
