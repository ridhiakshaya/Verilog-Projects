# 4:1 Multiplexer in Verilog

## Overview

This project implements and simulates a **4:1 Multiplexer (MUX)** using Verilog.

A 4:1 multiplexer selects one of four input signals and forwards the selected input to a single output. Two select lines are used to determine which input appears at the output.

The project demonstrates basic combinational logic design, Verilog continuous assignment, testbench development, simulation, and waveform analysis.

The design was simulated using **Icarus Verilog**, with **GTKWave** used to analyze the resulting signal waveforms.

---

## Design

The 4:1 Multiplexer consists of:

- `a` - Input 0
- `b` - Input 1
- `c` - Input 2
- `d` - Input 3
- `s1`, `s0` - Select inputs
- `y` - Output

The select inputs determine which of the four inputs is connected to the output.

| s1 | s0 | Selected Input | Output |
|----|----|----------------|--------|
| 0 | 0 | a | y = a |
| 0 | 1 | b | y = b |
| 1 | 0 | c | y = c |
| 1 | 1 | d | y = d |

Therefore:

```text
s1s0 = 00 → a selected
s1s0 = 01 → b selected
s1s0 = 10 → c selected
s1s0 = 11 → d selected
```

---

## Verilog Implementation

The multiplexer is implemented using the Verilog conditional operator:

```verilog
assign y = s1 ? (s0 ? d : c) : (s0 ? b : a);
```

When `s1 = 0`, the output is selected between `a` and `b`.

When `s1 = 1`, the output is selected between `c` and `d`.

The value of `s0` then determines which of the two inputs is connected to `y`.

Since the output depends only on the current values of the inputs and select lines, the multiplexer is a **combinational logic circuit**.

---

## Simulation Environment

| Tool | Purpose |
|------|---------|
| Verilog | Hardware Description Language |
| Icarus Verilog | Compilation and simulation |
| GTKWave | Simulation waveform visualization |
| VS Code | Source code development environment |

---

## Testbench Verification

The testbench verifies the multiplexer using two different input patterns.

For each input pattern, all four possible combinations of `s1` and `s0` are tested.

Each test condition is applied for **10 ns**.

### Test Pattern 1

```text
a = 0
b = 1
c = 0
d = 1
```

| s1 | s0 | Selected Input | Output y |
|----|----|----------------|----------|
| 0 | 0 | a | 0 |
| 0 | 1 | b | 1 |
| 1 | 0 | c | 0 |
| 1 | 1 | d | 1 |

The expected output sequence is:

```text
0 → 1 → 0 → 1
```

### Test Pattern 2

```text
a = 1
b = 0
c = 1
d = 0
```

| s1 | s0 | Selected Input | Output y |
|----|----|----------------|----------|
| 0 | 0 | a | 1 |
| 0 | 1 | b | 0 |
| 1 | 0 | c | 1 |
| 1 | 1 | d | 0 |

The expected output sequence is:

```text
1 → 0 → 1 → 0
```

---

## GTKWave Simulation

The generated VCD file was loaded into GTKWave to observe the behavior of the multiplexer over the complete **80 ns simulation**.

The waveform includes:

- `a`, `b`, `c`, `d` - Data inputs
- `s1`, `s0` - Select inputs
- `y` - Multiplexer output

Each 10 ns interval represents one select condition.

| Simulation Time | Input Pattern `abcd` | s1s0 | Selected Input | y |
|-----------------|----------------------|------|----------------|---|
| 0–10 ns | 0101 | 00 | a | 0 |
| 10–20 ns | 0101 | 01 | b | 1 |
| 20–30 ns | 0101 | 10 | c | 0 |
| 30–40 ns | 0101 | 11 | d | 1 |
| 40–50 ns | 1010 | 00 | a | 1 |
| 50–60 ns | 1010 | 01 | b | 0 |
| 60–70 ns | 1010 | 10 | c | 1 |
| 70–80 ns | 1010 | 11 | d | 0 |

The GTKWave results confirm that the output `y` follows the input selected by `s1` and `s0` for all tested combinations.

---

## Result

The **4:1 Multiplexer was successfully implemented and simulated using Verilog**.

All four select combinations were tested using two different input patterns. The GTKWave waveform confirms that the correct input is routed to the output for each select condition.
