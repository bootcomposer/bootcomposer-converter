#!/bin/bash
# Define the URLs and desired filenames
URLS=(
    "https://github.com/bootcomposer/wp-pace/archive/refs/tags/V1.0.zip wp-pace"
    "https://github.com/bootcomposer/admin-pro/archive/refs/tags/v1.0.zip admin-pro"
    "https://github.com/bootcomposer/searchable-select/archive/refs/tags/v1.0.zip searchable-select"
    "https://github.com/bootcomposer/enable-disable-features/archive/refs/tags/v1.0.zip enable-disable-features"
)

# Create a directory for extracted files
EXTRACT_DIR="./"
mkdir -p "$EXTRACT_DIR"

# Loop through each URL and filename
for url_filename in "${URLS[@]}"; do
    # Extract the URL and the desired directory name
    url=$(echo "$url_filename" | awk '{print $1}')
    dirname=$(echo "$url_filename" | awk '{print $2}')
    # Define the target directory to extract files
    target_dir="$EXTRACT_DIR/$dirname"
    
    # Download the .zip file
    filename="${dirname}.zip"
    echo "Downloading $filename..."
    if ! wget -q "$url" -O "$filename"; then
        echo "Failed to download $filename"
        continue
    fi
    
    # Create a directory for extraction if it doesn't exist
    mkdir -p "$target_dir"
    
    # Unzip the file directly into the target directory without subdirectories (using -j option)
    echo "Unzipping $filename..."
    if ! unzip -q -j "$filename" -d "$target_dir"; then
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
