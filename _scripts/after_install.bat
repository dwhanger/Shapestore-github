REM @ECHO OFF
REM PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"

REM Fixup the strings in the web.config and other places after the deployment....
REM 
REM 

If "%DEPLOYMENT_GROUP_NAME%" == "Test-ShapestoreGroup"
{
	echo "TEST..."

	call BatchSubstitute.bat ___MYSQLDB_STRING___ testdmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com c:\inetpub\wwwroot\shapestore\Web.config > c:\temp\Web1.text
	call BatchSubstitute.bat ___DYNAMODB_TABLE_STRING___ TEST-ASP.NET_SessionState c:\temp\Web1.text > c:\temp\Web2.text
	call BatchSubstitute.bat ___SQS_QUEUE_NAME_STRING___ https://sqs.us-west-2.amazonaws.com/591516837963/TEST-dmw2-shapeorders-queue c:\temp\Web2.text > c:\temp\Web3.text
	call BatchSubstitute.bat ___S3_BUCKET_NAME_STRING___ test-dmw2-shapestoreresources c:\temp\Web3.text > c:\temp\Web4.text
	call BatchSubstitute.bat ___MYSQLDB_DBNAME_STRING___ TESTdmw2shapestoredb c:\temp\Web4.text > c:\temp\Web5.text
	call BatchSubstitute.bat ___MYSQLDB_USER_STRING___ admin c:\temp\Web5.text > c:\temp\Web6.text
	call BatchSubstitute.bat ___MYSQLDB_PASSWORD_STRING___ Password1234 c:\temp\Web6.text > c:\temp\Web7.text
	mv c:\temp\web7.text c:\inetpub\wwwroot\shapestore\Web.config
REM del c:\temp\web?.text
}
ElseIf "%DEPLOYMENT_GROUP_NAME%" == "Dev-ShapestoreGroup"
{
	echo "DEV..."

	call BatchSubstitute.bat ___MYSQLDB_STRING___ dmw2shapestoreinstance.cxkjrsk8xjz1.us-west-2.rds.amazonaws.com c:\inetpub\wwwroot\shapestore\Web.config > c:\temp\Web1.text
	call BatchSubstitute.bat ___DYNAMODB_TABLE_STRING___ DEV-ASP.NET_SessionState c:\temp\Web1.text > c:\temp\Web2.text
	call BatchSubstitute.bat ___SQS_QUEUE_NAME_STRING___ https://sqs.us-west-2.amazonaws.com/591516837963/DEV-dmw2-shapeorders-queue c:\temp\Web2.text > c:\temp\Web3.text
	call BatchSubstitute.bat ___S3_BUCKET_NAME_STRING___ dev-dmw2-shapestoreresources c:\temp\Web3.text > c:\temp\Web4.text
	call BatchSubstitute.bat ___MYSQLDB_DBNAME_STRING___ dmw2shapestoredb c:\temp\Web4.text > c:\temp\Web5.text
	call BatchSubstitute.bat ___MYSQLDB_USER_STRING___ admin c:\temp\Web5.text > c:\temp\Web6.text
	call BatchSubstitute.bat ___MYSQLDB_PASSWORD_STRING___ j57Q25oTosk2sWybLr3f; c:\temp\Web6.text > c:\temp\Web7.text
	mv c:\temp\web7.text c:\inetpub\wwwroot\shapestore\Web.config
REM	del c:\temp\web?.text
}
