#!/usr/bin/env bash

echo "Installing Video Courses CLI..."

# Check dependencies
for cmd in rclone mpv python3; do
    if ! command -v $cmd &> /dev/null; then
        echo "⚠️  Warning: '$cmd' is not installed or not in PATH."
        if [ "$cmd" = "mpv" ]; then
            echo "   (Install via 'brew install mpv' on macOS or 'sudo apt install mpv' on Linux)"
        elif [ "$cmd" = "rclone" ]; then
            echo "   (Install from https://rclone.org/downloads/)"
        fi
    fi
done

# Install to standard user binary directory
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"

cp courses "$INSTALL_DIR/courses"
chmod +x "$INSTALL_DIR/courses"

echo "✅ Installed successfully to $INSTALL_DIR/courses"
echo ""

# Check if it's in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "⚠️  Note: $INSTALL_DIR is not in your PATH."
    echo "   To fix this, add the following line to your ~/.zshrc or ~/.bashrc:"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo "   Then restart your terminal."
else
    echo "🎉 You can now run 'courses' from anywhere in your terminal!"
fi
