# Traffic Signal Controller (Verilog)

## Objective
To design and implement a two-road traffic signal controller using FSM and verify it through simulation and FPGA implementation.

## Tools Used
- ModelSim SE 5.5a (Simulation)
- Xilinx ISE 7.1i (Synthesis, Place & Route)

## Project Structure
- rtl/ → Verilog design (traffic_controller.v)
- tb/ → Testbench (tb_traffic_controller.v)
- sim/ → Simulation logs and waveform
- ise/ → FPGA outputs and reports
- screenshots/ → Waveform images
- docs/ → Results summary

## Flow
1. Designed Traffic Controller using Verilog RTL
2. Simulated using ModelSim
3. Verified waveform (roadA, roadB, emergency_A)
4. Synthesized using Xilinx ISE
5. Completed Place and Route (PnR)
6. Generated programming file (.bit)

## Results
- Correct traffic sequence achieved (Green → Yellow → Red)
- Emergency override functionality verified
- No synthesis or implementation errors
- Stable operation observed
- Programming file generated successfully

## Additional Work
RTL to FPGA implementation flow completed and understood. ASIC GDS flow studied conceptually.