#!/bin/bash

################################################################################
# Tactical RMM Website Monitoring Script
# 
# Author: Stefan Lousberg
# Contact: stefan.lousberg@owasp.org
# 
# Description:
# This script is designed to monitor a specified URL for the presence of specific keywords.
# If any of the specified keywords are not found, the script will return an error exit code.
################################################################################


# URL to monitor (specified as an environment variable)
URL="$URL"

# Keywords to monitor for (passed as script arguments)
KEYWORDS=("$@")

# Perform the cURL request and store the page content in a variable
PAGE_CONTENT=$(curl -s "$URL")

found_all_keywords=1

# Loop through each keyword and check if it exists in the page content
for keyword in "${KEYWORDS[@]}"; do
    if [[ $PAGE_CONTENT != *"$keyword"* ]]; then
        echo "Keyword '$keyword' not found on $URL"
        found_all_keywords=0
    fi
done

if [ "$found_all_keywords" -eq 1 ]; then
    echo "All keywords found on $URL"
    exit 0
else
    exit 1
fi
