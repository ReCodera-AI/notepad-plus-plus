<p align="center">
  <img src="docs/assets/covers/cover-neon-chameleon.png" alt="Notepad++ ReCodera-AI Community Edition" width="100%" style="border-radius: 12px; box-shadow: 0 12px 36px rgba(0,0,0,0.18); max-width: 960px;">
</p>

<div align="center">

# Notepad++ ReCodera-AI Community Edition
### Bidirectional Text And Right-To-Left Editing Improvements

[![Release v2026.11.22.02](docs/assets/badges/release.svg)](https://github.com/ReCodera-AI/notepad-plus-plus/releases/tag/v2026.11.22.02)
[![Independent version identifier R-E-I](docs/assets/badges/version.svg)](docs/releases/v2026.11.22.02.md)
[![12 build checks passed](docs/assets/badges/build.svg)](https://github.com/ReCodera-AI/notepad-plus-plus/actions)
[![Windows, Linux, and macOS compatibility](docs/assets/badges/platform.svg)](https://github.com/ReCodera-AI/notepad-plus-plus/releases)
[![English](docs/assets/badges/language.svg)](README.md)
[![GPL v3 or later license](docs/assets/badges/license.svg)](LICENSE)

</div>

> **Independent Community Project:** This ReCodera-AI edition is developed and released independently. It is not affiliated with, sponsored by, or endorsed by the original Notepad++ project or its maintainers.

## Highlights

- Improved mixed Arabic and English layout, measurement, caret placement, selections, and backgrounds in left-to-right documents.
- Added a GDI and Uniscribe rendering path for mirrored right-to-left views, keeping English text in natural reading order.
- Added full-line DirectWrite drawing for cohesive bidirectional shaping and wrapping.
- Fixed trailing line background gaps and dark strips.
- Persisted text direction per document and improved caret, hit-testing, selection, and indicator alignment.
- Switched rendering technology automatically when changing document direction and restored the configured renderer when returning to left-to-right mode.

## Downloads And Platforms

Windows application EXEs are available for x64 (AMD64), x86 (Win32), ARM64, x64 GCC, x86 GCC, and x64 Clang, with portable ZIP archives for MSVC x64, x86, and ARM64. Linux and macOS archives are compatibility packages that run the Windows x64 build through Wine or CrossOver; they are not native builds. Windows installers are available for x64, x86, and ARM64. Download packages from the [GitHub Releases page](https://github.com/ReCodera-AI/notepad-plus-plus/releases).

The Windows application and file properties display the same independent release identifier as the tag. The Notepad++ plug-in API version remains at its upstream-compatible value. See the [release notes](docs/releases/v2026.11.22.02.md) and [build instructions](BUILD.md).

## Attribution And License

Notepad++ remains the work of Don Ho and its original contributors. This community edition is distributed under the [GNU General Public License v3 or later](LICENSE).
