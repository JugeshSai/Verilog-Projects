# Verilog Projects Repository

This repository is a collection of my **Verilog HDL projects**, built as part of my continuous learning and digital design development.  
These projects explore everything from logic fundamentals to complete FPGA-based systems.

---

## ✅ Completed Projects

### 📟 1. 24-Hour Digital Clock Design
**Description**:  
A mini project implemented using Verilog that displays real-time in 24-hour format (HH:MM:SS) on a 4-digit 7-segment display using multiplexing logic.

**Features**:
- Displays hours and minutes (seconds maintained internally for time accuracy)
- Uses 1 Hz clock for time counting
- Digit multiplexing using a counter and refresh technique
- Asynchronous reset
- Target FPGA: **Artix-7 (Invent Logics Edge Board)**

**Modules Included**:
- Clock Divider (50 MHz ➝ 1 Hz & 500 Hz)
- BCD Time Counter (HH:MM with internal seconds)
- 7-Segment Display Encoder
- Multiplexed Display Driver Logic

---

### 🚦 2. Traffic Light Controller using FSM with 7-Segment Countdown Display
**Description**:  
A state-machine-based traffic light controller that manages Red, Yellow, and Green signals with integrated countdown displayed on a 7-segment display.

**Features**:
- Implements FSM with defined timing for each light
- Countdown timer displayed on 7-segment
- Synchronous timing and reset logic
- Easily scalable to support pedestrian mode or extended phases

**Modules Included**:
- FSM Controller with timing logic
- Countdown timer using registers
- 7-Segment Display Encoder
- Target FPGA: **Artix-7**

---

### 🛣️ 3. Junction Traffic Light Controller for 4-Way Intersection
**Description**:  
An advanced traffic light controller that handles a full junction with four directions: **North, South, East, and West**. Each direction cycles through green, yellow, and red with fixed timing, and displays a countdown on a 2-digit 7-segment display.

**Features**:
- Finite State Machine (FSM) controlling eight traffic light states
- Configurable green and yellow timing: 5s green, 2s yellow
- Real-time countdown display for active signal direction
- Supports clean transitions between directional priorities
- Built-in 1 Hz and 500 Hz clock dividers
- Target FPGA: **Artix-7**

**Modules Included**:
- FSM-based Junction Controller
- 2-digit Multiplexed 7-Segment Countdown
- Clock Divider for signal timing (50 MHz ➝ 1 Hz & 500 Hz)
- Clean logic separation for signal direction and state encoding

---

## 🚧 Upcoming Projects

- 🔢 ALU Design with 8 Operations  
- ✖️ Bit Recoded Multiplier (Booth/Radix-4 Architecture)  
- 📺 HDMI / DVI-D Video Output on FPGA  

---

## ✍️ Author

**Jugesh Sai N**  
📧 [jugesh.njs@gmail.com](mailto:jugesh.njs@gmail.com)  
🔗 [LinkedIn: www.linkedin.com/in/jugeshsai](https://www.linkedin.com/in/jugeshsai)

---

## 📜 License

This repository is shared for educational and personal learning purposes only. No license has been applied.
