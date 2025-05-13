# 📂 MPPT Algorithms

This folder contains MATLAB implementations of Maximum Power Point Tracking (MPPT) algorithms used to optimize energy extraction from photovoltaic (PV) systems. Each file corresponds to a different method or variation in the approach to MPPT, including both classic heuristics and swarm intelligence.

---

## 📄 List of Algorithms

| File                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| `mppt_po_basic.m`     | Classic Perturb & Observe (P&O) MPPT algorithm                              |
| `mppt_po_losses.m`    | P&O algorithm with converter power loss compensation                        |
| `mppt_pso_basic.m`    | Particle Swarm Optimization (PSO) MPPT algorithm                            |
| `mppt_pso_losses.m`   | PSO algorithm with loss-compensated power input (computed externally)       |

---

## 🔍 Algorithm Notes

- **Perturb & Observe (P&O)**: A simple, widely-used hill-climbing method based on observing changes in output power after small perturbations in current or voltage.
  
- **Loss-Compensated P&O**: Enhances the standard method by accounting for resistive and diode losses in the converter to estimate true power.

- **Particle Swarm Optimization (PSO)**: A metaheuristic algorithm that simulates social behavior of particles to converge on the Maximum Power Point. It is suitable for nonlinear or partially shaded conditions.

- **PSO with Loss Compensation**: The core PSO remains unchanged, but the input power signal (`Ppv`) is preprocessed in Simulink to reflect real converter losses, guiding the swarm more effectively.

---

## 🛠️ Dependencies

- MATLAB (tested with R2022a or later)
- Simulink (for real-time integration with model blocks)
- PV parameters and converter model (for simulation context)

Each script is designed to integrate with control blocks in a Simulink simulation and uses standard MATLAB syntax for rapid prototyping and educational testing.

---

## 🧠 Author

Created by **Stavros Stratakis** as part of research on MPPT techniques for PV systems with power electronic converters.
