# PyBAS - Python BASIC Interpreter

A lightweight BASIC language interpreter written in Python that allows you to write and execute classic BASIC programs with modern convenience.

## Features

- ✅ **Variable Assignment** - Store and manipulate data with LET statements
- ✅ **Mathematical Operations** - Full arithmetic support (+, -, *, /, **)
- ✅ **String Operations** - String concatenation and manipulation
- ✅ **Output** - Display results with PRINT statements
- ✅ **Input** - Interactive user input with INPUT statements
- ✅ **Comments** - Document your code with single quote comments
- ✅ **Automatic Type Conversion** - Seamless handling of numbers and strings
- ✅ **Line-by-Line Execution** - Traditional BASIC line number programming

## Installation

No installation required! PyBAS is a single Python script that runs with Python 3.

### Prerequisites

- Python 3.6 or higher
- No additional dependencies

### Quick Start

1. Clone or download this repository
2. Make the interpreter executable (optional):
   ```bash
   chmod +x pybas
   ```
3. Create a `.pybas` program file
4. Run your program:
   ```bash
   ./pybas yourprogram.pybas
   # or
   python3 pybas yourprogram.pybas
   ```

## Usage

### Command Line Syntax

```bash
./pybas <program_file.pybas>
```

Where `<program_file.pybas>` is your BASIC program file.

### Example

```bash
./pybas hello.pybas
```

## Language Syntax

PyBAS supports a subset of classic BASIC language features. Every statement must begin with a line number.

### Program Structure

```basic
10 [STATEMENT]
20 [STATEMENT]
30 [STATEMENT]
...
[last_line] END
```

### Supported Statements

#### LET - Variable Assignment

Assigns values to variables.

**Syntax:**
```basic
LET variable = expression
```

**Examples:**
```basic
10 LET X = 5
20 LET NAME = "Hello"
30 LET Y = X + 10
40 LET RESULT = X * Y + 2
```

**Features:**
- Supports numeric and string variables
- Mathematical expressions in assignments
- Variable names can contain letters and numbers
- No need to declare variable types

#### PRINT - Output

Displays values, variables, and expressions.

**Syntax:**
```basic
PRINT expression
```

**Examples:**
```basic
10 PRINT "Hello, World!"
20 PRINT X
30 PRINT "The result is: " + str(RESULT)
40 PRINT X + Y
```

**Features:**
- Print strings, numbers, and variables
- String concatenation with `+`
- Use `str()` to convert numbers to strings for concatenation
- Supports complex expressions

#### INPUT - User Input

Gets input from the user and stores it in a variable.

**Syntax:**
```basic
INPUT variable
INPUT "prompt", variable
```

**Examples:**
```basic
10 INPUT NAME
20 INPUT "Enter your age: ", AGE
30 INPUT "Enter a number: ", NUM
```

**Features:**
- Automatic type detection (numbers vs strings)
- Optional prompt message
- Converts numeric input to integers or floats automatically
- String input remains as text

#### END - Program Termination

Ends the program execution.

**Syntax:**
```basic
END
```

**Example:**
```basic
100 END
```

#### Comments

Add comments to document your code.

**Syntax:**
```basic
' This is a comment (at the beginning of a line)
```

**Example:**
```basic
' This program calculates area
10 LET WIDTH = 5
20 LET HEIGHT = 10
```

**Note:** Comments must be on their own lines and start with a single quote.

### Data Types

PyBAS automatically handles different data types:

#### Numbers
- **Integers**: `42`, `-17`, `0`
- **Floats**: `3.14`, `-2.5`, `0.001`

#### Strings
- **Text**: `"Hello"`, `"Python BASIC"`, `"123abc"`
- Use double quotes to define string literals
- Concatenate strings with the `+` operator

### Mathematical Operations

| Operator | Description | Example |
|----------|-------------|---------|
| `+` | Addition | `5 + 3 = 8` |
| `-` | Subtraction | `10 - 4 = 6` |
| `*` | Multiplication | `6 * 7 = 42` |
| `/` | Division | `15 / 3 = 5.0` |
| `**` | Exponentiation | `2 ** 3 = 8` |

