[Setup]
AppName=FlightGear
AppVersion=2024.1
DefaultDirName={pf}\FlightGear
DefaultGroupName=FlightGear
OutputBaseFilename=FlightGearInstaller
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "{env:ROOT_DIR}\install\*"; DestDir: "{app}"; Flags: recursesubdirs

[Icons]
Name: "{group}\FlightGear"; Filename: "{app}\bin\fgfs.exe"
Name: "{commondesktop}\FlightGear"; Filename: "{app}\bin\fgfs.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; Group: "Additional icons"; Flags: unchecked

