#
#
#
$result = (curl -UseBasicParsing http://localhost/index.html).StatusCode

if ("$result" -eq "200") { 
	exit 0
} 
else { 
	exit 1
}

