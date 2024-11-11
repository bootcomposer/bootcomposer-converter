#!/bin/bash
# Define the URLs and desired filenames
URLS=(
    "https://github.com/bootcomposer/wp-pace/archive/refs/tags/V1.0.zip wp-pace.zip"
    "https://github.com/bootcomposer/admin-pro/archive/refs/tags/v1.0.zip admin-pro.zip"
    "https://github.com/bootcomposer/searchable-select/archive/refs/tags/v1.0.zip searchable-select.zip"
    "https://github.com/bootcomposer/enable-disable-features/archive/refs/tags/v1.0.zip enable-disable-features.zip"
)

# Create a directory for extracted files
EXTRACT_DIR="./"
mkdir -p "$EXTRACT_DIR"

# Loop through each URL and filename
for url_filename in "${URLS[@]}"; do
    # Extract the URL and the desired filename
    url=$(echo "$url_filename" | awk '{print $1}')
    filename=$(echo "$url_filename" | awk '{print $2}')
    
    # Download the .zip file
    echo "Downloading $filename..."
    if ! wget -q "$url" -O "$filename"; then
        echo "Failed to download $filename"
        continue
    fi
    
    # Unzip the file
    echo "Unzipping $filename..."
    if ! unzip "$filename" -d "$EXTRACT_DIR/${filename%.zip}"; then
        echo "Failed to unzip $filename"
        rm "$filename"
        continue
    fi

    # Remove the .zip file after extraction
    echo "Removing $filename..."
    rm "$filename"

    echo "$filename processed."
done

echo "All files downloaded, unzipped, and cleaned up."
