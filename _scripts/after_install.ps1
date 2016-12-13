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
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config -NoNewLine
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%MYSQLDB_STRING%%" --replace "dmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com"

#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','DEV-ASP.NET_SessionState'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%DYNAMODB_TABLE_STRING%%" --replace "DEV-ASP.NET_SessionState"


#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%SQS_QUEUE_NAME_STRING%%','https://sqs.us-west-2.amazonaws.com/591516837963/DEV-dmw2-shapeorders-queue'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%SQS_QUEUE_NAME_STRING%%" --replace "https://sqs.us-west-2.amazonaws.com/591516837963/DEV-dmw2-shapeorders-queue"
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%S3_BUCKET_NAME_STRING%%','dev-dmw2-shapestoreresources'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%S3_BUCKET_NAME_STRING%%" --replace "dev-dmw2-shapestoreresources"
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_DBNAME_STRING%%','DEVdmw2shapestoredb'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%MYSQLDB_DBNAME_STRING%%" --replace "dmw2shapestoredb"
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_USER_STRING%%','admin'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%MYSQLDB_USER_STRING%%" --replace "admin"
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_PASSWORD_STRING%%','Password1234'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config
	"C:\temp\fnr.exe" --cl --dir "c:\inetpub\wwwroot\shapestore" --fileMask "Web.config" --find "%%MYSQLDB_PASSWORD_STRING%%" --replace "j57Q25oTosk2sWybLr3f;"
}
