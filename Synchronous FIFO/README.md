# Synchronous FIFO Design (8-bit × 16-depth)

## Overview
The **Synchronous FIFO (First-In-First-Out)** memory buffer is a digital design used to temporarily store data between two systems operating on the **same clock domain**.  
It ensures data is written and read in the order it arrives, preventing overflow and underflow conditions using control logic.

This design is implemented and verified using **Verilog HDL** on **Vivado 2023.2**, targeting the **Artix-7 FPGA board**.

---

## Design Specifications
| Parameter | Description |
|------------|-------------|
| **Data Width** | 8-bit |
| **Depth** | 16 locations |
| **Clock Type** | Synchronous (Single Clock) |
| **Reset Type** | Active-Low (`!reset`) |
| **Write Enable** | High = Write data into FIFO |
| **Read Enable** | High = Read data from FIFO |
| **Flags** | `full`, `empty`, `almost_full`, `almost_empty` |

---

## Implementation Schematic

<img width="1499" height="653" alt="Screenshot 2025-11-08 123413" src="https://github.com/user-attachments/assets/ccfbd3cc-c6f0-4c96-9409-0a588ceb084e" />

---

## Functional Description
- The FIFO stores 8-bit data sequentially using a single clock signal.  
- Two pointers, **write pointer (w_ptr)** and **read pointer (r_ptr)**, manage data flow.  
- The **memory array** acts as a circular buffer:
  - When the **write pointer** reaches the end, it wraps to address `0`.
  - The same happens for the **read pointer**.
- The **`full` flag** prevents writing when all locations are filled.
- The **`empty` flag** prevents reading when the FIFO has no data.

---

## Key Design Blocks
### 1. Write Logic
- Data is written to the FIFO memory at the rising edge of the clock when:

### 3. Status Logic
- Calculates `full`, `empty`, and pointer differences.
- Ensures safe and synchronized operation on the same clock domain.

---

## Testbench (Concept Overview)
- Stimulates **write** and **read** operations using test tasks.  
- Includes:
- Reset phase
- Sequential write operations
- Sequential read operations
- Corner cases (overflow, underflow)
- The testbench monitors data integrity and flag transitions.

---

## Simulation and Verification

<img width="1477" height="821" alt="Screenshot 2025-11-08 134555" src="https://github.com/user-attachments/assets/2be8481f-740b-47f1-8d27-beac70d809e3" />


<img width="1475" height="830" alt="Screenshot 2025-11-08 134658" src="https://github.com/user-attachments/assets/d4f68b38-74ba-4d19-b6a8-d96b61e2546e" />


---

## Tools Used
- **Vivado 2023.2** (RTL Design & Simulation)  
- **Verilog HDL**  
- **Artix-7 FPGA** (for synthesis & implementation)

---

## ✍️ Author

**Jugesh Sai N**  
📧 [jugesh.njs@gmail.com](mailto:jugesh.njs@gmail.com)  
🔗 [LinkedIn: www.linkedin.com/in/jugeshsai](https://www.linkedin.com/in/jugeshsai)

---
