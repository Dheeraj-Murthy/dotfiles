#!/bin/bash

# Define directories to back up
SOURCE_DIRS=("$HOME/Desktop" "$HOME/dev" "$HOME/Downloads/IIITB/")
BACKUP_DIR="$HOME/Backup"

# Get the current date (YYYY-MM-DD)
DATE=$(date +"%Y-%m-%d")

# Create the backup folder
DEST="$BACKUP_DIR/$DATE"
mkdir -p "$DEST"

# Loop through each directory to back it up
for DIR in "${SOURCE_DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        DIR_NAME=$(basename "$DIR")

        rsync -av --progress \
            --exclude 'node_modules' \
            --exclude '__pycache__' \
            --exclude '*.pyc' \
            --exclude '.git' \
            --exclude '.venv' \
            --exclude 'venv' \
            --exclude 'cmake-cache' \
            --exclude 'ffmpeg' \
            --exclude 'SDL' \
            --exclude '.DS_Store' \
            \
            --exclude 'build' \
            --exclude '.dart_tool' \
            --exclude '.packages' \
            --exclude '.pub-cache' \
            --exclude '.flutter-plugins' \
            --exclude '.flutter-plugins-dependencies' \
            \
            --exclude 'macos/Pods' \
            --exclude 'ios/Pods' \
            --exclude 'ios/.symlinks' \
            --exclude 'ios/Flutter/Flutter.framework' \
            --exclude 'ios/Flutter/Flutter.podspec' \
            \
            --exclude 'android/.gradle' \
            --exclude 'android/build' \
            --exclude '*.apk' \
            --exclude '*.aar' \
            "$DIR/" "$DEST/$DIR_NAME/"

    else
        echo "Warning: $DIR does not exist. Skipping." >> ~/.config/scripts/logs.txt
    fi
done

# Compress the backup
tar -czf "$BACKUP_DIR/$DATE.tar.gz" -C "$BACKUP_DIR" "$DATE"
rm -rf "$DEST"  # remove uncompressed copy

echo "Backup completed and compressed: $BACKUP_DIR/$DATE.tar.gz" >> ~/.config/scripts/logs.txt
