// ARM64 Assembly program 
// converts an infix expression to postfix

.global _start          
.align 2                

_start:
    ADRP X0, infix_expr@PAGE       
    ADD X0, X0, infix_expr@PAGEOFF 
    ADRP X1, postfix_expr@PAGE     
    ADD X1, X1, postfix_expr@PAGEOFF
    ADRP X2, stack@PAGE            
    MOV X3, X2                 

process_next_char:
    LDRB W4, [X0], #1        
    CMP W4, #0
    BEQ _finish               

    // Check if character is an operand (A-Z or a-z)
    CMP W4, #'A'
    BGE _check_upper_bound
    B _process_operator

_check_upper_bound:
    CMP W4, #'z'
    BLE _is_operand
    CMP W4, #'Z'
    BLE _is_operand
    B _process_operator

_is_operand:
    STRB W4, [X1], #1
    B process_next_char

_process_operator:
    // operators (+, -, *, /,..)
    CMP W4, #'('
    BEQ _push_to_stack
    CMP W4, #')'
    BEQ _pop_until_left_paren

    BL _pop_higher_precedence
    STRB W4, [X3], #1         
    B process_next_char

_push_to_stack:
    STRB W4, [X3], #1        
    B process_next_char

_pop_until_left_paren:
    LDRB W5, [X3, #-1]!      
    CMP W5, #'('
    BEQ process_next_char
    STRB W5, [X1], #1         
    B _pop_until_left_paren

_pop_higher_precedence:
    RET

_finish:
    LDRB W5, [X3, #-1]!
    CMP W5, #0
    BEQ _end
    STRB W5, [X1], #1
    B _finish

_print_postfix:
    MOV X0, #1
    ADRP X1, postfix_expr@PAGE 
    ADD X1, X1, postfix_expr@PAGEOFF
    MOV X2, #100       
    MOV X16, #4              
    SVC #0x80              

    MOV X0, #1              
    ADRP X1, newline@PAGE    
    ADD X1, X1, newline@PAGEOFF
    MOV X2, #1     
    MOV X16, #4     
    SVC #0x80    
    RET

_end:
    BL _print_postfix 
    MOV X16, #1    
    MOV X0, #0              
    SVC #0x80                 
// Data section
.section __DATA,__data
infix_expr:
    .asciz "A+B*(C^D-E)/(F+G*H)" 
postfix_expr:
    .space 100               
stack:
    .space 100                
newline:
    .asciz "\n"             