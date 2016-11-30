#!/bin/bash

# result=$(curl http://localhost/index.html/)
# if [[ "$result" =~ "Hello World" ]]; then
#     exit 0
# else
#     exit 1
# fi

$result = (curl http://localhost/index.html).StatusCode

if ("$result" -eq "200") { 
	exit 0
} 
else { 
	exit 1
}
