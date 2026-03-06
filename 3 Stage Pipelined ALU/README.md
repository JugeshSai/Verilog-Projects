# 16-bit Three-Stage Pipelined Arithmetic Logic Unit (ALU)

## Overview
This project implements a **16-bit Three-Stage Pipelined Arithmetic Logic Unit (ALU)** using **Verilog HDL**.  
The ALU supports multiple **arithmetic, logical, shift, and rotate operations** controlled by a **4-bit opcode**.

The design follows a **pipelined architecture** to improve throughput by dividing execution into three stages:
1. Input Register Stage
2. Execution Stage
3. Output and Flag Generation Stage

The ALU also generates two status flags:
- **Carry Flag**
- **Zero Flag**

---

## Pipeline Architecture

### Stage 1 – Input Register Stage
Input operands and control signals are captured on the rising edge of the clock.

Registered signals:
- `A_s1`
- `B_s1`
- `opcode_s1`
- `cin_s1`

Purpose:
- Synchronizes inputs
- Prevents timing issues
- Feeds the execution stage

---

### Stage 2 – Execution Stage
The ALU operation is performed based on the opcode.

Outputs generated:
- `alu_result_s2`
- `carry_s2`

This stage performs the core **arithmetic and logical computations**.

---

### Stage 3 – Output and Flag Generation
The final ALU result and status flags are generated.

Outputs:
- `result`
- `carry`
- `zero`

Zero flag logic:

```verilog
zero = (alu_result_s2 == 16'd0);
```

---

## Pipeline Timing

Because of pipelining, the result appears **after three clock cycles**.

```
Cycle 1 → Input Register
Cycle 2 → ALU Execution
Cycle 3 → Output + Flag Generation
```

---

## ALU Operation Table

| Opcode | Operation | Description |
|------|------|------|
| `0000` | PASS A | Output = A |
| `0001` | PASS B | Output = B |
| `0010` | ADD | A + B |
| `0011` | ADD WITH CARRY | A + B + Cin |
| `0100` | SUBTRACT | A − B |
| `0101` | SUBTRACT WITH BORROW | A − B − Cin |
| `0110` | INCREMENT A | A + 1 |
| `0111` | DECREMENT B | B − 1 |
| `1000` | AND | Bitwise AND |
| `1001` | OR | Bitwise OR |
| `1010` | NAND | Bitwise NAND |
| `1011` | NOR | Bitwise NOR |
| `1100` | SHIFT RIGHT | Logical shift right of A |
| `1101` | SHIFT LEFT | Logical shift left of B |
| `1110` | ROTATE RIGHT | Rotate right A |
| `1111` | ROTATE LEFT | Rotate left B |

---

## Status Flags

### Carry Flag
Indicates carry generation during arithmetic operations.

### Zero Flag
Set to **1** when the output result equals zero.

```verilog
zero = (result == 16'd0);
```

---

## Testbench

A Verilog testbench is used to verify the ALU functionality across different operations.

Test cases include:
- Pass A / Pass B
- Addition and Addition with Carry
- Subtraction
- Logical operations (AND, OR, NAND, NOR)
- Shift operations
- Rotate operations

Clock generation in testbench:

```verilog
always #5 clk = ~clk;
```

Simulation ends using:

```verilog
$finish;
```

---

## Tools Used

- **Verilog HDL**
- **Xilinx Vivado**

---

## Key Features

- 16-bit datapath
- Three-stage pipelined architecture
- Arithmetic and logical operations
- Shift and rotate operations
- Carry and Zero flag generation
- Verified using simulation testbench

---

## Output Waveforms

<img width="1475" height="702" alt="Screenshot 2026-03-06 135416" src="https://github.com/user-attachments/assets/6e26ab89-2ab0-481b-93df-7ebe4a3e0a89" />
<img width="1477" height="800" alt="Screenshot 2026-03-06 135443" src="https://github.com/user-attachments/assets/881264b1-f78f-4529-bc25-19066e3fb769" />
<img width="1475" height="757" alt="Screenshot 2026-03-06 135501" src="https://github.com/user-attachments/assets/9112ecd5-b5d4-4807-af7e-2d6b6b227a62" />

---

## ✍️ Author

**JugeshSai N**  
📧 [jugesh.njs@gmail.com](mailto:jugesh.njs@gmail.com)  
🔗 [LinkedIn: www.linkedin.com/in/jugeshsai](https://www.linkedin.com/in/jugeshsai)

---

## 📜 License

This repository is shared for educational and personal learning purposes only. No license has been applied.
