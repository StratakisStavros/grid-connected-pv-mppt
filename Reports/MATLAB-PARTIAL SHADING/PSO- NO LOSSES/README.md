# PSO NO LOSSES – Partial Shading Scenario (Conventional Power)

This folder includes simulation results for the Particle Swarm Optimization (PSO) MPPT algorithm applied to a grid-connected PV system under a fixed partial shading pattern. The simulation uses the conventional power equation and does not consider conduction, switching, or cable losses.

## ⚙️ Simulation Scenario

- Static partial shading across PV array segments
- No dynamic irradiance variation over time
- Losses are not included in the power computation

## 📈 Observations

- **PV Current**: System converges to a high current (~45 A), indicating that PSO targets a local maximum with high current but lower voltage.
- **PV Voltage**: The corresponding voltage is relatively low (~275 V), resulting in lower power output.
- **Real Power Output**: Stabilizes around 10 kW, which is suboptimal compared to the true MPP.
- **DC-Link Voltage**: Reaches 1200 V quickly and remains stable.
- **Reactive Power**: Mean value remains close to zero.

## ❗ Insight

This behavior highlights the importance of including loss models in the MPPT formulation. Without considering losses, PSO is misled to converge on a high-current, low-voltage local maximum, believing it is the optimal point. When losses are included, the algorithm would instead favor lower current values to reduce I²R losses and target the true global maximum.

## 🗂️ Files

- `PSO NO LOSSES I-t.png` — PV current convergence
- `PSO NO LOSSES V-t.png` — PV voltage waveform
- `PSO NO LOSSES REAL POWER.png` — Output power over time
- `PSO NO LOSSES DC Link V-t.png` — DC-Link voltage stability
- `PSO NO LOSSES REACTIVE POWER.png` — Reactive power behavior
