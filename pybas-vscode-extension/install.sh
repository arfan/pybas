#!/bin/bash

# PyBAS VS Code Extension Installation Script

echo "Installing PyBAS Language Support for VS Code..."

# Get VS Code extensions directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    VSCODE_EXTENSIONS_DIR="$HOME/.vscode/extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    VSCODE_EXTENSIONS_DIR="$HOME/.vscode/extensions"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    VSCODE_EXTENSIONS_DIR="$USERPROFILE/.vscode/extensions"
else
    echo "Unsupported operating system"
    exit 1
fi

# Create target directory
TARGET_DIR="$VSCODE_EXTENSIONS_DIR/pybas-language-1.0.0"

echo "Installing to: $TARGET_DIR"

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy extension files
cp -r * "$TARGET_DIR/"

echo "PyBAS Language Support installed successfully!"
echo "Please restart VS Code to activate the extension."
echo ""
echo "Features:"
echo "  - Syntax highlighting for .pybas files"
echo "  - Code snippets (type 'program', 'for', 'print', etc.)"
echo "  - F5 to run PyBAS programs"
echo "  - Shift+Alt+F to format code"
echo ""
echo "Open any .pybas file to see the extension in action!"