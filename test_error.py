#!/usr/bin/env python3

# Test script to see error behavior
class BasicInterpreter:
    def __init__(self):
        self.vars = {}
    
    def test_error(self):
        try:
            result = eval("5 / 0", {}, self.vars)
            print(f"Result: {result}")
        except Exception as e:
            print(f"Python error: {e}")
            print(f"Error type: {type(e).__name__}")

if __name__ == "__main__":
    interp = BasicInterpreter()
    interp.test_error()