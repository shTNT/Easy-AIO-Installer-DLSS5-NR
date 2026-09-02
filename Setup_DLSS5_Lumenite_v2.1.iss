#define MyAppName "Easy AIO Installer: DLSS 5 + RenoDX + Lumenite ReShade Pack"
#define MyAppVersion "2.1"
#define MyAppPublisher "Kry0genik"
#define BasePath "D:\NEURAL INJECTION DLSS5\STREAMLINE\streamline (actualizado)\INSTALADOR"

[Setup]
AppId={{A9E8D12F-43B2-4E87-8C52-19B1A0021C42}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\My Game
DirExistsWarning=no
EnableDirDoesntExistWarning=no
AppendDefaultDirName=no
ShowLanguageDialog=yes

; MULTI-GAME INSTALLATION FIXES
UsePreviousAppDir=no
CreateUninstallRegKey=no
UpdateUninstallLogAppName=no
Uninstallable=yes

; Best compromise: no forced UAC, but allow elevation if user needs to
; write into protected folders (e.g., Program Files). This reduces
; SmartScreen/AV triggers while still working in protected locations.
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

OutputDir=.\
OutputBaseFilename=EasyAIO_DLSS5_Lumenite_v2.1_Setup
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
DisableWelcomePage=no

; Wizard sidebar image
WizardImageFile={#BasePath}\FOTOINSTALLER\fotoinstalador.bmp

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"

[Messages]
en.SelectDirLabel3=Select the GAME'S FOLDER (the one that contains its main .exe) — not a shortcut, not the launcher.%n%nExample: C:\Games\GameName
en.SelectDirBrowseLabel=Click "Browse" and pick the game's install folder. The installer will check whether it finds a .exe there.
en.ButtonFinish=I've got it!

es.SelectDirLabel3=Selecciona la CARPETA del juego (la que contiene su .exe principal) — no un acceso directo, ni el launcher.%n%nEjemplo: C:\Juegos\NombreDelJuego
es.SelectDirBrowseLabel=Pulsa "Examinar" y elige la carpeta de instalación del juego. El instalador comprobará si detecta un .exe ahí.
es.ButtonFinish=¡Entendido!

[CustomMessages]
en.MusicCheckbox=Music
es.MusicCheckbox=Música

en.DXPageCaption=Graphics Engine Configuration
es.DXPageCaption=Configuración del motor gráfico
en.DXPageDesc=Does your game have Native DLSS support built in?
es.DXPageDesc=¿Tu juego tiene soporte NATIVO de DLSS integrado?
en.DXPageSub=Choose the correct add-on for your game:
es.DXPageSub=Elige el add-on correcto para tu juego:

en.DXOptionYes=[YES] The game has Native DLSS support (installs dlss5-dx11-bridge.addon64)
es.DXOptionYes=[SÍ] El juego tiene soporte nativo de DLSS (instala dlss5-dx11-bridge.addon64)
en.DXOptionNo=[NO] The game does NOT have Native DLSS support (installs dlss5-feed.addon64)
es.DXOptionNo=[NO] El juego NO tiene soporte nativo de DLSS (instala dlss5-feed.addon64)

en.DXReqTitle=Requirements for both options:
es.DXReqTitle=Requisitos para ambas opciones:

en.DXReqBody=• The game must have a working depth buffer%n• Wide compatibility: DX9 to DX12%n• Compatible with x32 and x64 games%n• RTX 30 series or newer recommended (not mandatory, but affects performance)
es.DXReqBody=• El juego debe tener un depth buffer funcional%n• Amplia compatibilidad: DX9 hasta DX12%n• Compatible con juegos de 32 y 64 bits%n• Se recomienda RTX serie 30 o superior (no obligatorio, pero afecta al rendimiento)

en.ReshadePopup=MANDATORY RESHADE REQUIREMENT!%n%nDo you have ReShade 6.8.0+ with FULL ADD-ON SUPPORT installed in this folder?%n%n• YES: Proceed with installation.%n• NO: Open the official website to download it.%n%n(The standard version without add-on support will NOT work with Neural Injection).%n%nWhen you install ReShade itself, on the effect-selection screen we recommend checking NOTHING — just click Next, Next (this pack adds its own shaders separately).%n%nIf you're re-installing or coming from another pack, please do a CLEAN install first: uninstall ReShade and remove leftover files (dxgi.dll, d3d11.dll, ReShade64.dll, the reshade-shaders folder) before continuing.%n%nWARNING: This installer will overwrite the existing ReShade.ini in the selected game folder.
es.ReshadePopup=¡REQUISITO OBLIGATORIO DE RESHADE!%n%n¿Tienes ReShade 6.8.0+ con SOPORTE COMPLETO DE ADD-ONS instalado en esta carpeta?%n%n• SÍ: Continuar con la instalación.%n• NO: Abrir la web oficial para descargarlo.%n%n(La versión estándar sin soporte de add-ons NO funcionará con Neural Injection).%n%nAl instalar ReShade, en la pantalla de selección de efectos te recomendamos NO marcar ninguna casilla — pulsa Siguiente, Siguiente sin más (este pack añade sus propios shaders por separado).%n%nSi reinstalas o vienes de otro pack, haz antes una instalación LIMPIA: desinstala ReShade y borra los archivos residuales (dxgi.dll, d3d11.dll, ReShade64.dll, la carpeta reshade-shaders) antes de continuar.%n%nADVERTENCIA: Este instalador sobrescribirá el ReShade.ini existente en la carpeta del juego seleccionada.

en.NoExeFound=No .exe file was found in or immediately below this folder:%n%n%1%n%nMake sure you selected the game's installation folder, not a shortcut or launcher folder.%n%nDo you want to continue anyway with this folder?
es.NoExeFound=No se ha detectado ningún archivo .exe en esta carpeta ni inmediatamente dentro de una subcarpeta:%n%n%1%n%nAsegúrate de haber seleccionado la carpeta de instalación del juego, no una carpeta de acceso directo o del launcher.%n%n¿Quieres continuar de todas formas con esta carpeta?

en.InstallPaused=Installation paused.%nPlease install ReShade with Full Add-on Support and run the installer again.
es.InstallPaused=Instalación pausada.%nPor favor, instala ReShade con soporte completo de add-ons y vuelve a ejecutar el instalador.

en.FinishedExtra=Usage Controls%n%n[HOME] Opens / closes the ReShade overlay%n[DEL] Toggles effects ON/OFF%n[PRINT SCREEN] Takes a screenshot (saved in the game folder or in the path configured in ReShade.ini — usually .\ReShade Screenshots)%n%nYou can tweak DLSS5 Neural Rendering from the "Add-ons" tab (open the overlay with HOME). Use the "NR Intensity" slider to strengthen or lower the effect. If the sliders appear greyed out, adjust the color channel sliders instead.%n%nEnjoy the pack!
es.FinishedExtra=Controles de Uso%n%n[HOME] Abre / cierra el overlay de ReShade%n[SUPR] Activa / desactiva los efectos%n[IMPR PANT] Captura de pantalla (se guarda en la carpeta del juego o en la ruta configurada en ReShade.ini — normalmente .\ReShade Screenshots)%n%nPuedes ajustar el Neural Rendering de DLSS5 desde la pestaña "Add-ons" (abre el overlay con HOME). Usa el control deslizante "NR Intensity" para potenciar o bajar el efecto. Si los sliders aparecen en gris, ajusta los del canal de color correspondiente.%n%n¡Disfruta del pack!

en.AddonConflict=A different DLSS add-on was detected in this folder.%nThe current selection will replace it.%n%nDo you want to continue?
es.AddonConflict=Se ha detectado un add-on DLSS diferente en esta carpeta.%nLa selección actual lo reemplazará.%n%n¿Quieres continuar?

[Files]
; -------------------------------------------------------------------
; INSTALLER TEMPORARY RESOURCES
; -------------------------------------------------------------------
Source: "{#BasePath}\MUSICA INSTALLER\musicainstalador.mp3"; DestDir: "{tmp}"; Flags: dontcopy

; -------------------------------------------------------------------
; 1. DLLS FOLDER
; -------------------------------------------------------------------
Source: "{#BasePath}\DLLS\*"; DestDir: "{app}"; Flags: ignoreversion

; -------------------------------------------------------------------
; 2. DLSS5FEEDFX FOLDER
; -------------------------------------------------------------------
Source: "{#BasePath}\DLSS5FEEDFX\DLSS5_Feed.fx"; DestDir: "{app}\reshade-shaders\Shaders"; Flags: ignoreversion

; -------------------------------------------------------------------
; 3. PREBAKED CONFIGURATIONS
; -------------------------------------------------------------------
Source: "{#BasePath}\PREBAKEDRESHADEINI\ReShade.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BasePath}\PREBAKEDRESHADEPRESET\ReshadePreset.ini"; DestDir: "{app}"; Flags: ignoreversion

; -------------------------------------------------------------------
; 4. LUMENITE FOLDER
; -------------------------------------------------------------------
Source: "{#BasePath}\LUMENITE\Shaders\*"; DestDir: "{app}\reshade-shaders\Shaders"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BasePath}\LUMENITE\Textures\*"; DestDir: "{app}\reshade-shaders\Textures"; Flags: ignoreversion recursesubdirs createallsubdirs

; -------------------------------------------------------------------
; 5. CONDITIONAL ADD-ONS
; -------------------------------------------------------------------
Source: "{#BasePath}\SIDLSS\dlss5-dx11-bridge.addon64"; DestDir: "{app}"; Flags: ignoreversion; Check: HasNativeDLSS
Source: "{#BasePath}\NODLSS\dlss5-feed.addon64"; DestDir: "{app}"; Flags: ignoreversion; Check: HasNoNativeDLSS

[Code]

function mciSendString(lpszCommand: String; lpszReturnString: String; cchReturn: Integer; hwndCallback: Integer): Integer;
external 'mciSendStringW@winmm.dll stdcall';

function MessageBeep(uType: UINT): BOOL;
external 'MessageBeep@user32.dll stdcall';

var
  PageDXChoice: TInputOptionWizardPage;
  MusicCheckBox: TNewCheckBox;
  ReqTitle: TNewStaticText;
  ReqBody: TNewStaticText;
  OrigFinishedLabel: String;

procedure MusicCheckBoxClick(Sender: TObject);
begin
  if MusicCheckBox.Checked then
    mciSendString('play bgm from 0 repeat', '', 0, 0)
  else
    mciSendString('stop bgm', '', 0, 0);
end;

procedure InitializeWizard();
var
  mp3Path: String;
begin
  ExtractTemporaryFile('musicainstalador.mp3');
  mp3Path := ExpandConstant('{tmp}\musicainstalador.mp3');
  mciSendString('open "' + mp3Path + '" type mpegvideo alias bgm', '', 0, 0);

  MusicCheckBox := TNewCheckBox.Create(WizardForm);
  MusicCheckBox.Parent := WizardForm;
  MusicCheckBox.Left := ScaleX(20);
  MusicCheckBox.Top := WizardForm.CancelButton.Top + ScaleY(3);
  MusicCheckBox.Width := ScaleX(120);
  MusicCheckBox.Height := ScaleY(17);
  MusicCheckBox.Caption := CustomMessage('MusicCheckbox');
  MusicCheckBox.Checked := True;
  MusicCheckBox.OnClick := @MusicCheckBoxClick;

  mciSendString('play bgm from 0 repeat', '', 0, 0);

  OrigFinishedLabel := WizardForm.FinishedLabel.Caption;

  PageDXChoice := CreateInputOptionPage(wpSelectDir,
    CustomMessage('DXPageCaption'),
    CustomMessage('DXPageDesc'),
    CustomMessage('DXPageSub'),
    True, False);

  PageDXChoice.Add(CustomMessage('DXOptionYes'));
  PageDXChoice.Add(CustomMessage('DXOptionNo'));
  PageDXChoice.Values[1] := True;

  PageDXChoice.CheckListBox.Height := ScaleY(50);

  ReqTitle := TNewStaticText.Create(WizardForm);
  ReqTitle.Parent := PageDXChoice.Surface;
  ReqTitle.Left := PageDXChoice.CheckListBox.Left;
  ReqTitle.Top := PageDXChoice.CheckListBox.Top + PageDXChoice.CheckListBox.Height + ScaleY(16);
  ReqTitle.Width := PageDXChoice.CheckListBox.Width;
  ReqTitle.AutoSize := True;
  ReqTitle.WordWrap := True;
  ReqTitle.Caption := CustomMessage('DXReqTitle');
  ReqTitle.Font.Style := [fsBold];

  ReqBody := TNewStaticText.Create(WizardForm);
  ReqBody.Parent := PageDXChoice.Surface;
  ReqBody.Left := PageDXChoice.CheckListBox.Left;
  ReqBody.Top := ReqTitle.Top + ReqTitle.Height + ScaleY(8);
  ReqBody.Width := PageDXChoice.CheckListBox.Width;
  ReqBody.Height := ScaleY(80);
  ReqBody.AutoSize := False;
  ReqBody.WordWrap := True;
  ReqBody.Caption := CustomMessage('DXReqBody');
end;

procedure DeinitializeSetup();
begin
  mciSendString('close bgm', '', 0, 0);
end;

function HasNativeDLSS: Boolean;
begin
  Result := PageDXChoice.Values[0];
end;

function HasNoNativeDLSS: Boolean;
begin
  Result := PageDXChoice.Values[1];
end;

function GetExistingAddon(): String;
begin
  if FileExists(ExpandConstant('{app}\dlss5-dx11-bridge.addon64')) then
    Result := 'bridge'
  else if FileExists(ExpandConstant('{app}\dlss5-feed.addon64')) then
    Result := 'feed'
  else
    Result := '';
end;

function FolderContainsExe(const Dir: String): Boolean;
var
  FindRec: TFindRec;
  SubFindRec: TFindRec;
  SubDir: String;
begin
  Result := False;

  // Check root folder
  if FindFirst(AddBackslash(Dir) + '*.exe', FindRec) then
  begin
    Result := True;
    FindClose(FindRec);
    Exit;
  end;

  // Check immediate subfolders
  if FindFirst(AddBackslash(Dir) + '*', SubFindRec) then
  begin
    try
      repeat
        if (SubFindRec.Name <> '.') and
           (SubFindRec.Name <> '..') and
           ((SubFindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY) <> 0) then
        begin
          SubDir := AddBackslash(Dir) + SubFindRec.Name;
          if FindFirst(SubDir + '\*.exe', FindRec) then
          begin
            Result := True;
            FindClose(FindRec);
            Exit;
          end;
        end;
      until not FindNext(SubFindRec);
    finally
      FindClose(SubFindRec);
    end;
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
  Response: Integer;
  ExistingAddon: String;
begin
  Result := True;

  if CurPageID = wpSelectDir then
  begin
    if not FolderContainsExe(WizardDirValue) then
    begin
      Response := MsgBox(FmtMessage(CustomMessage('NoExeFound'), [WizardDirValue]), mbConfirmation, MB_YESNO);
      if Response = IDNO then
      begin
        Result := False;
        Exit;
      end;
    end;

    Response := MsgBox(CustomMessage('ReshadePopup'), mbConfirmation, MB_YESNO);
    if Response = IDNO then
    begin
      ShellExec('open', 'https://reshade.me/#download', '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
      MsgBox(CustomMessage('InstallPaused'), mbError, MB_OK);
      Result := False;
      Exit;
    end;
  end
  else if CurPageID = PageDXChoice.ID then
  begin
    ExistingAddon := GetExistingAddon();
    if (HasNativeDLSS and (ExistingAddon = 'feed')) or
       (HasNoNativeDLSS and (ExistingAddon = 'bridge')) then
    begin
      Response := MsgBox(CustomMessage('AddonConflict'), mbConfirmation, MB_YESNO);
      if Response = IDNO then
        Result := False;
    end;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
var
  ExtraText: String;
begin
  if CurPageID = wpFinished then
  begin
    ExtraText := CustomMessage('FinishedExtra');

    WizardForm.FinishedLabel.Caption := OrigFinishedLabel + #13#10#13#10 + ExtraText;
    WizardForm.FinishedLabel.WordWrap := True;
    WizardForm.FinishedLabel.AutoSize := False;
    WizardForm.FinishedLabel.Height := ScaleY(300); // enough for all text
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    if HasNativeDLSS then
      DeleteFile(ExpandConstant('{app}\dlss5-feed.addon64'))
    else
      DeleteFile(ExpandConstant('{app}\dlss5-dx11-bridge.addon64'));
    MessageBeep($40);
  end;
end;