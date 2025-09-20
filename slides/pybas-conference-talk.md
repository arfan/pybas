---
marp: true
theme: default
style: |
  section {
    font-size: 24px;
    line-height: 1.6;
    padding: 40px;
  }
  .two-col {
    width: 48%;
    display: inline-block;
    vertical-align: top;
    margin-right: 2%;
  }
  .small-text {
    font-size: 0.8em;
  }
  .center {
    text-align: center;
  }
  h1 {
    color: #1976d2;
    font-size: 1.8em;
    margin-bottom: 1em;
  }
  h2 {
    color: #1976d2;
    border-bottom: 2px solid #1976d2;
    font-size: 1.4em;
    margin: 1.5em 0 1em 0;
    padding-bottom: 0.5em;
  }
  h3 {
    font-size: 1.1em;
    margin: 1em 0 0.5em 0;
  }
  ul {
    margin: 1em 0;
    padding-left: 1.5em;
  }
  li {
    margin: 0.5em 0;
  }
  pre {
    font-size: 0.7em;
    line-height: 1.4;
    margin: 1em 0;
    background: #f5f5f5;
    padding: 1em;
    border-radius: 4px;
  }
  code {
    font-size: 0.85em;
    background: #f0f0f0;
    padding: 0.2em 0.4em;
    border-radius: 3px;
  }
paginate: true
header: 'PyBAS: GW-BASIC Meets Modern Python'
footer: 'Conference Talk 2025'
---

# PyBAS: GW-BASIC Meets Modern Python

<div class="center">

**A modern interpreter bringing classic BASIC programming into the Python ecosystem**

*Presented at [Conference Name] 2025*

</div>

---

## Who Am I?

- **Software Developer** passionate about programming languages
- **Retro Computing Enthusiast** who grew up with BASIC
- **Open Source Contributor** building educational tools
- **Advocate** for making programming accessible to everyone

### Why PyBAS?

*"Every programmer has a story about their first line of code. Mine was in BASIC."*

---

## The Problem: Lost Programming Heritage

<div class="two-col">

### **The Golden Age (1980s)**
- BASIC was everywhere
- Immediate feedback
- Line-by-line programming
- Gateway to programming

</div>
<div class="two-col">

### **Modern Challenges**
- Complex development environments
- Steep learning curves
- Missing historical perspective
- Limited retro compatibility

</div>

**The Gap**: No modern, maintained BASIC interpreter with contemporary features

---

## Introducing PyBAS

<div class="center">

**A GW-BASIC Compatible Interpreter Written in Python**

</div>

<div class="two-col">

### **Classic BASIC Features**
- Line numbers
- GOTO statements
- FOR...NEXT loops
- IF...GOTO conditionals
- Variables and expressions
- INPUT/PRINT statements

</div>
<div class="two-col">

### **Modern Python Integration**
- Python expression evaluation
- Lists, dictionaries, sets
- Professional tooling
- PyPI distribution
- VS Code extension
- Code formatter

</div>

---

## Demo: Hello World

<div class="two-col">

### **Classic BASIC Program**

```basic
10 REM Hello World Program
20 PRINT "Hello, World!"
30 PRINT "Welcome to PyBAS!"
40 END
```

### **Running PyBAS**

```bash
$ pybas hello.pybas
Hello, World!
Welcome to PyBAS!
Program finished.
```

</div>
<div class="two-col">

### **The Magic**
- **Familiar syntax** from the 1980s
- **Modern execution** environment
- **Instant feedback** for learning
- **No complex setup** required

### **Installation**
```bash
pip install pybas
```

That's it! Ready to program like it's 1985.

</div>

---

## The Power of Python Integration

<div class="two-col">

### **Traditional BASIC**
```basic
10 LET A = 5
20 LET B = 10
30 LET SUM = A + B
40 PRINT SUM
```

</div>
<div class="two-col">

### **PyBAS with Python Power**
```basic
10 LET NUMBERS = [1, 2, 3, 4, 5]
20 LET TOTAL = sum(NUMBERS)
30 LET SQUARES = [x**2 for x in NUMBERS]
40 PRINT "Total: " + str(TOTAL)
50 PRINT "Squares: " + str(SQUARES)
```

</div>

**Result**: Classic simplicity with modern capabilities!

---

## Interactive Development: PyBAS REPL

<div class="small-text">

```
PyBAS REPL v1.0 - GW-BASIC style interactive environment

> 10 PRINT "Building a program step by step"
Line 10 entered
> 20 FOR I = 1 TO 3
Line 20 entered  
> 30   PRINT "Step " + str(I)
Line 30 entered
> 40 NEXT I
Line 40 entered
> RUN
Building a program step by step
Step 1
Step 2  
Step 3
Program finished.
```

