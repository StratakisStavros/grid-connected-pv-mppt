# P&O NO LOSSES – Dynamic Irradiance Simulation

This folder contains simulation results for the Perturb and Observe (P&O) MPPT algorithm applied to a grid-connected PV system under time-varying irradiance, with no power loss compensation included.

## 📊 Simulation Scenario

The irradiance profile changes as follows:
- 0–1 s: constant at 800 W/m²
- 1–2 s: ramp up to 1000 W/m²
- 2–3 s: constant at 1000 W/m²
- 3–4 s: ramp down to 900 W/m²
- 4–5 s: constant at 900 W/m²

This pattern emulates realistic sunlight fluctuations and evaluates system tracking behavior.

## 📈 Key Observations

- **Photovoltaic Current**: Follows irradiance changes closely (30 A → 38 A → 34 A).
- **Photovoltaic Voltage**: Remains almost constant across the full duration, indicating effective MPPT voltage regulation.
- **Real Power Output**: Increases and decreases proportionally to irradiance, validating the correctness of current and power extraction.
- **DC-Link Voltage**: Stabilizes quickly to ~1200 V, showing fast and stable voltage control.
- **Reactive Power**: Remains close to zero throughout, indicating unity power factor at the grid side.

## 🗂️ Files

- `P&O No Losses I-t.png` — PV Current
- `P&O No Losses V-t.png` — PV Voltage
- `P&O No Losses REAL POWER.png` — Output Power
- `P&O No Losses DC LINK V-t.png` — DC-Link Voltage
- `P&O No Losses REACTIVE POWER.png` — Grid-side Reactive Power

## 🧠 Insight

These results confirm the proper functionality of the P&O algorithm under ideal conditions (no losses) and dynamic irradiance. They serve as a baseline for comparing enhanced or loss-compensated algorithms.
