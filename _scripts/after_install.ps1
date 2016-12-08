# Fixup the strings in the web.config and other places after the deployment....
#  
#

If ( $env:DEPLOYMENT_GROUP_NAME -like "TEST*" )
{
	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%MYSQLDB_STRING%%','testdmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config 

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','TEST-ASP.NET_SessionState'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%SQS_QUEUE_NAME_STRING%%','https://sqs.us-west-2.amazonaws.com/591516837963/TEST-dmw2-shapeorders-queue'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%S3_BUCKET_NAME_STRING%%','test-dmw2-shapestoreresources'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%MYSQLDB_DBNAME_STRING%%','TESTdmw2shapestoredb'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%MYSQLDB_USER_STRING%%','admin'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%MYSQLDB_PASSWORD_STRING%%','Password1234'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config
}
ElseIf ( $env:DEPLOYMENT_GROUP_NAME -like "DEV*" )
{
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_STRING%%','dmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','DEV-ASP.NET_SessionState'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%SQS_QUEUE_NAME_STRING%%','https://sqs.us-west-2.amazonaws.com/591516837963/DEV-dmw2-shapeorders-queue'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%S3_BUCKET_NAME_STRING%%','dev-dmw2-shapestoreresources'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_DBNAME_STRING%%','DEVdmw2shapestoredb'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_USER_STRING%%','admin'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_PASSWORD_STRING%%','Password1234'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
}