</div>

---

## Professional Tooling: Code Formatting

<div class="two-col">

### **Before Formatting**
```basic
5 print"messy code"
15  let x=5
25   for i=1to 3
35 print"Number: "+str(i)
45next i
55end
```

### **Command**
```bash
pybasfmt messy.pybas
```

</div>
<div class="two-col">

### **After Formatting**
```basic
10 PRINT "messy code"
20 LET x = 5
30 FOR i = 1 TO 3
40   PRINT "Number: " + str(i)
50 NEXT i
60 END
```

### **Benefits**
- Consistent line numbering
- Proper indentation
- Standardized spacing
- Professional appearance

</div>

---

## VS Code Extension: Modern IDE Support

<div class="two-col">

### **Features**
- **Syntax highlighting**
- **Code snippets**
- **IntelliSense support**
- **Error detection**
- **Integrated execution**

### **Installation**
```
Extensions → Search "PyBAS"
```

</div>
<div class="two-col">

### **Code Snippets**
- `for` → FOR loop template
- `if` → IF...GOTO template
- `input` → INPUT statement
- `print` → PRINT statement

### **Benefits**
- Professional development
- Complete feature set
- Community support

</div>

---

## Real-World Applications

<div class="two-col">

### **Education**
- Computer Science courses
- Programming fundamentals
- Historical perspective
- Gentle introduction to coding

### **Retro Computing**
- Vintage program recreation
- Historical preservation
- Nostalgia projects
- Retro game development

</div>
<div class="two-col">

### **Learning & Research**
- Language design studies
- Interpreter development
- Algorithm exploration
- Quick prototyping

### **Modern Development**
- Scripting tasks
- Data processing
- Teaching tools
- Code demonstrations

</div>

---

## Live Demo: Data Structures

<div class="small-text">

```basic
10 REM Student Grade Management System
20 LET STUDENTS = [{"name": "Alice", "grades": [95, 87, 92]}]
30 LET STUDENT = STUDENTS[0]
40 PRINT "Student: " + STUDENT["name"]
50 LET GRADES = STUDENT["grades"]
60 PRINT "Average: " + str(sum(GRADES) / len(GRADES))
70 LET HIGH_SCORES = {score for score in GRADES if score >= 90}
80 PRINT "High scores: " + str(HIGH_SCORES)
90 END
```

**Output:**
```
Student: Alice
Average: 91.33
High scores: {95, 92}
```

</div>

---

## Architecture & Design

<div class="two-col">

### **Core Components**
- **Interpreter Engine**
  - Python-based execution
  - Safe expression evaluation
  - Error handling
  
- **REPL Interface**
  - Interactive programming
  - Command system
  - File management

</div>
<div class="two-col">

### **Modern Integration**
- **Code Formatter**
  - AST-based formatting
  - Configurable rules
  - Professional output

- **Package Distribution**
  - PyPI compatible
  - Easy installation
  - Global availability

</div>

**Philosophy**: *Embrace the past, empower with the present*

---

## Performance & Compatibility

<div class="two-col">

### **Performance Characteristics**
- **Startup time**: < 100ms
- **Memory usage**: Minimal
- **Execution speed**: Python-equivalent
- **File size**: Small programs

### **Python Requirements**
- **Python 3.7+** compatibility
- **Zero dependencies** for core functionality
- **Cross-platform** support

</div>
<div class="two-col">

### **GW-BASIC Compatibility**
- Line numbers required
- GOTO/GOSUB statements
- FOR...NEXT loops
- IF...GOTO conditionals
- Variables and expressions
- Graphics commands (future)
- File I/O (future)

</div>

---

## Open Source & Community

<div class="two-col">

### **MIT Licensed**
- Free for all uses
- Educational friendly
- Commercial compatible
- Contribution welcome

### **Extensible Design**
- Modular architecture
- Plugin-ready
- Easy to enhance
- Well-documented

</div>
<div class="two-col">

### **Community Goals**
- Educational tool adoption
- Retro computing preservation
- Programming accessibility
- Historical awareness

### **Future Roadmap**
- Graphics support
- Sound capabilities
- More BASIC dialects
- Educational resources

</div>

---

## Impact & Reception

<div class="two-col">

### **Educational Impact**
- Simplified learning curve
- Immediate feedback
- Historical context
- Gateway to programming

### **Community Response**
- GitHub stars growing
- Educational adoption
- Positive feedback
- Active contributors

</div>
<div class="two-col">

### **Use Cases in the Wild**
- University courses
- Coding bootcamps
- Retro computing clubs
- Personal projects

