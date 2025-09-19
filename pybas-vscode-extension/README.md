# PyBAS Language Support for VS Code

Comprehensive language support for PyBAS (Python BASIC) - a modern implementation of classic BASIC programming language with Python-like syntax.

## ✨ Features

### 🎨 **Syntax Highlighting**
- **Keywords**: LET, PRINT, INPUT, FOR, NEXT, GOTO, IF, END, TO, STEP
- **Line Numbers**: Traditional BASIC line number highlighting
- **Strings**: Double-quoted string literals with escape sequences
- **Numbers**: Integer and floating-point number recognition
- **Comments**: REM statements and inline comments
- **Operators**: Arithmetic and comparison operators
- **Functions**: Built-in functions like str(), int(), float()

### ⚡ **Code Intelligence**
- **Auto-completion**: Intelligent completion for BASIC keywords
- **Code Snippets**: Pre-built templates for common constructs
- **Bracket Matching**: Automatic closing of parentheses and quotes
- **Smart Indentation**: Context-aware code indentation

### 🚀 **Integrated Development**
- **File Association**: Automatic recognition of `.pybas` and `.bas` files
- **Task Integration**: Run PyBAS programs directly from VS Code
- **Error Highlighting**: Syntax error detection and highlighting
- **Professional Editing**: Modern IDE experience for vintage programming

## 📋 **Code Snippets**

Type these prefixes and press **Tab** for instant code generation:

| Snippet | Description | Result |
|---------|-------------|--------|
| `program` | Basic program template | Complete program structure |
| `print` | Print statement | `PRINT "text"` |
| `let` | Variable assignment | `LET var = value` |
| `input` | Input statement | `INPUT "prompt", var` |
| `for` | For loop | Complete FOR...NEXT loop |
| `if` | Conditional statement | `IF condition GOTO line` |
| `goto` | Jump statement | `GOTO line_number` |
| `rem` | Comment | `REM comment text` |

## 🎯 **Quick Start**

1. **Install the extension**
2. **Create a new file** with `.pybas` extension
3. **Type `program` + Tab** for a quick template
4. **Start coding** with full syntax highlighting and IntelliSense

### Example Program

```basic
10 REM PyBAS Hello World Program
20 PRINT "Welcome to PyBAS!"
30 INPUT "Enter your name: ", NAME
40 PRINT "Hello, " + NAME + "!"
50 FOR I = 1 TO 3
60   PRINT "Count: " + str(I)
70 NEXT I
80 END
```

## 🛠 **Requirements**

- **VS Code**: Version 1.60.0 or higher
- **PyBAS Interpreter**: For running programs (optional)

## 🎮 **What is PyBAS?**

PyBAS is a modern BASIC interpreter that combines:
- **Classic BASIC syntax** (line numbers, GOTO, FOR loops)
- **Modern conveniences** (Python-like expressions, error handling)
- **Educational focus** (perfect for learning programming fundamentals)
- **Nostalgic experience** (authentic to GW-BASIC and similar interpreters)

### Supported Statements
- `LET` - Variable assignment
- `PRINT` - Output text and expressions  
- `INPUT` - User input with prompts
- `FOR...NEXT` - Loop constructs with STEP support
- `GOTO` - Unconditional jumps
- `IF...GOTO` - Conditional branching
- `REM` - Comments and documentation
- `END` - Program termination

### Perfect For
- 🎓 **Computer Science Education** - Teaching programming fundamentals
- 🕹️ **Retro Computing** - Experiencing vintage programming styles
- 📚 **Learning BASIC** - Understanding classic programming concepts
- 🎯 **Simple Scripting** - Quick automation and calculations

## 🖼️ **Screenshots**

*Syntax highlighting in action with PyBAS code showing colorized keywords, strings, and line numbers*

## 🌟 **Why PyBAS?**

- **Beginner Friendly**: Simple syntax perfect for new programmers
- **Historically Significant**: Learn how programming worked in the 1980s
- **Modern Implementation**: Runs on current systems with modern error handling
- **Educational Value**: Understand fundamental programming concepts
- **Nostalgic Fun**: Experience classic computing in a modern environment

## 🤝 **Contributing**

Contributions are welcome! Please feel free to:
- Report bugs and issues
- Suggest new features
- Submit pull requests
- Improve documentation

## 📄 **License**

This extension is released under the MIT License.

## 🔗 **Links**

- [GitHub Repository](https://github.com/yourusername/pybas)
- [Issue Tracker](https://github.com/yourusername/pybas/issues)
- [PyBAS Documentation](https://github.com/yourusername/pybas/blob/main/README.md)

---

**Enjoy programming in PyBAS!** 🚀 Bring the joy of classic BASIC programming to modern VS Code.