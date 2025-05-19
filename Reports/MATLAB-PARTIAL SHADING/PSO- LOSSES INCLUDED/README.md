# PSO WITH LOSSES – Partial Shading Scenario (Loss-Aware MPPT)

This folder includes simulation results for the Particle Swarm Optimization (PSO) MPPT algorithm under fixed partial shading, where power losses due to conduction and cabling resistances are accounted for in the optimization.

## ⚙️ Simulation Scenario

- Static partial shading across PV segments
- Loss-aware MPPT algorithm: losses included in power computation
- Boost converter + inverter system with MATLAB/SIMULINK
- Losses modeled: transistor (R_on), diode (R_on + V_d), cables (R_eq)

## 📈 Observations

- **PV Current**: Stabilizes around 28 A, significantly lower than the no-loss case (45 A)
- **PV Voltage**: Increases to ~410 V compared to ~275 V in no-loss scenario
- **Real Power Output**: Peaks at ~10.5 kW, higher than in the no-loss case despite lower current
- **DC-Link Voltage**: Rapidly reaches the target 1200 V and remains stable
- **Reactive Power**: Oscillates around zero, confirming good power quality

## 🔍 Comparative Insight

By comparing to the PSO without losses:
- The **loss-aware PSO** successfully avoids local maxima associated with high current and high losses.
- It steers the system toward the **true GMPP**, delivering more net power.
- The **inclusion of losses** enables smarter decision-making, improving total energy output under partial shading conditions.

This validates the hypothesis that advanced MPPT algorithms benefit significantly from incorporating power loss models in their optimization logic.

## 🗂️ Files

- `PSO LOSSES I-t.png` — PV current waveform
- `PSO LOSSES V-t.png` — PV voltage waveform
- `PSO LOSSES REAL POWER.png` — Output power including loss-aware convergence
- `PSO LOSSES DC Link V-t.png` — DC-Link voltage profile
- `PSO LOSSES REACTIVE POWER.png` — Reactive power oscillation

