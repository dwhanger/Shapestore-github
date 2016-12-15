#
# Restart IIS..
#
Start-Service -Name "w3svc"

#
# Create a new virtual directory...
#
New-WebVirtualDirectory -Site "Default Web Site" -Name shapestore -PhysicalPath c:\inetpub\wwwroot\shapestore -Force

#
# Convert the virtual directory to a web application...
#
ConvertTo-WebApplication -ApplicationPool "DefaultAppPool" -Force "IIS:\Sites\Default Web Site\shapestore"

Get-ChildItem 'IIS:\Sites\Default Web Site'
