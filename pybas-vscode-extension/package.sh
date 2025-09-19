#!/bin/bash

# PyBAS Extension Packaging Script
# This script helps package the PyBAS VS Code extension for distribution

echo "🚀 PyBAS Extension Packaging Tool"
echo "=================================="

# Check if we're in the extension directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Run this script from the extension directory."
    exit 1
fi

echo "📦 Checking extension files..."

# Check required files
required_files=(
    "package.json"
    "README.md" 
    "LICENSE"
    "language-configuration.json"
    "syntaxes/pybas.tmLanguage.json"
    "snippets/pybas.json"
)

missing_files=()
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    else
        echo "✅ $file"
    fi
done

if [ ${#missing_files[@]} -ne 0 ]; then
    echo "❌ Missing required files:"
    printf '   %s\n' "${missing_files[@]}"
    exit 1
fi

# Check if icon exists (recommended but not required)
if [ ! -f "icon.png" ]; then
    echo "⚠️  Warning: icon.png not found (recommended for marketplace)"
    echo "   See ICON_INSTRUCTIONS.md for how to create one"
fi

echo ""
echo "✅ All required files present!"
echo ""
echo "📋 Extension Details:"
echo "   Name: $(grep '"displayName"' package.json | cut -d'"' -f4)"
echo "   Version: $(grep '"version"' package.json | cut -d'"' -f4)"
echo "   Publisher: $(grep '"publisher"' package.json | cut -d'"' -f4)"
echo ""

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "📦 VSCE (VS Code Extension packager) not found."
    echo "   To install: npm install -g @vscode/vsce"
    echo "   Then run: vsce package"
    echo ""
    echo "🎯 Manual Installation:"
    echo "   1. Copy this entire directory to ~/.vscode/extensions/"
    echo "   2. Rename to: pybas-language-1.0.0"
    echo "   3. Restart VS Code"
    echo ""
else
    echo "📦 Packaging extension with VSCE..."
    vsce package
    
    if [ $? -eq 0 ]; then
        echo "✅ Extension packaged successfully!"
        echo "   Generated: $(ls *.vsix 2>/dev/null | head -1)"
        echo ""
        echo "🚀 To install:"
        echo "   code --install-extension $(ls *.vsix 2>/dev/null | head -1)"
    else
        echo "❌ Packaging failed. Check the errors above."
    fi
fi

echo ""
echo "📚 Next Steps:"
echo "   1. Test the extension locally"
echo "   2. Create an icon.png (128x128)"
echo "   3. Update package.json with your publisher name"
echo "   4. Publish to marketplace: vsce publish"
echo ""
echo "📖 See PUBLISHING_GUIDE.md for detailed instructions"