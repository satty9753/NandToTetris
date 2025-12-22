### Hack C-Instruction Reference

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