# PyBAS Interpreter: Step-by-Step Technical Guide

## Overview

This document explains how the PyBAS interpreter works internally, including the program counter mechanism, keyword handling, and advanced features like functions and subroutines.

## Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Program Loading and Parsing](#program-loading-and-parsing)
3. [Program Counter (PC) Management](#program-counter-pc-management)
4. [Execution Engine](#execution-engine)
5. [Keyword Handling](#keyword-handling)
6. [Function System](#function-system)
7. [Error Handling](#error-handling)
8. [Memory Management](#memory-management)

---

## Architecture Overview

The PyBAS interpreter follows a classic interpreter design pattern:

```
Source Code (.pybas) → Parser → Execution Engine → Output
                          ↓
                    Program Counter (PC)
                          ↓
                     Variable Storage
```

### Core Components

1. **BasicInterpreter Class**: Main interpreter engine
2. **Program Storage**: Dictionary mapping line numbers to statements
3. **Variable Storage**: Dictionary for runtime variables
4. **Execution Stacks**: Multiple stacks for different control structures
5. **Function Registry**: Storage for user-defined functions

---

## Program Loading and Parsing

### Phase 1: Initial Loading

When a `.pybas` file is loaded:

```python
def __init__(self, program_lines):
    self.program = {}           # {line_number: statement}
    self.vars = {}             # {variable_name: value}
    self.pc = None             # Program Counter
    self.stack = []            # General purpose stack
    self.for_stack = []        # FOR loop stack
    self.gosub_stack = []      # GOSUB/RETURN stack
    self.functions = {}        # Function definitions
    self.function_call_stack = [] # Function call stack
```

**Step-by-step loading process:**

1. **Read each line** from the input file
2. **Skip comments** (lines starting with `'`) and empty lines
3. **Parse line numbers**: Split each line into `line_number` and `statement`
4. **Store in program dictionary**: `self.program[line_number] = statement`
5. **Set initial PC**: Program Counter starts at the lowest line number

### Phase 2: Function Pre-processing

Before execution begins, the interpreter scans for `DEF...ENDDEF` blocks:

```python
def parse_functions(self):
    """Parse DEF...ENDDEF function definitions and store them"""
    sorted_lines = sorted(self.program.keys())
    
    # Scan for DEF statements
    for line_num in sorted_lines:
        if stmt.startswith("DEF "):
            # Extract function name and parameters
            func_name, params = self.parse_def_statement(func_line)
            
            # Collect function body until ENDDEF
            func_body = {}
            # ... collect statements ...
            
            # Store function definition
            self.functions[func_name] = {
                'params': params,
                'body': func_body,
                'def_line': line_num
            }
            
            # Remove from main program
            del self.program[line_num]  # DEF line
            # ... remove body lines ...
```

**Why pre-process functions?**
- Functions can be defined anywhere but called from anywhere
- Removes function definitions from main execution flow
- Enables forward references (calling functions defined later)

---

## Program Counter (PC) Management

The Program Counter is the heart of the interpreter, determining which line executes next.

### PC Initialization

```python
self.pc = min(self.program.keys())  # Start at lowest line number
```

### PC Movement Patterns

#### 1. Sequential Execution (Default)

```python
def run(self):
    while self.pc in self.program:
        stmt = self.program[self.pc]
        next_pc = self.execute(stmt)
        
        if next_pc is not None:
            self.pc = next_pc              # Jump instruction
        else:
            # Move to next sequential line
            next_lines = sorted([n for n in self.program if n > self.pc])
            self.pc = next_lines[0] if next_lines else None
```

#### 2. Jump Instructions (GOTO)

```python
if stmt_upper.startswith("GOTO"):
    target_line = int(stmt_upper.split()[1])
    if target_line in self.program:
        return target_line  # PC jumps to target
    else:
        print(f"Error: GOTO target line {target_line} does not exist")
        sys.exit(1)
```

#### 3. Conditional Jumps (IF...GOTO)

```python
def handle_if_statement(self, stmt, stmt_upper):
    # Parse: IF X = 5 GOTO 100
    if_part, goto_part = stmt_upper.split("GOTO", 1)
    target_line = int(goto_part.strip())
    condition = if_part[2:].strip()  # Remove "IF"
    
    # Evaluate condition
    if condition_result:
        return target_line    # PC jumps if true
    else:
        return None          # PC continues sequentially if false
```

#### 4. Subroutine Calls (GOSUB/RETURN)

```python
# GOSUB: Save return address and jump
if stmt_upper.startswith("GOSUB"):
    target_line = int(stmt_upper.split()[1])
    
    # Find next line for return address
    next_lines = sorted([n for n in self.program if n > self.pc])
    return_address = next_lines[0] if next_lines else None
    
    # Push return address onto stack
    self.gosub_stack.append(return_address)
    
    return target_line  # Jump to subroutine

# RETURN: Pop return address and jump back
elif stmt_upper.startswith("RETURN"):
    if not self.gosub_stack:
        print("Error: RETURN without GOSUB")
        sys.exit(1)
    
    return_address = self.gosub_stack.pop()
    return return_address  # Jump back to caller
```

### PC Stack Management

Different control structures use different stacks:

1. **GOSUB Stack**: Tracks subroutine return addresses
2. **FOR Stack**: Tracks loop variables and bounds
3. **Function Stack**: Tracks function call context (local variables)

---

## Execution Engine

### Main Execution Loop

```python
def run(self):
    while self.pc in self.program:
        stmt = self.program[self.pc]
        next_pc = self.execute(stmt)
        
        if stmt.upper().startswith("END"):
            break
            
        # Update PC based on instruction type
        if next_pc is not None:
            self.pc = next_pc
        else:
            # Move to next line
            next_lines = sorted([n for n in self.program if n > self.pc])
            self.pc = next_lines[0] if next_lines else None
```

### Statement Execution Priority

The interpreter checks statements in this order:

1. **Function Calls** (contains parentheses)
2. **Control Flow** (GOTO, GOSUB, RETURN, IF)
3. **Variable Assignment** (LET)
4. **Input/Output** (PRINT, INPUT)
5. **Loop Control** (FOR, NEXT)
6. **Program Control** (END, REM)

---

## Keyword Handling

### Case Insensitivity

All keywords are converted to uppercase for consistent matching:

```python
def execute(self, stmt):
    stmt_upper = stmt.upper()
    
    if stmt_upper.startswith("PRINT"):
        # Handle PRINT statement
    elif stmt_upper.startswith("LET"):
        # Handle LET statement
```

### Variable Assignment (LET)

```python
elif stmt_upper.startswith("LET"):
    # Example: LET A = 5
    _, expr = stmt.split(" ", 1)
    var, val = expr.split("=")
    self.vars[var.strip()] = self.safe_eval(val.strip(), self.pc)
```

**Process:**
1. Remove "LET" keyword
2. Split on "=" to get variable name and expression
3. Evaluate expression using `safe_eval()`
4. Store result in variables dictionary

### Output (PRINT)

```python
elif stmt_upper.startswith("PRINT"):
    _, expr = stmt.split(" ", 1)
    print(self.safe_eval(expr.strip(), self.pc))
```

**Process:**
1. Remove "PRINT" keyword
2. Evaluate expression (supports variables, arithmetic, strings)
3. Print result to console

### Input (INPUT)

```python
elif stmt_upper.startswith("INPUT"):
    # Example: INPUT "Enter your name: ", NAME
    _, expr = stmt.split(" ", 1)
    if "," in expr:
        prompt, var = expr.split(",", 1)
        prompt = prompt.strip().strip('"')
        var = var.strip()
        user_input = input(prompt)
        
        # Auto-convert to number if possible
        try:
            self.vars[var] = float(user_input) if '.' in user_input else int(user_input)
        except ValueError:
            self.vars[var] = user_input
```

**Process:**
1. Parse prompt and variable name
2. Display prompt to user
3. Get user input
4. Auto-convert to number if possible, otherwise store as string
5. Store in variables dictionary

### Loop Control (FOR/NEXT)

#### FOR Statement

```python
elif stmt_upper.startswith("FOR"):
    # Example: FOR I = 1 TO 10 STEP 2
    _, expr = stmt.split(" ", 1)
    parts = expr.split()
    
    var = parts[0]                                    # Loop variable
    start_val = self.safe_eval(parts[2], self.pc)    # Start value
    
    to_idx = next(i for i, part in enumerate(parts) if part.upper() == "TO")
    end_val = self.safe_eval(parts[to_idx + 1], self.pc)  # End value
    
    # Check for STEP
    step_val = 1
    step_indices = [i for i, part in enumerate(parts) if part.upper() == "STEP"]
    if step_indices:
        step_idx = step_indices[0]
        step_val = self.safe_eval(parts[step_idx + 1], self.pc)
    
    # Initialize loop variable
    self.vars[var] = start_val
    
    # Push loop info onto stack
    self.for_stack.append({
        'var': var,
        'end': end_val,
        'step': step_val,
        'line': self.pc
    })
```

#### NEXT Statement

```python
elif stmt_upper.startswith("NEXT"):
    if not self.for_stack:
        print("NEXT without FOR")
        return None
        
    loop_info = self.for_stack[-1]
    var = loop_info['var']
    
    # Increment loop variable
    self.vars[var] += loop_info['step']
    
    # Check if loop should continue
    if ((loop_info['step'] > 0 and self.vars[var] <= loop_info['end']) or
        (loop_info['step'] < 0 and self.vars[var] >= loop_info['end'])):
        # Continue loop - jump back to line after FOR
        for_line = loop_info['line']
        next_lines = sorted([n for n in self.program if n > for_line])
        if next_lines:
            return next_lines[0]
    else:
        # Exit loop
        self.for_stack.pop()
```

---

## Function System

The function system is one of the most sophisticated parts of PyBAS, implementing Python-like function definitions with local scope.

### Function Definition Storage

```python
self.functions[func_name] = {
    'params': ['X', 'Y'],           # Parameter names
    'body': {150: 'LET RESULT = X + Y', 160: 'RETURN RESULT'},  # Function body
    'def_line': 140                 # Original DEF line number
}
```

### Function Call Detection

The interpreter uses pattern matching to detect function calls:

```python
def try_execute_function_call(self, stmt):
    # Check for parentheses (function call pattern)
    if '(' not in stmt or ')' not in stmt:
        return False
    
    # Parse: RESULT = CALCULATE(5, 3) or just CALCULATE(5, 3)
    func_name_part = stmt[:stmt.index('(')].strip()
    
    if '=' in func_name_part:
        # Variable assignment with function call
        var_name, func_call = func_name_part.split('=', 1)
        var_name = var_name.strip()
        func_name = func_call.strip()
    else:
        # Direct function call
        var_name = None
        func_name = func_name_part
```

### Function Execution Context

When a function is called, the interpreter creates an isolated execution context:

```python
def call_function(self, func_name, param_values):
    func_def = self.functions[func_name]
    
    # 1. Save current state
    saved_vars = self.vars.copy()      # Save all variables
    saved_pc = self.pc                 # Save program counter
    saved_program = self.program       # Save current program
    
    # 2. Set up function parameters as local variables
    for i, param_name in enumerate(func_def['params']):
        self.vars[param_name] = param_values[i]
    
    # 3. Execute function body
    self.program = func_def['body']
    if self.program:
        self.pc = min(self.program.keys())
        
        # Execute until RETURN
        while self.pc in self.program:
            stmt = self.program[self.pc]
            
            if stmt.upper().startswith("RETURN"):
                # Extract return value
                parts = stmt.split(None, 1)
                if len(parts) > 1:
                    return_value = self.safe_eval(parts[1], self.pc)
                else:
                    return_value = None
                break
            
            # Execute statement normally
            next_pc = self.execute(stmt)
            # ... PC management ...
    
    # 4. Restore state (keeping new global variables)
    new_vars = {}
    for var, value in self.vars.items():
        if var not in func_def['params'] and var not in saved_vars:
            new_vars[var] = value
    
    self.vars = saved_vars
    self.vars.update(new_vars)
    
    # 5. Restore execution context
    self.pc = saved_pc
    self.program = saved_program
    
    return return_value if return_value is not None else 0
```

### Function Calls in Expressions

One of the most complex features is supporting function calls within expressions:

```python
def preprocess_function_calls(self, expression):
    """Replace function calls in expressions with their return values"""
    import re
    
    # Find function calls: WORD(params)
    pattern = r'([A-Z_][A-Z0-9_]*)\s*\(([^)]*)\)'
    
    def replace_func_call(match):
        func_name = match.group(1).upper()
        params_str = match.group(2).strip()
        
        if func_name in self.functions:
            # Evaluate parameters
            if params_str:
                param_values = []
                for param in params_str.split(','):
                    param_values.append(self.safe_eval(param.strip(), self.pc))
            else:
                param_values = []
            
            # Call function and return the result
            result = self.call_function(func_name, param_values)
            return str(result)
        else:
            return match.group(0)  # Not a user function
    
    # Keep replacing until no more function calls found
    prev_expr = ""
    while prev_expr != expression:
        prev_expr = expression
        expression = re.sub(pattern, replace_func_call, expression)
    
    return expression
```

**Example:** `PRINT ADD(3, 4) * 2`
1. Pattern matches `ADD(3, 4)`
2. Calls `ADD` function with parameters `[3, 4]`
3. Function returns `7`
4. Expression becomes `PRINT 7 * 2`
5. Final result: `14`

---

## Error Handling

The interpreter provides comprehensive error handling with line number context:

### Safe Expression Evaluation

```python
def safe_eval(self, expression, line_num=None):
    try:
        # Pre-process function calls
        processed_expr = self.preprocess_function_calls(expression)
        return eval(processed_expr, {}, self.vars)
        
    except ZeroDivisionError:
        print(f"Error on line {line_num}: Division by zero")
        sys.exit(1)
        
    except NameError as e:
        var_name = str(e).split("'")[1] if "'" in str(e) else "unknown"
        print(f"Error on line {line_num}: Variable '{var_name}' is not defined")
        sys.exit(1)
        
    except SyntaxError:
        print(f"Error on line {line_num}: Invalid expression syntax")
        sys.exit(1)
        
    except ValueError as e:
        print(f"Error on line {line_num}: Invalid value - {str(e)}")
        sys.exit(1)
        
    except TypeError as e:
        print(f"Error on line {line_num}: Type error - {str(e)}")
        sys.exit(1)
        
    except Exception as e:
        print(f"Error on line {line_num}: {str(e)}")
        sys.exit(1)
```

### Common Error Types

1. **Division by Zero**: Arithmetic errors with clear messaging
2. **Undefined Variables**: References to variables that don't exist
3. **Syntax Errors**: Invalid expressions or malformed statements
4. **Type Errors**: Incompatible operations (e.g., string + number)
5. **Control Flow Errors**: RETURN without GOSUB, NEXT without FOR
6. **Function Errors**: Wrong parameter count, undefined functions

---

## Memory Management

### Variable Storage

Variables are stored in a simple Python dictionary:

```python
self.vars = {
    'X': 5,
    'NAME': 'World',
    'RESULT': 42.5
}
```

**Features:**
- **Automatic typing**: Numbers vs strings determined at runtime
- **Type conversion**: Input automatically converts to numbers when possible
- **Global scope**: Variables persist across statements (except in functions)

### Stack Management

The interpreter maintains several stacks for different purposes:

1. **FOR Stack**: Loop context (variable, end value, step, line number)
2. **GOSUB Stack**: Return addresses for subroutines
3. **Function Stack**: Function call context (parameters, local variables)

### Memory Lifecycle

1. **Program Load**: Source code parsed into line number dictionary
2. **Function Parse**: Function definitions extracted and stored separately
3. **Execution**: Variables created on demand, stacks managed automatically
4. **Function Calls**: Temporary context created and cleaned up
5. **Program End**: All memory automatically released by Python GC

---

## Performance Characteristics

### Time Complexity

- **Sequential execution**: O(1) per statement
- **GOTO jumps**: O(1) direct line access
- **Variable lookup**: O(1) dictionary access
- **Function calls**: O(1) + function execution time
- **Expression evaluation**: O(n) where n is expression complexity

### Space Complexity

- **Program storage**: O(n) where n is number of lines
- **Variable storage**: O(v) where v is number of variables
- **Stack storage**: O(d) where d is maximum call/loop depth

### Design Trade-offs

**Advantages:**
- Simple and readable implementation
- Excellent error messages with line numbers
- Flexible expression evaluation using Python's eval()
- Support for complex features (functions, recursion)

**Limitations:**
- Uses Python's eval() (security consideration for untrusted code)
- No optimization for large programs
- Sequential search for next line numbers
- Memory usage grows with program size

---

## Example Execution Trace

Let's trace through the execution of `examples/function_demo.pybas`:

```pybas
10 PRINT "=== DEF/ENDDEF Function Demo ==="
40 RESULT = ADD(5, 3)
50 PRINT "5 + 3 ="
60 PRINT RESULT
150 DEF ADD(X, Y)
160   LET RESULT = X + Y
170   RETURN RESULT
180 ENDDEF
```

### Execution Steps:

1. **Load Phase**:
   - Parse lines 10, 40, 50, 60 into `self.program`
   - Parse function `ADD` (lines 150-180) into `self.functions`
   - Remove function lines from `self.program`
   - Set `self.pc = 10`

2. **Line 10**: `PRINT "=== DEF/ENDDEF Function Demo ==="`
   - Execute PRINT statement
   - Output: "=== DEF/ENDDEF Function Demo ==="
   - PC moves to 40

3. **Line 40**: `RESULT = ADD(5, 3)`
   - Detect function call pattern (contains parentheses)
   - Parse: variable=`RESULT`, function=`ADD`, params=`[5, 3]`
   - Call function `ADD`:
     - Save current state (vars, pc, program)
     - Set parameters: `X=5, Y=3`
     - Execute function body line 160: `LET RESULT = X + Y` → `RESULT = 8`
     - Execute function body line 170: `RETURN RESULT` → return `8`
     - Restore state
   - Set `RESULT = 8` in global variables
   - PC moves to 50

4. **Line 50**: `PRINT "5 + 3 ="`
   - Output: "5 + 3 ="
   - PC moves to 60

5. **Line 60**: `PRINT RESULT`
   - Lookup `RESULT` in variables → `8`
   - Output: "8"
   - PC moves to next line (none), program ends

This demonstrates the sophisticated interaction between the program counter, function call mechanism, variable scoping, and execution context management that makes PyBAS a powerful yet simple BASIC interpreter.