#!/bin/bash

filename="$1"

# Check if the filename is provided as a command line argument
if [ -z "$filename" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ -e "$filename" ]; then
    echo "The file or directory '$filename' exists."

    # If it's a regular file
    if [ -f "$filename" ]; then
        # Display access permissions
        permissions=$(stat -c "%A" "$filename")
        echo "Access permissions: $permissions"

        # Display file size
        size=$(stat -c "%s" "$filename")
        echo "File size: $size bytes"

        # Display the time of last modification
        last_modified_time=$(stat -c "%y" "$filename")
        echo "Last modified time: $last_modified_time"

    # If it's a directory
    elif [ -d "$filename" ]; then
        # Display the number of files and subdirectories
        num_files=$(find "$filename" -maxdepth 1 -type f | wc -l)
        num_subdirectories=$(find "$filename" -maxdepth 1 -type d | wc -l)

        echo "The directory '$filename' contains:"
        echo "Number of files: $num_files"
        echo "Number of subdirectories: $num_subdirectories"

    else
        echo "The specified path '$filename' is not a regular file or directory."
    fi

else
    echo "The file or directory '$filename' does not exist."
fi

