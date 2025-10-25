#!/bin/bash

# Script to organize movie files into folders
# This will create a folder for each movie and move the .mkv and .nfo files into it

# Set the movies directory (change this to your actual path)
MOVIES_DIR="/path/to/your/movies"

# Change to the movies directory
cd "$MOVIES_DIR" || exit 1

# Loop through all .mkv files in the current directory only (not subdirectories)
for mkv_file in *.mkv; do
    # Skip if no .mkv files found
    [ -e "$mkv_file" ] || continue
    
    # Extract the base filename without extension
    base_name="${mkv_file%.mkv}"
    
    # Extract the movie name (everything before {tmdb-)
    if [[ "$base_name" =~ ^(.+)[[:space:]]\{tmdb- ]]; then
        folder_name="${BASH_REMATCH[1]}"
        
        # Check if the corresponding .nfo file exists
        nfo_file="${base_name}.nfo"
        
        # Only proceed if this is a loose file (not already in a folder)
        if [ -f "$mkv_file" ]; then
            echo "Processing: $base_name"
            
            # Create the folder if it doesn't exist
            if [ ! -d "$folder_name" ]; then
                mkdir -p "$folder_name"
                echo "  Created folder: $folder_name"
            fi
            
            # Move the .mkv file
            mv "$mkv_file" "$folder_name/"
            echo "  Moved: $mkv_file"
            
            # Move the .nfo file if it exists
            if [ -f "$nfo_file" ]; then
                mv "$nfo_file" "$folder_name/"
                echo "  Moved: $nfo_file"
            else
                echo "  Warning: No matching .nfo file found"
            fi
            
            echo ""
        fi
    else
        echo "Skipping (no tmdb tag found): $mkv_file"
    fi
done

echo "Done organizing movie files!"
