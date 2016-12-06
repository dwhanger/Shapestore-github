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

If ( "$DEPLOYMENT_GROUP_NAME" == "TEST%" )
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
}
ElseIf ( "$DEPLOYMENT_GROUP_NAME" == "DEV%" )
{
	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%MYSQLDB_STRING%%','dmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%DYNAMODB_TABLE_STRING%%','DEV-ASP.NET_SessionState'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%SQS_QUEUE_NAME_STRING%%','https://sqs.us-west-2.amazonaws.com/591516837963/DEV-dmw2-shapeorders-queue'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config

	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
	Foreach-Object {$_ -replace '%%S3_BUCKET_NAME_STRING%%','dev-dmw2-shapestoreresources'}  | 
	Out-File c:\inetpub\wwwroot\shapestore\Web.config
}
