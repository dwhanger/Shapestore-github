powershell.exe -Command Import-Module -Name ServerManager
$P = powershell.exe -Command Install-WindowsFeature Web-Server -IncludeAllSubFeature -IncludeManagementTools
if ($P -match "True") { exit 0 } else { exit 1 }
