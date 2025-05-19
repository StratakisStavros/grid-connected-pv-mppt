# P&O NO LOSSES – Partial Shading (Fixed Pattern)

This folder contains simulation results for the Perturb and Observe (P&O) MPPT algorithm operating under a static partial shading pattern. The purpose is to evaluate how well the algorithm performs when the PV system exhibits multiple local maxima due to irregular irradiance distribution across modules.

## ⚙️ Simulation Scenario

- Partial shading pattern applied to the PV array
- Constant irradiance over time, but uneven across array segments
- No power loss model included

## 📈 Key Observations

- The system converges rapidly to a current of ~28 A, which the algorithm identifies as the MPP.
- PV current and voltage remain constant after convergence.
- Real power output stabilizes around 10.2 kW.
- DC-Link voltage reaches 1200 V and remains well-regulated.
- Reactive power remains near zero, confirming a power factor close to unity.

## ⚠️ Limitation of P&O under Partial Shading

Although the algorithm locks onto the global MPP in this case, it does so by coincidence. Since P&O always responds to the first derivative-based local maximum, it may not find the global maximum if it appears later in the search space. This highlights one of the known weaknesses of P&O under partial shading conditions.

## 🗂️ Files

- `P&O NO LOSSES I-t.png` — PV current response
- `P&O NO LOSSES V-t.png` — PV voltage
- `P&O NO LOSSES REAL POWER.png` — Real power over time
- `P&O NO LOSSES DC Link V-t.png` — DC-Link voltage regulation
- `P&O NO LOSSES REACTIVE POWER.png` — Reactive power waveform
