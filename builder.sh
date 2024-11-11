#!/bin/bash
# Will build the plugin from latest release. These releases will be pulled from github
# Define the URLs
URLS=(
    "https://github.com/bootcomposer/wp-pace/archive/refs/tags/V1.0.zip"
    "https://github.com/bootcomposer/admin-pro/archive/refs/tags/v1.0.zip"
    "https://github.com/bootcomposer/searchable-select/archive/refs/tags/v1.0.zip"
    "https://github.com/bootcomposer/enable-disable-features/archive/refs/tags/v1.0.zip"
)

# Loop through each URL
for url in "${URLS[@]}"; do
    # Get the filename from the URL
    filename=$(basename "$url")
    
    # Download the .zip file
    echo "Downloading $filename..."
    curl -O "$url"
    
    # Unzip the file
    echo "Unzipping $filename..."
    unzip "$filename" -d "${filename%.zip}"

    # Remove the .zip file after extraction
    echo "Removing $filename..."
    rm "$filename"

    echo "$filename processed."
done

echo "All files downloaded, unzipped, and cleaned up."
