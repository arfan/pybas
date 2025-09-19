# PyBAS VS Code Extension Installation Guide

## 🚀 Quick Installation

### Method 1: Automatic Installation (Recommended)

1. **Navigate to the extension directory:**
   ```bash
   cd /Users/mac-210432/code/pybas/pybas-vscode-extension
   ```

2. **Run the installation script:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Restart VS Code**

### Method 2: Manual Installation

1. **Copy the extension to VS Code extensions directory:**
   ```bash
   cp -r /Users/mac-210432/code/pybas/pybas-vscode-extension ~/.vscode/extensions/pybas-language-1.0.0
   ```

2. **Restart VS Code**

## ✅ Verify Installation

1. **Open VS Code**
2. **Open any `.pybas` file** (like `vscode_test.pybas`)
3. **Check that you see:**
   - Syntax highlighting for BASIC keywords
   - Line numbers highlighted differently
   - Strings in green/blue color
   - Keywords in purple/blue color

## 🎯 Features Available

### 🎨 **Syntax Highlighting**
- **Keywords**: LET, PRINT, INPUT, FOR, NEXT, GOTO, IF, END (highlighted in purple/blue)
- **Line Numbers**: BASIC line numbers (10, 20, 30...) highlighted specially
- **Strings**: Text in quotes highlighted in green
- **Numbers**: Numeric values highlighted
- **Comments**: REM statements highlighted as comments
- **Operators**: =, <>, <, >, +, -, *, / highlighted

### ⚡ **Code Snippets**
Type these and press **Tab**:

| Snippet | Description |
|---------|-------------|
| `program` | Basic program template |
| `print` | PRINT statement |
| `let` | LET assignment |
| `input` | INPUT statement |
| `for` | FOR loop |
| `if` | IF statement |
| `goto` | GOTO statement |
| `rem` | Comment |
| `line` | Numbered line |

### 🛠 **VS Code Integration**
- **File Association**: `.pybas` and `.bas` files automatically recognized
- **Proper Language Mode**: Shows "PyBAS" in status bar
- **IntelliSense**: Basic completion for keywords

## 🚀 **Usage Examples**

### 1. **Create a New PyBAS Program**
1. Create new file: `File > New File`
2. Save as: `myprogram.pybas`
3. Type: `program` + Tab
4. You'll get:
   ```basic
   10 REM My Program
   20 PRINT "Hello, World!"
   30 END
   ```

### 2. **Use Code Snippets**
- Type `for` + Tab → Complete FOR loop
- Type `print` + Tab → PRINT statement
- Type `let` + Tab → Variable assignment

### 3. **Run Programs with Tasks**
- **Ctrl+Shift+P** → "Tasks: Run Task" → "Run PyBAS Program"
- Or use the **F5** key (when `.pybas` file is open)

## 🎨 **Visual Features**

The extension provides beautiful syntax highlighting:

```basic
10 REM This is a comment (gray/green)
20 LET X = 42                    (keywords in purple, numbers in blue)
30 PRINT "Hello, World!"        (strings in green)
40 FOR I = 1 TO 10              (keywords highlighted)
50   PRINT str(I)               (function names highlighted)
60 NEXT I
70 IF X = 42 GOTO 100          (operators and keywords highlighted)
80 END
```

## 🐛 **Troubleshooting**

### Extension Not Working?
1. **Check installation location:**
   ```bash
   ls ~/.vscode/extensions/ | grep pybas
   ```
   Should show: `pybas-language-1.0.0`

2. **Restart VS Code completely**
3. **Check file extension** - must be `.pybas` or `.bas`

### No Syntax Highlighting?
1. **Check language mode** in VS Code status bar
2. **Manually set language**: Ctrl+Shift+P → "Change Language Mode" → "PyBAS"

### Snippets Not Working?
1. **Make sure file is recognized as PyBAS**
2. **Type snippet prefix and press Tab** (not Enter)

## 🎉 **Success!**

You now have a professional IDE experience for PyBAS development! 

**Features you can enjoy:**
- Beautiful syntax highlighting
- Intelligent code snippets  
- Integrated terminal support
- Professional code editing environment
- File association for `.pybas` files

**Next Steps:**
1. Open `vscode_test.pybas` to see the highlighting in action
2. Try the code snippets by typing `program` + Tab
3. Use Ctrl+Shift+P to explore PyBAS-related commands

Happy PyBAS programming! 🚀