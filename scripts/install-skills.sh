#!/bin/bash

# Script to copy skills to Kiro's global skills directory

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source directory (relative to script location)
SOURCE_DIR="$SCRIPT_DIR/../docs/skills"

# Destination directory
DEST_DIR="$HOME/.kiro/skills"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy all subdirectories from source to destination
echo "Copying skills from $SOURCE_DIR to $DEST_DIR..."
cp -r "$SOURCE_DIR"/*/ "$DEST_DIR/"

# Check if copy was successful
if [ $? -eq 0 ]; then
    echo "✓ Skills copied successfully!"
    echo "Skills installed to: $DEST_DIR"
else
    echo "✗ Error copying skills"
    exit 1
fi
