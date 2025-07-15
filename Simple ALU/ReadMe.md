# ✅ Simple 4-bit ALU with 7-Segment Display on Artix-7 FPGA

## 📘 Project Overview

This Verilog-based project implements a **4-bit Arithmetic Logic Unit (ALU)** on the **Invent Logics Edge Artix-7 FPGA board (50 MHz)**. It supports 16 operations (arithmetic & logic) and uses a **4-digit 7-segment display** to show the result and operands using time-multiplexing. Clock division is employed for both computation timing and display refreshing.

---

## 🎯 Features

- **16 operations supported** via 4-bit `op_code`
- **4-bit input operands** `a_in`, `b_in`, `c_in`
- **Carry and Zero flags** (`carry`, `zero`)
- **Multiplexed 4-digit 7-segment display** (result, op-code, b_in, a_in)
- **Clock Divider Module**:
  - `1 Hz` → ALU operations
  - `500 Hz` → 7-segment display refresh

---

## 🧠 ALU Operation Table

| Opcode | Operation                      | Description                 |
|--------|-------------------------------|-----------------------------|
| 0      | `result = a_in`                | Pass-through A              |
| 1      | `result = b_in`                | Pass-through B              |
| 2      | `result = a_in + b_in`         | Unsigned addition           |
| 3      | `result = a_in + b_in + c_in`  | Addition with carry-in      |
| 4      | `result = a_in - b_in`         | Unsigned subtraction        |
| 5      | `result = a_in - b_in - c_in`  | Subtraction with borrow     |
| 6      | `result = a_in + 1`            | Increment A                 |
| 7      | `result = b_in - 1`            | Decrement B                 |
| 8      | `result = a_in & b_in`         | AND                         |
| 9      | `result = a_in \| b_in`        | OR                          |
| 10     | `result = ~(a_in & b_in)`      | NAND                        |
| 11     | `result = ~(a_in \| b_in)`     | NOR                         |
| 12     | `result = a_in >> 1`           | Shift Right A               |
| 13     | `result = b_in << 1`           | Shift Left B                |
| 14     | `result = {a_in[0], a_in[3:1]}`| Right Rotate A              |
| 15     | `result = {b_in[2:0], b_in[3]}`| Left Rotate B               |

---


## 📊 Input/Output Details

### Inputs

| Signal     | Width | Description             |
|------------|--------|-------------------------|
| `clk1`     | 1      | 50 MHz onboard clock    |
| `rst`      | 1      | Active-high reset       |
| `a_in`     | 4      | Operand A               |
| `b_in`     | 4      | Operand B               |
| `c_in`     | 1      | Carry-in                |
| `op_code`  | 4      | Operation selector      |

### Outputs

| Signal     | Width | Description                       |
|------------|--------|-----------------------------------|
| `carry`    | 1      | Carry-out flag                    |
| `zero`     | 1      | Result is zero indicator          |
| `seg[7:0]` | 8      | 7-segment cathode outputs         |
| `an[3:0]`  | 4      | 7-segment digit enable (active low) |

---

## 🕓 Clock Frequencies

| Clock         | Frequency | Purpose                          |
|---------------|-----------|----------------------------------|
| `clk1`        | 50 MHz    | Base system clock from FPGA board |
| `clk_1hz`     | 1 Hz      | ALU computation trigger          |
| `clk_500hz`   | 500 Hz    | 7-segment display refresh        |

---

## 🧩 Hardware Details

- **Target FPGA**: Artix-7 (XC7A35T - Invent Logics Edge Board)
- **7-Segment**: Common-Anode 4-digit display
- **Display Format**:
  - **AN0** = result (units)
  - **AN1** = result (tens)
  - **AN2** = `b_in`
  - **AN3** = `a_in`

---

## 📸 Simulation & Output

![WhatsApp Image 2025-07-15 at 20 22 58_a8d27c95](https://github.com/user-attachments/assets/78abfade-36ed-4b46-a5aa-5b12c5257b3e)


---

## 🛠️ Tools Used

- **Vivado 2019.2**
- **Verilog HDL**
- **Artix-7 FPGA Board**
- **Xilinx Constraints Format (.xdc)**

---

## ✍️ Author

**Jugesh Sai N**  
📧 [jugesh.njs@gmail.com](mailto:jugesh.njs@gmail.com)  
🔗 [LinkedIn: www.linkedin.com/in/jugeshsai](https://www.linkedin.com/in/jugeshsai)

---

## 📜 License

This repository is shared for educational and personal learning purposes only. No license has been applied.
