# Help & Frequently Asked Questions (FAQ) | قسم الأسئلة الشائعة والمساعدة

Welcome to the official ReCodera-AI Notepad++ Community Edition Help and Knowledge Base. This portal serves as an authoritative technical reference for troubleshooting common issues, installation best practices, and language configuration.

مرحباً بك في البوابة الرسمية للدعم الفني والأسئلة الشائعة لنسخة مجتمع ReCodera-AI من Notepad++. يُعد هذا القسم مرجعاً علمياً وتقنياً شاملاً لحل المشكلات الشائعة وتوضيح معمارية البرنامج للمستخدمين والمطورين.

---

## Technical Guides & Troubleshooting Index | دليل استكشاف الأخطاء وإصلاحها

<div align="center">

| Section | Article / Topic | Coverage | Status |
| :--- | :--- | :--- | :---: |
| **Markdown & UDL** | [Missing Markdown Syntax Highlighting](troubleshooting/markdown-syntax-highlighting-missing.md) | Resolution for missing `.md` colors after clean installs or AppData cleanup | Resolved in v2026.11.22.02 |
| **Language Support** | [Bundled Languages & Model Files](troubleshooting/markdown-syntax-highlighting-missing.md#bundled-languages) | Overview of Scintilla lexers, UDL, and localization coverage | Comprehensive |
| **Installation** | [Admin Installer & Directory Routing](../../AGENTS.md#release-packaging-and-platform-distribution-standards) | Clean overwrite, Program Files standards, and Start Menu shortcuts | Active |

</div>

---

## Frequently Asked Questions | الأسئلة الشائعة

### 1. Does Notepad++ support Markdown (`.md`) files? | هل يدعم Notepad++ ملفات الماركداون؟
**Yes.** Notepad++ fully supports Markdown files through its pre-installed User Defined Language (UDL). In versions `v2026.11.22.02` and later, the application includes automatic self-healing logic that ensures default UDL files are automatically populated into the user's `%APPDATA%` profile upon startup.

**نعم.** يدعم Notepad++ ملفات Markdown بشكل كامل عبر لغة المستخدم المعرفة مسبقاً (UDL). بدءاً من الإصدار `v2026.11.22.02`، يحتوي البرنامج على معمارية استرداد ذاتي تضمن توفير ملفات تعريف الماركداون تلقائياً في مسار المستخدم `%APPDATA%` عند أول إقلاع.

---

### 2. What should I do if a clean install shows `.md` files in plain text? | ماذا أفعل إذا ظهرت ملفات MD كنص عادي؟
Consult the comprehensive step-by-step diagnostic and manual restoration guide:
- [Missing Markdown Syntax Highlighting Guide](troubleshooting/markdown-syntax-highlighting-missing.md)

---

### 3. Which languages are bundled in the official release packages? | ما هي اللغات المرفقة بالحزمة؟
All official installer and portable packages bundle:
- **80+ Programming Languages**: Maintained in `langs.model.xml` (C++, Python, Rust, JavaScript, HTML, CSS, SQL, etc.).
- **Pre-installed UDLs**: Markdown Light and Dark Mode profiles in `userDefineLangs/`.
- **90+ UI Localizations**: Comprehensive internationalization files in `localization/`.
- **API Auto-completions**: Autocomplete descriptors in `autoCompletion/`.
- **Function List Parsers**: In `functionList/`.
