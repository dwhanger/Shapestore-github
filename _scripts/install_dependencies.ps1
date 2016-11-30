# REM Called from a .bat file for the below line...
# REM PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
# REM 
# powershell.exe -Command Import-Module -Name ServerManager
# powershell.exe -Command Install-WindowsFeature Web-Server -IncludeAllSubFeature -IncludeManagementTools
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList 'Import-Module -Name ServerManager' -Verb RunAs}"
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList 'Install-WindowsFeature Web-Server -IncludeAllSubFeature -IncludeManagementTools' -Verb RunAs}"
