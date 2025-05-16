# 📂 HIL Validation

This folder contains files used to perform Hardware-in-the-Loop (HIL) validation of a grid-connected photovoltaic (PV) system using the Typhoon HIL platform. The validation environment includes both schematic simulation (.tse) and SCADA configuration (.cus) files.

---

## 📄 Files

| File                   | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `schematic_model.tse`  | Full Typhoon HIL schematic of the PV system including PV array, converters, inverter, and grid |
| `scada.cus`            | SCADA configuration for real-time signal monitoring and user control       |

---

## 🔧 System Architecture

- **PV Array** under partial shading, modeled in the schematic
- **Boost Converter**:
  - Controlled by a TI C2000 microcontroller (F28379D)
  - Receives PWM signals via digital input
  - Real-time feedback using analog outputs (PV voltage, PV current, DC-link voltage)
- **Inverter**:
  - Controlled internally using Typhoon HIL's built-in modulator
  - Includes PLL, voltage control, and current d-q controllers
- **DC-Link & Grid Interface**:
  - Includes core coupling for performance and scalability
  - RL filter for smoothing before grid injection

---

## 🧪 Control Strategy Overview

- Boost stage is pulse-modulated externally via Simulink code deployed on the microcontroller
- MPPT algorithm (e.g., P&O, PSO) runs inside a MATLAB Function Block and outputs the duty cycle
- Inverter stage uses Typhoon HIL’s schematic logic for control and modulation
- Feedback signals measured from the system are used in closed-loop real-time experiments

---

## 🖥️ SCADA Monitoring

- SCADA Input blocks allow adjustment of reference values (e.g., V_dc)
- SCADA Output probes show PV and grid parameters in real-time
- Enables visualization of transient response and controller stability under various irradiance or load conditions

---

## 💡 Educational Purpose

This setup was designed to:
- Explore both internal and external control methods
- Perform comparative analysis of converter response
- Evaluate MPPT algorithm behavior under realistic grid and shading scenarios

---

## 🧠 Author

Developed by **Stavros Stratakis** as part of an integrated master's thesis on real-time MPPT validation using Typhoon HIL and embedded control platforms.
