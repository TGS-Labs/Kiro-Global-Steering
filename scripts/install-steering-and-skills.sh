#!/bin/bash

# Script to copy steering files and skills to Kiro's global directories

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Steering ---
STEERING_SOURCE="$SCRIPT_DIR/../docs/steering"
STEERING_DEST="$HOME/.kiro/steering"

mkdir -p "$STEERING_DEST"

echo "Copying steering files from $STEERING_SOURCE to $STEERING_DEST..."
cp -r "$STEERING_SOURCE"/* "$STEERING_DEST/"

if [ $? -eq 0 ]; then
    echo "✓ Steering files copied successfully!"
    echo "Files copied to: $STEERING_DEST"
else
    echo "✗ Error copying steering files"
    exit 1
fi

# --- Skills ---
SKILLS_SOURCE="$SCRIPT_DIR/../docs/skills"
SKILLS_DEST="$HOME/.kiro/skills"

mkdir -p "$SKILLS_DEST"

echo "Copying skills from $SKILLS_SOURCE to $SKILLS_DEST..."
cp -a "$SKILLS_SOURCE"/. "$SKILLS_DEST/"

if [ $? -eq 0 ]; then
    echo "✓ Skills copied successfully!"
    echo "Skills installed to: $SKILLS_DEST"
else
    echo "✗ Error copying skills"
    exit 1
fi
