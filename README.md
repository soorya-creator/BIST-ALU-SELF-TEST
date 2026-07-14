# Built-In Self-Test (BIST) for a 4-bit ALU Using Verilog HDL

![Language](https://img.shields.io/badge/Language-Verilog-blue)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## Overview

This project implements a **Built-In Self-Test (BIST)** architecture for a **4-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**. The BIST system automatically generates test patterns, applies them to the ALU, compresses the output responses into a signature, and compares the generated signature against a known reference signature to determine whether the ALU is functioning correctly.

The design demonstrates the complete BIST flow, including **pseudo-random test generation, response compaction, fault detection, and signature aliasing**.

---

## Project Highlights

- Designed a 4-bit ALU supporting multiple arithmetic and logical operations.
- Implemented an **8-bit LFSR** for pseudo-random test pattern generation.
- Designed a **5-bit MISR** for response compaction.
- Developed an **FSM-based BIST Controller** to automate the testing sequence.
- Implemented automatic **PASS/FAIL** detection using signature comparison.
- Demonstrated **fault detection** by intentionally modifying the ALU logic.
- Demonstrated the concept of **signature aliasing** in MISR-based BIST.
- Verified the complete design using **Xilinx Vivado Simulator**.

---

# BIST Architecture

<p align="center">
<img src="screenshots/architecture.png" width="700">
</p>

---

# Data Flow

<p align="center">
<img src="screenshots/dataflow.png" width="350">
</p>

---

# Project Structure

```
BIST-ALU-SELF-TEST
│
├── rtl
│   ├── alu.v
│   ├── comparator.v
│   ├── fsm.v
│   ├── lfsr.v
│   ├── misr.v
│   └── top.v
│
├── testbench
│   ├── alu_tb.v
│   ├── fsm_tb.v
│   ├── lfsr_tb.v
│   ├── misr_tb.v
│   └── top_tb.v
│
├── screenshots
│   ├── architecture.png
│   ├── dataflow.png
│   ├── correct_output.png
│   ├── induced_fault.png
│   └── aliased_fault.png
│
├── report
│   └── BIST_Report.pdf
│
├── README.md
└── .gitignore
```

---

# Design Modules

### ALU
Implements arithmetic and logical operations on two 4-bit operands.

### LFSR
Generates pseudo-random input test vectors for the ALU.

### FSM Controller
Controls the BIST sequence by coordinating test generation, signature collection, and result evaluation.

### MISR
Compresses ALU outputs into a 5-bit signature using response compaction.

### Comparator
Compares the generated MISR signature with the expected reference signature and generates the PASS/FAIL signal.

---

# Simulation Results

## Correct ALU Operation

The generated MISR signature matches the expected reference signature, indicating successful verification.

**PASS = 1**

<p align="center">
<img src="screenshots/correct_output.png" width="900">
</p>

---

## Fault Detection

A fault was intentionally introduced into the ALU implementation. The resulting MISR signature differs from the expected signature, and the comparator correctly reports:

**PASS = 0**

<p align="center">
<img src="screenshots/induced_fault.png" width="900">
</p>

---

## Signature Aliasing

This project also demonstrates **signature aliasing**, where a faulty ALU implementation produces the same compressed MISR signature as the fault-free implementation. Although the ALU contains an error, the comparator reports:

**PASS = 1**

This illustrates one of the known limitations of MISR-based Built-In Self-Test architectures.

<p align="center">
<img src="screenshots/aliased_fault.png" width="900">
</p>

---

# Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator

---

# Key Concepts

- Built-In Self-Test (BIST)
- Finite State Machine (FSM)
- Linear Feedback Shift Register (LFSR)
- Multiple Input Signature Register (MISR)
- Signature Analysis
- Fault Detection
- Signature Aliasing
- Digital Circuit Verification

---

# Future Improvements

- Support larger ALU architectures (8-bit / 16-bit).
- Reduce aliasing probability using larger MISRs.
- Generate reference signatures automatically.
- Implement the design on an FPGA development board.
- Extend the framework to support additional digital modules.

---

# Author

**Sooryanarayan S**

B.Tech in Electronics and Communication Engineering

National Institute of Technology Calicut