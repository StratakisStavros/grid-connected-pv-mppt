# Experimental Results

This folder contains the experimental validation of the proposed MPPT control strategies applied on a grid-connected photovoltaic (PV) system using a Hardware-in-the-Loop (HIL) setup. The experiments were conducted to verify the behavior observed during simulation and to assess the real-world performance of different MPPT algorithms—specifically Perturb and Observe (P&O) and Particle Swarm Optimization (PSO)—under various irradiance and shading scenarios.

## Structure

The folder includes current-vs-time plots (`I-t`) collected during experimental trials under four main conditions:

- **No shading with P&O**
- **No shading with PSO**
- **Partial shading with P&O**
- **Partial shading with PSO (with and without power losses)**

Each test was performed using the TI Delfino F28379D LaunchPad controller connected to the HIL402 system by Typhoon HIL. The experiments captured the PV current behavior as a direct indicator of MPPT convergence and system response.

---

## Summary of Observations

### 🌞 No Shading Scenarios

- **P&O** successfully tracked irradiance changes from 800 → 1000 → 900 W/m² with a smooth, oscillation-free response.
- **PSO** followed the irradiance variation but exhibited transient oscillations during the 1000 → 900 W/m² step, indicating a less robust dynamic response.

### 🌥️ Partial Shading Scenarios

- **P&O** failed to locate the global maximum power point (GMPP), converging prematurely at the first encountered local maximum.
- **PSO (No Losses)** managed to explore both local maxima but settled on the wrong one (higher current, lower voltage), since power losses were ignored.
- **PSO (With Losses)** correctly identified and settled at the true GMPP, confirming the importance of accounting for converter and wiring losses.

---

## Key Insights

- **Algorithm selection is crucial**: Simple MPPT algorithms such as P&O are inadequate under partial shading. Intelligent methods like PSO show superior adaptability.
- **Loss modeling matters**: Ignoring converter and system losses can shift the location of the GMPP. Including loss models in the MPPT logic allows the controller to drive the system toward the actual maximum power point.
- **System performance improved up to 5%** by using loss-aware MPPT and smart control strategies.

---

## Conclusion

The experiments demonstrate that **optimized MPPT strategies, tailored to real-world conditions (shading, losses), are essential for maximizing PV efficiency**. The synergy between advanced control (PSO), accurate power modeling, and reliable HIL validation provides a clear roadmap for deploying robust renewable energy systems with high performance and adaptability.
