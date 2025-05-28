# Week 7: ASSEMBLER LANGUAGE: CONCEPTS AND TECHNIQUES

## Overview

The program converts mathematical expressions from infix notation (human-readable format like "A+B*C") to postfix notation (stack-friendly format like "ABC*+") using a stack data structure implemented in ARM64 assembly.

## Files

- `stack.s` - Main ARM64 assembly source file
- `Stack` - Compiled executable
- `Makefile` - Build configuration

## Algorithm: Shunting Yard

The program implements the classic Shunting Yard algorithm:

1. **Operands** (A-Z, a-z): Output directly to result
2. **Left Parenthesis** `(`: Push to stack
3. **Right Parenthesis** `)`: Pop operators until matching `(`
4. **Operators** (+, -, *, /, ^): Handle based on precedence
5. **End of Input**: Pop all remaining operators

## Example

**Input**: `"A+B*(C^D-E)/(F+G*H)"`  
**Output**: `"ABCD^E-*FGH*+/+"`

## Key ARM64 Assembly Concepts

- **Stack Pointer Management**: Using X3 register as stack pointer
- **Memory Operations**: LDRB/STRB for character manipulation
- **Addressing Modes**: ADRP/ADD for memory address calculation
- **Conditional Branching**: CMP/BEQ/BGE for control flow
- **System Calls**: SVC for output operations

## Code Structure

```assembly
_start:           // Initialize pointers
process_next_char: // Main processing loop
_is_operand:      // Handle operands (letters)
_process_operator: // Handle operators
_push_to_stack:   // Push operations
_pop_until_left_paren: // Handle right parenthesis
_finish:          // Clean up stack
_print_postfix:   // Output result
```

## Build and Run

```bash
# Compile and link
as -64 -o stack.o stack.s
ld -o Stack stack.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

# Or use Makefile
make

# Run the program
./Stack
```

## Expected Output

```
ABCD^E-*FGH*+/+
```

## Learning Objectives

- Understand stack data structure implementation in assembly
- Learn ARM64 memory addressing and manipulation
- Practice conditional branching and loop structures
- Implement classic computer science algorithms in low-level code
- Master system calls for input/output operations

## Notes

- The `_pop_higher_precedence` function is currently empty and needs implementation for full operator precedence support
- Stack grows upward in memory (X3 pointer increments)
- Character processing uses byte operations (W4 register for 8-bit values)
- Program demonstrates educational concepts of stack-based parsing