### String Operations

| Operation | Description | Example |
|-----------|-------------|---------|
| `+` | Concatenation | `"Hello" + " World" = "Hello World"` |
| `str()` | Convert to string | `str(42) = "42"` |

### Variable Rules

- Variable names can contain letters, numbers, and underscores
- Variables are case-sensitive (`NAME` and `name` are different)
- No need to declare variables before use
- Variables can hold different types of data

## Examples and Tutorials

### Example 1: Hello World

**File: hello.pybas**
```basic
10 LET NAME = "World"
20 PRINT "Hello, " + NAME + "!"
30 END
```

**Output:**
```
Hello, World!
Program finished.
```

### Example 2: Simple Calculator

**File: calculator.pybas**
```basic
10 PRINT "Simple Calculator"
20 INPUT "Enter first number: ", NUM1
30 INPUT "Enter second number: ", NUM2
40 LET SUM = NUM1 + NUM2
50 LET PRODUCT = NUM1 * NUM2
60 PRINT str(NUM1) + " + " + str(NUM2) + " = " + str(SUM)
70 PRINT str(NUM1) + " * " + str(NUM2) + " = " + str(PRODUCT)
80 END
```

**Sample Run:**
```
Simple Calculator
Enter first number: 15
Enter second number: 4
15.0 + 4.0 = 19.0
15.0 * 4.0 = 60.0
Program finished.
```

### Example 3: Personal Information

**File: info.pybas**
```basic
10 INPUT "Enter your name: ", NAME
20 INPUT "Enter your age: ", AGE
30 LET BIRTH_YEAR = 2025 - AGE
40 PRINT "Hello, " + NAME
50 PRINT "You were born around " + str(BIRTH_YEAR)
60 END
```

### Example 4: Mathematical Operations

**File: math_demo.pybas**
```basic
10 LET A = 25
20 LET B = 4
30 PRINT "A = " + str(A)
40 PRINT "B = " + str(B)
50 PRINT "Addition: " + str(A + B)
60 PRINT "Subtraction: " + str(A - B)
70 PRINT "Multiplication: " + str(A * B)
80 PRINT "Division: " + str(A / B)
90 PRINT "A squared: " + str(A ** 2)
100 END
```

### Step-by-Step Tutorial: Creating Your First Program

1. **Create a new file** with `.pybas` extension:
   ```bash
   touch my_program.pybas
   ```

2. **Write your program** with line numbers:
   ```basic
   10 PRINT "My first PyBAS program!"
   20 INPUT "What's your name? ", USERNAME
   30 PRINT "Nice to meet you, " + USERNAME + "!"
   40 END
   ```

3. **Save the file** and run it:
   ```bash
   ./pybas my_program.pybas
   ```

4. **Follow the prompts** and see your program in action!

### Programming Tips

- **Line Numbers**: Use increments of 10 (10, 20, 30...) to leave room for future additions
- **Variable Names**: Use descriptive names like `STUDENT_NAME` instead of `X`
- **String Conversion**: Always use `str()` when concatenating numbers with strings
- **Comments**: Document complex calculations or important steps
- **Testing**: Start with simple programs and gradually add complexity

## Included Sample Programs

The repository includes several example programs to help you get started:

| File | Description |
|------|-------------|
| `hello.pybas` | Basic variables and string operations |
| `calculator.pybas` | Interactive calculator with user input |
| `counter.pybas` | Variable manipulation and arithmetic |
| `input_demo.pybas` | Personal information program with INPUT |
| `guess_demo.pybas` | Simple guessing game setup |
| `math.pybas` | Mathematical operations demonstration |

**Run any example:**
```bash
./pybas hello.pybas
./pybas calculator.pybas
./pybas input_demo.pybas
```

## Advanced Usage

### Running Programs

**Method 1: Direct execution (recommended)**
```bash
./pybas program.pybas
```

**Method 2: Using Python interpreter**
```bash
python3 pybas program.pybas
```

**Method 3: Full path execution**
```bash
/path/to/pybas /path/to/program.pybas
```

