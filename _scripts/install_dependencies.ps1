# Wow....this works!  Setup a .bat file to be called from your appspec.yml and then have the .bat file call powershell with this same base named powershell script file...
#
# Example of doing this with the %~dpn0 moniker in order to get to the base filename...
#     PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
# 
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList 'Import-Module -Name ServerManager' -Verb RunAs}"
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList 'Install-WindowsFeature Web-Server -IncludeAllSubFeature -IncludeManagementTools' -Verb RunAs}"

#
# Prepare for the install of the new code....
# .....backup the previous version of the app...and remove the directory...
#
xcopy c:\inetpub\wwwroot\shapestore c:\inetpub\wwwroot\shapestore.bak /s /i
rmdir /s /q c:\inetpub\wwwroot\shapestore
