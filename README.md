# Traffic Light Controller (VHDL)

This project implements a simple traffic light controller in VHDL for a two-way intersection (North-South and East-West). The design includes both the main traffic light module and a testbench for simulation.

## Project Structure

- `traffic-light.vhdl`: Main VHDL source file describing the traffic light controller logic.
- `traffic_light_tb.vhdl`: Testbench for simulating and verifying the traffic light controller.
- `traffic_light.vcd`: Simulation waveform output (should not be committed to git).
- `.gitignore`: Ensures large simulation files like `.vcd` are not tracked by git.

## Features
- Controls traffic lights for North-South and East-West directions.
- Each direction has Red, Yellow, and Green signals.
- Timing: Green for 30 seconds, Yellow for 5 seconds (timing can be adjusted in the VHDL code).
- Synchronous reset and clock input.

## How to Simulate
1. **Compile the VHDL files** using your preferred VHDL simulator (e.g., GHDL):
   ```sh
   ghdl -a traffic-light.vhdl traffic_light_tb.vhdl
   ghdl -e traffic_light_tb
   ```
2. **Run the simulation** and generate a VCD waveform:
   ```sh
   ghdl -r traffic_light_tb --vcd=traffic_light.vcd
   ```
3. **View the waveform** using GTKWave or another VCD viewer:
   ```sh
   gtkwave traffic_light.vcd
   ```

## Notes
- Do **not** commit large `.vcd` files to git. They are ignored via `.gitignore`.
- You can adjust the green and yellow light durations by changing `GREEN_TIME` and `YELLOW_TIME` constants in `traffic-light.vhdl`.

## License
This project is for educational purposes.
