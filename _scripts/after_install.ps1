# 
#  
#

If ( $env:DEPLOYMENT_GROUP_NAME -like "TEST*" )
{
#
# Unfortunately, the following does not work because it inserts a LF in the output text along with the CR and there is a way to suppress that with the OutFile cmdlet with a -NoNewLine but...
# that is only available in Powershell 5.....
#
#	(Get-Content c:\inetpub\wwwroot\shapestore\Web.config) | 
#	Foreach-Object {$_ -replace '%%MYSQLDB_STRING%%','testdmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com'}  | 
#	Out-File c:\inetpub\wwwroot\shapestore\Web.config 
}
ElseIf ( $env:DEPLOYMENT_GROUP_NAME -like "DEV*" )
{
#
#
#
}
