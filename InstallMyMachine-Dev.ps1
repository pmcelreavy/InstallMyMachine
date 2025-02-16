# Description: Boxstarter Script for DEV machine
# Author: Patrick McElreavy
# Based off https://github.com/laurentkempe/Cacao

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv

# Install PowerShell Modules
Install-Module -Name PSColor

#Disable-UAC

#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

#--- Windows Subsystems/Features ---
#    To see the list of available features: choco list --source windowsfeatures
$Features = `
	'Microsoft-Hyper-V-All',`
	'Microsoft-Windows-Subsystem-Linux',`
	'IIS-WebServerRole',`
	'IIS-WebServer',`
	'IIS-HttpErrors',`
	'IIS-ApplicationDevelopment',`
	'IIS-NetFxExtensibility',`
	'IIS-NetFxExtensibility45',`
	'IIS-HealthAndDiagnostics',`
	'IIS-HttpLogging',`
	'IIS-Security',`
	'IIS-URLAuthorization',`
	'IIS-RequestFiltering',`
	'IIS-Performance',`
	'IIS-WebServerManagementTools',`
	'WCF-Services45',`
	'WCF-TCP-PortSharing45',`
	'IIS-WindowsAuthentication',`
	'IIS-DigestAuthentication',`
	'IIS-StaticContent',`
	'IIS-DefaultDocument',`
	'IIS-DirectoryBrowsing',`
	'IIS-WebSockets',`
	'IIS-ApplicationInit',`
	'IIS-ASPNET',`
	'IIS-ASPNET45',`
	'IIS-ASP',`
	'IIS-ISAPIExtensions',`
	'IIS-ISAPIFilter',`
	'IIS-ServerSideIncludes',`
	'IIS-BasicAuthentication',`
	'IIS-HttpCompressionStatic',`
	'IIS-ManagementConsole',`
	'NetFx4-AdvSrvs',`
	'NetFx4Extended-ASPNET45'

#--- Install Features ---
ForEach ($FeatureName in $Features) {
  choco install -y $FeatureName -source windowsfeatures
}


#--- Define Packages to Install ---
$Packages = `
	'7zip',`
	'conemu',`
        'dotnet-9.0-sdk',`
	'dotnet-desktopruntime',`
	'dotnet-sdk',`
        'dotnet-aspnetcoremodule-v2',`
	'dotnetfx',`
	'FiraCodeNF',`
        'fzf',`
	'git',`
	'gitkraken',`
	'GoogleChrome',`
        'jabra-direct',`
	'linqpad',`
        'logioptionsplus',`
	'netfx-4.8.1-devpack',`
	'nodejs',`
	'notepadplusplus',`
	'oh-my-posh',`
	'paint.net',`
	'poshgit',`
	'postman',`
	'powershell-core',`
	'powertoys',`
	'procexp',`
	'rapidee',`
	'sql-server-management-studio',`
	'visualstudio2022professional',`
	'vscode',`
	'wiztree',`
        'zoxide'
			

#--- Install Packages ---
ForEach ($PackageName in $Packages) {
  choco install $PackageName -y
}

#Enable-UAC
#Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula

refreshenv
