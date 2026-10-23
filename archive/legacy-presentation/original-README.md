# Grid-Connected PV System under Partial Shading – Modeling, Control & HIL Validation

This project bridges academic modeling with hands-on engineering practice. It explores how MPPT algorithms behave in grid-connected photovoltaic (PV) systems under non-uniform irradiance conditions, integrating both simulation and real-time validation workflows.

## ⚙️ System Architecture
- Grid-tied PV Array → Boost Converter → Inverter → Grid
- Controlled via MATLAB/Simulink
- Real-time validation using Typhoon HIL and TI C2000 microcontroller

## 🧠 Implemented Algorithms
- Perturb & Observe (P&O)
- Particle Swarm Optimization (PSO)

Developed from scratch using MATLAB Function Blocks, tested under uniform and partial shading.

## 🧪 Experimental Setup
- Typhoon HIL for Hardware-in-the-Loop simulation
- Texas Instruments C2000 microcontroller for embedded control
- SCADA interface for real-time monitoring
- Code Composer Studio for firmware development

## 📁 Repository Structure
```
/models               → Simulink models (.slx)
/algorithms           → MPPT code (P&O, PSO)
/hil-validation       → Typhoon HIL configs
/reports              → Plots, figures, experimental results
```

## 📊 Outcome
- Verified the behavior of MPPT algorithms under partial shading
- Demonstrated that PSO consistently finds the global MPP, outperforming P&O
- Validated converter losses and control behavior using HIL tools

## 🧩 Learnings
This project allowed me to bridge control algorithm design with practical embedded execution, reinforcing my interest in hardware/software co-design for energy applications.

## 🪪 License
MIT License
[README.md](https://github.com/user-attachments/files/20123502/README.md)