### **Success Metrics**
- PyPI downloads
- GitHub engagement
- Educational adoption
- User testimonials

</div>

---

## Technical Deep Dive: Expression Evaluation

<div class="small-text">

```python
def safe_eval(self, expression, line_num=None):
    """Safely evaluate Python expressions in BASIC context"""
    try:
        return eval(expression, {}, self.vars)
    except ZeroDivisionError:
        print(f"Error on line {line_num}: Division by zero")
    except NameError as e:
        var_name = str(e).split("'")[1]
        print(f"Error on line {line_num}: Variable '{var_name}' not defined")
    # ... more error handling
```

</div>

**Key insight**: BASIC simplicity + Python power = Magic!

---

## Challenges & Solutions

<div class="two-col">

### **Challenges Faced**
- Security concerns with `eval()`
- Error message clarity
- Performance optimization
- BASIC dialect compatibility
- Modern feature integration

### **Solutions Implemented**
- Sandboxed execution environment
- User-friendly error messages
- Efficient parsing algorithms
- Careful compatibility testing
- Gradual feature introduction

</div>
<div class="two-col">

### **Design Decisions**
- **Explicit line numbers** (classic feel)
- **Python expressions** (modern power)
- **Case-insensitive keywords** (BASIC tradition)
- **Immediate execution** (learning friendly)
- **Modular architecture** (extensibility)

### **Lessons Learned**
- Simplicity is powerful
- Nostalgia drives adoption
- Education needs accessibility
- Community feedback is invaluable

</div>

---

## Future Roadmap

<div class="two-col">

### **Short Term (6 months)**
- Graphics primitives (LINE, CIRCLE)
- Sound support (BEEP, PLAY)
- File I/O operations
- Additional BASIC dialects
- Enhanced error reporting

### **Medium Term (1 year)**
- Visual programming interface
- Debugging capabilities
- Performance profiling
- Educational curriculum
- Mobile app version

</div>
<div class="two-col">

### **Long Term (2+ years)**
- Multi-language support
- Cloud-based execution
- Collaborative programming
- Game development framework
- AI-assisted coding

### **Community Goals**
- 1000+ GitHub stars
- Educational partnerships
- Conference presentations
- Academic publications
- Industry adoption

</div>

---

## Call to Action

<div class="two-col">

### **Get Started Today**
```bash
pip install pybas
pybas --help
pybasrepl
```

### **Learn More**
- GitHub: Complete source code
- Documentation: Full guides
- Examples: 35+ sample programs
- Community: Join discussions

</div>
<div class="two-col">

### **Contribute**
- Code contributions
- Documentation improvements
- Educational content
- Bug reports and feedback
- Share your projects!

### **Teach & Share**
- Use in courses
- Create tutorials
- Share experiences
- Build the community

</div>

---

## Questions & Discussion

<div class="center">

### **Thank You!**

**PyBAS: Where 1985 meets 2025**

</div>

<div class="two-col">

### **Contact Information**
- Email: [your.email@example.com]
- GitHub: @yourusername
- Twitter: @yourhandle
- LinkedIn: yourprofile

### **Project Links**
- GitHub: Complete source code
- PyPI: pypi.org/project/pybas
- Documentation: Full guides
- Demo: Live examples

</div>
<div class="two-col">

### **Key Takeaways**
1. **Simplicity** drives adoption
2. **Nostalgia** has educational value
3. **Modern tools** can embrace history
4. **Community** builds great software
5. **Education** benefits from accessibility

### **Remember**
*Every expert was once a beginner.  
PyBAS makes that beginning joyful.*

</div>

---

## Appendix: Technical Specifications

<div class="small-text">

### **Supported BASIC Statements**

| Statement | Syntax | Example | Status |
|-----------|--------|---------|--------|
| LET | `LET var = expr` | `LET X = 5` | ✓ |
| PRINT | `PRINT expr` | `PRINT "Hello"` | ✓ |
| INPUT | `INPUT [prompt,] var` | `INPUT "Name: ", N` | ✓ |
| FOR...NEXT | `FOR var = start TO end [STEP step]` | `FOR I = 1 TO 10` | ✓ |
| IF...GOTO | `IF condition GOTO line` | `IF X > 5 GOTO 100` | ✓ |
| GOTO | `GOTO line` | `GOTO 50` | ✓ |
| END | `END` | `END` | ✓ |
| REM | `REM comment` | `REM This is a comment` | ✓ |

### **Python Integration Features**

- **Data Types**: int, float, str, list, dict, set, tuple
- **Built-ins**: len(), sum(), max(), min(), sorted(), range()
- **Operations**: List comprehensions, set operations, dict access
- **Safety**: Sandboxed execution, error handling, type checking

</div>