### Command Line Options

Currently, PyBAS supports basic program execution. The syntax is:

```bash
./pybas <program_file>
```

**Arguments:**
- `<program_file>`: Required. Path to your `.pybas` program file

**Exit Codes:**
- `0`: Program executed successfully
- `1`: Error (missing file, syntax error, etc.)

### Error Handling

If you provide incorrect arguments:
```bash
./pybas
# Output: Usage: pybas program.pybas
```

If the program file doesn't exist:
```bash
./pybas nonexistent.pybas
# Output: FileNotFoundError: [Errno 2] No such file or directory: 'nonexistent.pybas'
```

## Troubleshooting

### Common Issues and Solutions

#### 1. "Unknown statement" Error

**Problem:** Getting "Unknown statement: [statement]" message

**Solutions:**
- Check that your line starts with a line number: `10 PRINT "Hello"`
- Verify statement syntax matches the supported commands (LET, PRINT, INPUT, END)
- Make sure there's a space between the line number and statement

**Example Error:**
```
Unknown statement: HELLO "World"
```
**Fix:**
```basic
10 PRINT "World"  # Use PRINT instead of HELLO
```

#### 2. Syntax Errors in Expressions

**Problem:** Errors when evaluating mathematical expressions

**Common Causes:**
- Missing quotes around strings: `PRINT Hello` should be `PRINT "Hello"`
- Mixing types without conversion: `"Age: " + 25` should be `"Age: " + str(25)`
- Invalid variable names or undefined variables

**Example Error:**
```basic
10 LET X = Y + 5  # Error if Y is not defined
```
**Fix:**
```basic
10 LET Y = 10
20 LET X = Y + 5
```

#### 3. File Permission Issues

**Problem:** "Permission denied" when running `./pybas`

**Solution:**
```bash
chmod +x pybas  # Make the file executable
```

#### 4. Input Type Issues

**Problem:** Unexpected behavior with INPUT statements

**Common Issues:**
- INPUT automatically converts numeric strings to numbers
- To force string input, the interpreter currently auto-detects type
- Empty input may cause issues

**Workaround:**
```basic
10 INPUT "Enter text: ", TEXT
20 PRINT "You entered: " + str(TEXT)  # Always convert to string for printing
```

#### 5. Line Number Conflicts

**Problem:** Program doesn't execute in expected order

**Solution:**
- Ensure line numbers are in ascending order
- Use increments of 10 to leave room for additions
- Check for duplicate line numbers

### Limitations

**Current Limitations:**
- No conditional statements (IF/THEN/ELSE)
- No loops (FOR/WHILE)
- No subroutines (GOSUB/RETURN)
- No arrays or complex data structures
- No file I/O operations
- No GOTO statements
- Limited error handling
- Comments must be on separate lines

**Planned Features:**
- Control flow statements
- Loop constructs
- Enhanced error messages
- More built-in functions

### Debugging Tips

1. **Start Simple**: Begin with basic PRINT statements to verify your logic
2. **Check Variables**: Use PRINT statements to display variable values
3. **Line Numbers**: Use consistent increments (10, 20, 30...)
4. **Test Incrementally**: Add one feature at a time
5. **Validate Input**: Be mindful of the automatic type conversion

**Example Debug Session:**
```basic
10 LET X = 5
15 PRINT "X is: " + str(X)  # Debug statement
20 LET Y = X * 2
25 PRINT "Y is: " + str(Y)  # Debug statement
30 PRINT "Final result: " + str(Y)
40 END
```

## Contributing

Contributions are welcome! Areas for improvement:

- Additional BASIC language features
- Better error handling and messages
- Performance optimizations
- More example programs
- Enhanced documentation

## License

This project is open source. Feel free to use, modify, and distribute.

## Version History

- **v1.0**: Initial release with basic LET, PRINT, INPUT, and END statements
- **v1.1**: Added INPUT functionality with prompts and automatic type conversion

---

**Happy Programming with PyBAS!** 🚀

For questions, issues, or suggestions, please create an issue in the repository.
