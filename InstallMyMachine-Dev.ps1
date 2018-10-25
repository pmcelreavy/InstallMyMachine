# Description: Boxstarter Script for DEV machine
# Author: Patrick McElreavy
# Based off https://github.com/laurentkempe/Cacao

#Disable-UAC

#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

#--- Windows Subsystems/Features ---
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Define Packages to Install ---
$Packages = 'git',`
            'poshgit',`
            'vscode',`
            'notepadplusplus',`
            'nodejs',`
            'FiraCode',`
            '7zip',`
            'GoogleChrome',`
            'paint.net',`
            'rapidee',`
	    'f.lux',`
	    'gitkraken',`
	    'postman',`
	    'wiztree',`
	    'far',
	    'displayfusion'
			

#--- Install Packages ---
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Enable-UAC
#Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula
