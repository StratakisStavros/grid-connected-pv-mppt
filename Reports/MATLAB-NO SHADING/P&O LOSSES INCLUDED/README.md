# P&O WITH LOSSES – Comparison of True Power vs. Conventional Power in MPPT

This folder includes simulation results for the Perturb and Observe (P&O) MPPT algorithm under dynamic irradiance conditions, using both the conventional power formula and a loss-aware formula that incorporates converter and cable losses.

## ⚙️ Simulation Setup

The irradiance profile changes over time as follows:
- 0–1 s: 800 W/m²
- 1–2 s: increasing to 1000 W/m²
- 2–3 s: constant at 1000 W/m²
- 3–4 s: decreasing to 900 W/m²
- 4–5 s: constant at 900 W/m²

This setup reflects realistic environmental transitions such as passing clouds or varying solar conditions.

## 📈 Observations

- **Photovoltaic Voltage & DC-Link Voltage**:
  - Stable behavior in both loss and no-loss cases.
  - DC-link voltage quickly settles to ~1200 V, showing robust control.

- **Photovoltaic Current & Output Power**:
  - Both follow the irradiance profile.
  - A minor reduction in current is observed in the loss-aware case, resulting in slightly lower conduction losses and improved system efficiency.

- **Reactive Power (Q)**:
  - In both cases, the mean value remains near zero.
  - Slight noise reduction is visible when losses are considered.

## 📊 Conclusion

Although the difference in output power is marginal, the inclusion of losses in the MPPT logic leads to slightly improved performance due to lower internal current and consequently reduced conduction losses. For simple MPPT algorithms like P&O, the impact of loss compensation is small but still measurable—this confirms theoretical expectations from loss-based power equations.

## 🗂️ Files

- `P&O Losses I-t.png` — PV Current (comparison)
- `P&O Losses V-t.png` — PV Voltage (comparison)
- `P&O Losses REAL POWER.png` — Output Power (comparison)
- `P&O Losses DC LINK V-t.png` — DC-Link Voltage (loss case)
- `P&O Losses REACTIVE POWER.png` — Reactive Power (comparison)
