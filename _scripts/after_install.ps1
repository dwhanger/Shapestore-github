# Fixup the strings in the web.config and other places after the deployment....
#  
# If ( "$DEPLOYMENT_GROUP_NAME" == "TEST%" )
# {
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','TEST-ASP.NET_SessionState'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
# 
# }
# ElseIf ( "$DEPLOYMENT_GROUP_NAME" == "DEV%" )
# {
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','DEV-ASP.NET_SessionState'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
# }

(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','DEV-ASP.NET_SessionState'}  | 
Out-File c:\inetpub\wwwroot\shapestore\Web.config
