#!/bin/bash

# Define source and destination directories
SOURCE_DIR="../../../../sympli-dockers/app"
DEST_DIR="./app"

# Remove the existing ./app directory to ensure a clean start
echo "Removing existing $DEST_DIR directory..."
rm -rf "$DEST_DIR"
echo "Copying files from FastAPI project"
# Create a new empty ./app directory
mkdir -p "$DEST_DIR"

# Copy files from the source directory
echo "Copying Python files..."
cp "$SOURCE_DIR"/*.py "$DEST_DIR" 2>/dev/null || echo "No Python files found."

echo "Copying JSON files..."
cp "$SOURCE_DIR"/*.json "$DEST_DIR" 2>/dev/null || echo "No JSON files found."

echo "Copying Key files..."
cp "$SOURCE_DIR"/".key" "$DEST_DIR" 2>/dev/null || echo "No Key files found."

# Ensure Buildx is enabled
#docker buildx create --use --name multiarch-builder 2>/dev/null || echo "Using existing buildx instance"

# Build the multi-architecture image

#docker buildx build --platform linux/amd64,linux/arm64 -t myimage --push .

echo "Done!"