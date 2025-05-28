# Stack Operations in ARM64 Assembly

This project demonstrates stack operations using ARM64 assembly language by implementing an infix to postfix expression converter. The program showcases fundamental stack-based algorithms and ARM64 assembly programming concepts.

## Project Structure

- [`stack.s`](stack.s): Main ARM64 assembly source file implementing infix to postfix conversion
- [`Makefile`](Makefile): Build configuration for assembling and linking the program
- `Stack`: Compiled executable (generated after build)
- `stack.o`: Object file (generated during compilation)

## Features

- **Infix to Postfix Conversion**: Converts mathematical expressions from infix notation (e.g., "A+B") to postfix notation (e.g., "AB+")
- **Stack Operations**: Demonstrates push and pop operations using ARM64 assembly
- **Operator Precedence Handling**: Properly handles mathematical operator precedence during conversion
- **Parentheses Processing**: Correctly processes parentheses in mathematical expressions
- **Character Processing**: Processes operands (A-Z, a-z) and operators (+, -, *, /, etc.)

## Algorithm Overview

The program implements the **Shunting Yard Algorithm** for infix to postfix conversion:

1. **Operands** (letters) are directly added to the output
2. **Operators** are pushed to stack based on precedence rules
3. **Left parentheses** are pushed to stack
4. **Right parentheses** trigger popping until matching left parenthesis
5. **End of input** triggers popping all remaining operators

## Input/Output

- **Input**: `"A+B*(C^D-E)/(F+G*H)"` (hardcoded infix expression)
- **Output**: Corresponding postfix expression printed to stdout

## How to Build and Run

1. **Assemble and link** using the provided Makefile:
   ```sh
   make
   ```

2. **Run the program**:
   ```sh
   ./Stack
   ```

3. **Clean build artifacts**:
   ```sh
   make clean
   ```

## ARM64 Assembly Concepts Demonstrated

- **Memory addressing** using ADRP and ADD instructions
- **Stack pointer manipulation** for stack operations
- **Character processing** using LDRB and STRB instructions
- **Conditional branching** with CMP and branch instructions
- **Function calls** using BL (Branch with Link)
- **System calls** for output operations

## Key Code Sections

- **Initialization**: Sets up pointers to input, output, and stack memory
- **Character Processing Loop**: Main loop that processes each character
- **Operand Handling**: Directly copies operands to output
- **Operator Processing**: Implements precedence-based stack operations
- **Parentheses Handling**: Special logic for left and right parentheses
- **Output Generation**: System calls to print the result

## Notes

- The program uses ARM64 (AArch64) assembly syntax
- Stack grows upward in this implementation
- The program demonstrates educational concepts rather than production-ready code
- Memory spaces are pre-allocated with `.space` directives

## License

This project is for educational purposes as part of CS1105 - Digital Electronics and Computer Architecture.
