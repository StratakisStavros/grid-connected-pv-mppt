# 📂 Simulink Models

This folder contains Simulink-based dynamic models of grid-connected photovoltaic (PV) systems, developed to study the behavior of MPPT algorithms under different conditions such as partial shading, control dynamics, and real-time implementation.

Each model reflects a different scenario, configuration, or control architecture and is designed for integration with MPPT scripts from the `algorithms/` folder.

---

## 📄 List of Models

| File                                | Description                                                                 |
|-------------------------------------|-----------------------------------------------------------------------------|
| `boost_fixed_irradiance.slx`        | Boost converter model with fixed irradiance for baseline MPPT performance  |
| `pv_grid_tied_control_system.slx`   | Full grid-connected PV system with dynamic irradiance, PI controllers, d-q frame, PLL, and SPWM |
| `pv_Bypass_characteristic.slx`      | Model that explores PV behavior with bypass diodes under shading conditions |
| `pv_with_c2000_control.slx`         | Simulink model configured for TI C2000 embedded code generation             |
| `pv_partial_shading_control.slx`    | PV system with dynamically applied partial shading and MPPT switching logic |

---

## 🧪 Key Model Components

- **PV Module Simulation**: Models the electrical output of solar panels as a function of irradiance and temperature.
- **DC-DC Boost Converter**: Simulates power conversion between the PV array and DC link or grid interface.
- **MPPT Interface**: Most models allow connection with `.m`-based MPPT algorithms using MATLAB Function blocks or external scripts.
- **Control Framework**: Includes PLL synchronization, PI current control in the d-q frame, and pulse-width modulation (SPWM) blocks.
- **Bypass Diodes**: Included in some models to investigate partial shading and local/global MPP phenomena.

---

## ⚙️ Requirements

- MATLAB Simulink (R2022a or newer recommended)
- Simscape (for accurate power electronics modeling)
- TI C2000 Embedded Coder (for models targeting embedded hardware)

---

## 🧠 Author

Created by **Stavros Stratakis** as part of an integrated master's thesis focused on modeling and control of grid-tied PV systems with MPPT under realistic conditions.
