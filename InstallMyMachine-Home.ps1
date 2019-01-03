# Description: Boxstarter Script for Home machine
# Author: Patrick McElreavy
# Based off https://github.com/laurentkempe/Cacao

Disable-UAC

#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Install PowerShell Modules
Install-Module -Name PSColor

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

#--- Windows Subsystems/Features ---
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Define Packages to Install ---
$Packages = `
	'GoogleChrome',`
	'7zip',`
	'etcher',`
	'far',`
	'git',`
    	'notepadplusplus',`
    	'nodejs',`
    	'FiraCode',`
	'Firefox',`
	'eac',`
	'lame',`
	'mediamonkey',`
	'mkvtoolnix',`
	'putty',`
	'renamer',`
	'teamviewer',`
	'trillian',`
	'vlc'`
    	'paint.net',`
	'f.lux',`
	'wiztree',`
	'powerpanel-personal',
	'displayfusion'


#--- Install Packages ---
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
