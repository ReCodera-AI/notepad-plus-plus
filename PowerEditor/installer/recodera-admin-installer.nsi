!include "MUI2.nsh"
!include "x64.nsh"

Unicode true
SetCompressor /SOLID lzma
ManifestDPIAware true
RequestExecutionLevel admin

!ifndef ARCH
  !define ARCH "x64"
!endif
!ifndef STAGE_DIR
  !error "STAGE_DIR must be defined"
!endif
!ifndef OUT_FILE
  !error "OUT_FILE must be defined"
!endif

!define APP_NAME "Notepad++"
!define VERSION_STR "v2026.11.22.02"
!define UNINST_REG_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
!define APP_PATHS_KEY "Software\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe"

!if "${ARCH}" == "x64"
  !define ARCH_DISPLAY "64-bit x64"
  !define DEFAULT_DIR "$PROGRAMFILES64\Notepad++"
!else if "${ARCH}" == "arm64"
  !define ARCH_DISPLAY "ARM64"
  !define DEFAULT_DIR "$PROGRAMFILES64\Notepad++"
!else
  !define ARCH_DISPLAY "32-bit x86"
  !define DEFAULT_DIR "$PROGRAMFILES\Notepad++"
!endif

Name "${APP_NAME} ${VERSION_STR} (${ARCH_DISPLAY})"
OutFile "${OUT_FILE}"
InstallDir "${DEFAULT_DIR}"
InstallDirRegKey HKLM "Software\${APP_NAME}" ""

VIProductVersion "2026.11.22.2"
VIAddVersionKey "ProductName" "${APP_NAME}"
VIAddVersionKey "CompanyName" "ReCodera-AI"
VIAddVersionKey "LegalCopyright" "Copyleft 1998-2026 by Don HO, ReCodera-AI"
VIAddVersionKey "FileDescription" "${APP_NAME} Installer (${ARCH_DISPLAY})"
VIAddVersionKey "FileVersion" "2026.11.22.2"
VIAddVersionKey "ProductVersion" "${VERSION_STR}"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "images\npp_inst.ico"
!define MUI_UNICON "images\npp_inst.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "images\headerLeft.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "images\wizard.bmp"

!define MUI_FINISHPAGE_RUN "$INSTDIR\notepad++.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Run ${APP_NAME}"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Function .onInit
!if "${ARCH}" == "x64"
  ${If} ${RunningX64}
    SetRegView 64
    ReadRegStr $0 HKLM "Software\${APP_NAME}" ""
    ${If} $0 != ""
      StrCpy $INSTDIR "$0"
    ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES64\${APP_NAME}"
    ${EndIf}
  ${Else}
    MessageBox MB_OK|MB_ICONSTOP "You cannot install the 64-bit version on a 32-bit Windows system."
    Abort
  ${EndIf}
!else if "${ARCH}" == "arm64"
  ${If} ${RunningX64}
    SetRegView 64
    ReadRegStr $0 HKLM "Software\${APP_NAME}" ""
    ${If} $0 != ""
      StrCpy $INSTDIR "$0"
    ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES64\${APP_NAME}"
    ${EndIf}
  ${EndIf}
!else
  ${If} ${RunningX64}
    SetRegView 32
  ${EndIf}
  ReadRegStr $0 HKLM "Software\${APP_NAME}" ""
  ${If} $0 != ""
    StrCpy $INSTDIR "$0"
  ${Else}
    StrCpy $INSTDIR "$PROGRAMFILES\${APP_NAME}"
  ${EndIf}
!endif

CheckRunning:
  System::Call 'kernel32::OpenMutex(i 0x100000, b 0, t "nppInstance") i .R0'
  IntCmp $R0 0 NotRunning
    System::Call 'kernel32::CloseHandle(i $R0)'
    MessageBox MB_RETRYCANCEL|MB_DEFBUTTON1|MB_ICONSTOP "Cannot continue the installation: Notepad++ is currently running.$\n$\nPlease close Notepad++, then click 'Retry'." IDRETRY CheckRunning IDCANCEL AbortInstall
  AbortInstall:
    Quit
  NotRunning:
FunctionEnd

Section "Install"
!if "${ARCH}" == "x64"
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}
!else if "${ARCH}" == "arm64"
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}
!else
  ${If} ${RunningX64}
    SetRegView 32
  ${EndIf}
!endif

  SetShellVarContext all
  SetOutPath "$INSTDIR"
  File /r "${STAGE_DIR}\*.*"

  ; Ensure userDefineLangs is also provisioned into installing user's AppData
  SetShellVarContext current
  CreateDirectory "$APPDATA\${APP_NAME}\userDefineLangs"
  CopyFiles /SILENT "$INSTDIR\userDefineLangs\*.xml" "$APPDATA\${APP_NAME}\userDefineLangs\"
  SetShellVarContext all

  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; Shortcuts
  CreateShortcut "$SMPROGRAMS\Notepad++.lnk" "$INSTDIR\notepad++.exe" "" "$INSTDIR\notepad++.exe" 0

  ; Registry: App & Uninstall
  WriteRegStr HKLM "Software\${APP_NAME}" "" "$INSTDIR"
  WriteRegStr HKLM "${APP_PATHS_KEY}" "" "$INSTDIR\notepad++.exe"
  WriteRegStr HKLM "${APP_PATHS_KEY}" "Path" "$INSTDIR"

  WriteRegStr HKLM "${UNINST_REG_KEY}" "DisplayName" "Notepad++ (${ARCH_DISPLAY})"
  WriteRegStr HKLM "${UNINST_REG_KEY}" "DisplayVersion" "2026.11.22.02"
  WriteRegStr HKLM "${UNINST_REG_KEY}" "Publisher" "ReCodera-AI"
  WriteRegStr HKLM "${UNINST_REG_KEY}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "${UNINST_REG_KEY}" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "${UNINST_REG_KEY}" "DisplayIcon" '"$INSTDIR\notepad++.exe",0'
  WriteRegStr HKLM "${UNINST_REG_KEY}" "URLInfoAbout" "https://github.com/ReCodera-AI/notepad-plus-plus"
  WriteRegDWORD HKLM "${UNINST_REG_KEY}" "NoModify" 1
  WriteRegDWORD HKLM "${UNINST_REG_KEY}" "NoRepair" 1

  ; Clean up any leftover per-user shortcut or registry from previous local installer runs
  SetShellVarContext current
  Delete "$SMPROGRAMS\Notepad++ (ReCodera-AI, ${ARCH}).lnk"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Notepad++ ReCodera-AI ${ARCH}"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe"
SectionEnd

Section "Uninstall"
!if "${ARCH}" == "x64"
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}
!else if "${ARCH}" == "arm64"
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}
!else
  ${If} ${RunningX64}
    SetRegView 32
  ${EndIf}
!endif

  SetShellVarContext all
  Delete "$SMPROGRAMS\Notepad++.lnk"

  DeleteRegKey HKLM "${UNINST_REG_KEY}"
  DeleteRegKey HKLM "${APP_PATHS_KEY}"
  DeleteRegKey HKLM "Software\${APP_NAME}"

  RMDir /r "$INSTDIR"
SectionEnd
