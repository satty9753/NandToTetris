## Hack A-instruction Reference
**Format:** `0 v v v v v v v v v v v v v v v v`
- Bit 15 = 0: The OpCode that identifies this as an A-instruction.
- Bits 0–14 ($v$): A 15-bit non-negative binary value (ranging from $0$ to $32,767$).

### The Three Roles of the A-instruction

#### A. Entering Constants
To load a specific number into the CPU for calculation.
- Assembly: @100
- Effect: The value 100 is stored in the A-register.

#### B. Selecting RAM Addresses
The Hack C-instruction cannot reference a memory address directly. To access RAM[500], you must use the A-register as a pointer:

1. @500 (Point the A-register to address 500).
2. D=M (The CPU now accesses RAM[A], which is RAM[500]).

#### C. Setting Jump Targets
To jump to a specific line of code in the Program Memory (ROM):

1. @15 (Load the target ROM address into A).
2. D;JGT (If the condition is met, the PC loads the value from the A-register, jumping to line 15).

## Hack C-Instruction Reference

**Format:** `111 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3`

| Comp (a=0) | Comp (a=1) | c1-c6 |
| :--- | :--- | :--- |
| 0 | | 101010 |
| 1 | | 111111 |
| D | | 001100 |
| A | M | 110000 |
| D+1 | | 011111 |
| A+1 | M+1 | 110111 |
| D+A | D+M | 000010 |

| Dest | d1 d2 d3 |
| :--- | :--- |
| null | 000 |
| M | 001 |
| D | 010 |
| MD | 011 |
| A | 100 |

| Jump | j1 j2 j3 | Condition |
| :--- | :--- | :--- |
| null | 000 | No jump |
| JGT | 001 | out > 0 |
| JEQ | 010 | out = 0 |
| JGE | 011 | out >= 0 |
| JLT | 100 | out < 0 |
| JNE | 101 | out != 0 |
| JLE | 110 | out <= 0 |
| JMP | 111 | Unconditional |