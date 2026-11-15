<p align="center">
  <img src="docs/assets/covers/cover-neon-chameleon.png" alt="Notepad++ ReCodera-AI Community Edition" width="100%" style="border-radius: 12px; box-shadow: 0 12px 36px rgba(0,0,0,0.18); max-width: 960px;">
</p>

<div align="center">

# Notepad++ ReCodera-AI Community Edition
### Bidirectional Text And Right-To-Left Editing Improvements

[![Release](https://img.shields.io/badge/Release-v2026.11.15.01-22c55e?style=for-the-badge&logo=notepad%2B%2B&logoColor=white&labelColor=111827)](https://github.com/ReCodera-AI/notepad-plus-plus/releases/tag/v2026.11.15.01)
[![Build](https://img.shields.io/badge/Build-Checks-06b6d4?style=for-the-badge&logo=githubactions&logoColor=white&labelColor=111827)](https://github.com/ReCodera-AI/notepad-plus-plus/actions)
[![Windows](https://img.shields.io/badge/Platform-Windows%20x64%20%7C%20x86%20%7C%20ARM64-3b82f6?style=for-the-badge&logo=windows11&logoColor=white&labelColor=111827)](https://github.com/ReCodera-AI/notepad-plus-plus/releases)
[![BiDi](https://img.shields.io/badge/Engine-Uniscribe%20%2B%20DirectWrite-a855f7?style=for-the-badge&logo=windows&logoColor=white&labelColor=111827)](docs/releases/v2026.11.15.01.md)
[![License](https://img.shields.io/badge/License-GPL%20v3%2B-f97316?style=for-the-badge&labelColor=111827)](LICENSE)

</div>

> **Independent Community Project:** This ReCodera-AI edition is developed and released independently. It is not affiliated with, sponsored by, or endorsed by the original Notepad++ project or its maintainers.

This fork packages the bidirectional text and right-to-left editing work described in [PR #18596](https://github.com/notepad-plus-plus/notepad-plus-plus/pull/18596), which was closed without being merged upstream.

## Highlights

- Improved mixed Arabic and English layout, measurement, caret placement, selections, and backgrounds in left-to-right documents.
- Added a GDI and Uniscribe rendering path for mirrored right-to-left views, keeping English text in natural reading order.
- Added full-line DirectWrite drawing for cohesive bidirectional shaping and wrapping.
- Fixed trailing line background gaps and dark strips.
- Persisted text direction per document and improved caret, hit-testing, selection, and indicator alignment.
- Switched rendering technology automatically when changing document direction and restored the configured renderer when returning to left-to-right mode.

## Downloads And Platforms

Release packages are published on the [GitHub Releases page](https://github.com/ReCodera-AI/notepad-plus-plus/releases). Supported build targets are Windows x64 (AMD64), x86 (Win32), and ARM64. Linux packages are not provided by the Windows-native Notepad++ build system.

The release tag is independent of the application's embedded version metadata. See the [release notes](docs/releases/v2026.11.15.01.md) and [build instructions](BUILD.md).

## Attribution And License

Notepad++ remains the work of Don Ho and its original contributors. This community edition is distributed under the [GNU General Public License v3 or later](LICENSE).
