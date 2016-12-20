#
# Restart IIS..
#
Start-Service -Name "w3svc"

#
# Create a new virtual directory...
#
New-WebVirtualDirectory -Site "Default Web Site" -Name "shapestore" -PhysicalPath "$Env:systemdrive\inetpub\wwwroot\shapestore"

#
# Convert the virtual directory to a web application...
#
ConvertTo-WebApplication -PSPath "IIS:\Sites\Default Web Site\shapestore"

