
# 2:1 MUX Design and Verification using SystemVerilog

## About the Project

This project is based on the design and verification of a 2:1 Multiplexer (MUX) using SystemVerilog.

A 2:1 MUX is a combinational circuit with two inputs, one select line and one output. Depending on the select line, one of the two inputs is passed to the output.

The main aim of this project is to understand how a multiplexer works and how its functionality can be verified using a SystemVerilog testbench.

## Working of 2:1 MUX

The MUX has four signals:

- A and B – Data inputs
- S – Select line
- Y – Output

The output depends on the value of the select line:

- When S = 0, output Y follows input A.
- When S = 1, output Y follows input B.

### Truth Table

| A | B | Sel | Y |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 |

## Verification Architecture

For verification, I have used a modular testbench architecture. Each component has a separate responsibility.

The testbench contains the following components:

- **Transaction:** Contains the signals required to represent a test transaction.
- **Generator:** Generates different input combinations for testing.
- **Driver:** Sends the generated inputs to the DUT.
- **Monitor:** Observes the inputs and output of the DUT.
- **Scoreboard:** Checks whether the actual output matches the expected output.
- **Environment:** Brings the different verification components together.
- **Coverage:** Keeps track of the input combinations covered during simulation.

## Project Files

```text
2-1-MUX-SVV/
│
├── env/
│   ├── transaction.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── environment.sv
│   ├── scoreboard.sv
│   └── coverage.sv
│
├── interface.sv
├── Mux.sv
├── Program.sv
└── top.sv
```

## Tools and Language

- Language: SystemVerilog
- Design: 2:1 Multiplexer
- Verification: SystemVerilog Testbench

## Conclusion
This project helped me understand the basic working of a 2:1 MUX and how a separate verification environment can be developed to check its functionality using SystemVerilog.
