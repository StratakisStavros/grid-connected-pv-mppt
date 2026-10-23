# Implementation guide

[← Project overview](../README.md) · [Illustrated engineering walkthrough](engineering.md)

For the design rationale and original screenshots, see [control design and tuning](control-design.md) and [C2000/HIL integration](embedded-hil.md). This page indexes the implementation files and algorithm interfaces.

## Models and hardware assets

The links below use the actual filenames in the repository. The release column comes from each SLX file's embedded metadata, rather than a general minimum-version assumption.

| File | Role | Saved release |
| :--- | :--- | :--- |
| [boost_fixed_irradiance.slx](../Models/boost_fixed_irradiance.slx) | Boost-stage study under fixed irradiance | R2024b |
| [pv_Bypass_characteristic.slx](../Models/pv_Bypass_characteristic.slx) | PV and bypass-diode characteristic study | R2024b |
| [pv_grid_control_fullmodel.slx](../Models/pv_grid_control_fullmodel.slx) | Full grid-connected simulation and MPPT/control comparison | R2023a |
| [pv_partial_shading_control.slx](../Models/pv_partial_shading_control.slx) | Partial-shading control study | R2023a |
| [pv_control.slx](../Models/pv_control.slx) | Embedded controller model; configured for TI Delfino F28379D LaunchPad and `ert.tlc` | R2023a |
| [Schematic Model.tse](../HIL-Validation/Schematic%20Model.tse) | Typhoon HIL power-stage and control schematic | Typhoon HIL asset |
| [Scada.cus](../HIL-Validation/Scada.cus) | HIL monitoring and interaction panel | Typhoon HIL asset |

## Algorithm interfaces

The standalone MATLAB functions return a **PV current reference**. The surrounding control loop converts that reference into the boost switching command.

| Source | Interface | Objective |
| :--- | :--- | :--- |
| [mppt_po_basic.m](../Algorithms/mppt_po_basic.m) | `mppt_po_basic(Vpv, Ipv)` | Computes PV terminal power internally |
| [mppt_po_losses.m](../Algorithms/mppt_po_losses.m) | `mppt_po_losses(Vpv, Ipv)` | Subtracts a current-squared loss approximation |
| [mppt_pso_basic.m](../Algorithms/mppt_pso_basic.m) | `mppt_pso_basic(Vpv, Ipv, Ppv, n, Isc, Control)` | Evaluates the supplied `Ppv` fitness signal |
| [mppt_pso_losses.m](../Algorithms/mppt_pso_losses.m) | `mppt_pso_losses(Vpv, Ipv, Ppv, n, Isc, Control)` | Also evaluates supplied fitness; loss correction belongs upstream |

**P&O:** the uploaded standalone functions perturb the reference by 0.02 A according to changes in power and current. Persistent state retains the preceding operating point.

**PSO:** the implementation maintains particle currents, velocities, personal-best fitness and a global-best current. Particle initialization is randomized; the velocity update uses fixed coefficients. `Control == 1` resets the standalone implementation. The two standalone PSO variants share the same search logic: changing the input fitness is what makes the objective loss-aware.

## Integration details that matter

The SLX files contain their own MATLAB Function blocks. The standalone `.m` files are useful source examples, but editing them does not automatically update the embedded blocks. For example, the full grid model contains a P&O step of 0.01 A, versus 0.02 A in the standalone source.

The standalone loss-aware P&O uses `d = 0.02` both as its perturbation step and in the written loss expression. With its equal transistor and diode resistance values, that expression reduces to `1.001 * Ipv^2`. Treat this as the uploaded approximation; do not infer a complete duty-dependent switching-loss model from the filename.

Before reusing the functions, check reference limits, reset behavior, sample timing, fitness-evaluation timing and consistency with the selected model. The standalone PSO functions do not clamp particle currents internally. These integration details are separate from the reported thesis results.

## Control boundary in HIL

The original HIL documentation describes external boost PWM from the LaunchPad, analog feedback from the real-time plant, and internal inverter control in the Typhoon schematic. The thesis discusses the hardware and connections in Chapter 5 and the measured current responses in Section 7.3.

[Continue to the reproduction guide](reproduction.md).
