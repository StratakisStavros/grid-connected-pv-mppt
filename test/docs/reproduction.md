# Reproduction guide

[← Project overview](../README.md)

## Read and inspect without the laboratory setup

1. Read [the thesis](../../Diploma%20Thesis%20-%20English.pdf), especially Chapter 6 (models and characterization), Chapter 7 (results), and Chapter 5 (HIL platform).
2. Use the [results index](results.md#full-result-index) to compare original figures by scenario.
3. Inspect the [algorithm interfaces and exact model filenames](implementation.md). Distinguish standalone examples from code embedded inside SLX models.

## Prepare an offline simulation

The uploaded models were saved in **R2023a and R2024b**. R2024b is a reasonable starting point for opening the complete collection; successful execution and forward compatibility still depend on the installed products and model dependencies. The repository's older R2022a recommendation is not a verified minimum for these files.

The models use MATLAB/Simulink and electrical-system blocks from the Simscape Electrical / Specialized Power Systems workflow. For the embedded target, check the required code-generation products and TI C2000 support for the chosen MATLAB release.

1. Download or clone the repository while preserving its folder structure.
2. Open the selected model and inspect its initialization callbacks, workspace variables, solver settings and dependencies.
3. Confirm the irradiance/shading scenario, selected MPPT block and whether the fitness signal includes the intended losses.
4. Check initial conditions, controller gains, timing and output measurement location against the thesis before running.
5. Record the software release, settings, random seed where applicable and output traces for any new comparison.

The repository provides project assets and result images; it does not provide an automated, verified end-to-end reproduction command. No MATLAB simulation was rerun for this presentation update.

## Recreate the controller HIL experiment

Use the [Typhoon schematic](../../HIL-Validation/Schematic%20Model.tse), [SCADA panel](../../HIL-Validation/Scada.cus) and [embedded model](../../Models/pv_control.slx) together with Chapter 5 of the thesis.

The documented setup uses Typhoon HIL402 and a TI Delfino F28379D LaunchPad. Before deployment, reconcile the actual analog scaling, pin assignments, PWM configuration, sample times and controller initialization across the files and the hardware. The selected Typhoon software must support the uploaded assets and HIL device; no specific compatible release has been verified in this presentation review.

The uploaded current traces document the original experiments. This preview adds no new HIL runs or hardware validation.

## Source map

For figure-by-figure explanations of tuning, channel assignments and controller implementation, see the [engineering walkthrough](engineering.md).

| Topic | English thesis location |
| :--- | :--- |
| HIL platform and microcontroller | Chapter 5; controller discussion pp. 98–101 |
| Simulation models and PV characteristics | Chapter 6, pp. 102–115 |
| Static peak ordering with losses | p. 115 |
| Uniform-irradiance simulations | Section 7.1, pp. 116–123 |
| Partial-shading simulations | Section 7.2, pp. 124–135 |
| HIL current responses | Section 7.3, pp. 136–140 |
| Final conclusions and reported improvement | pp. 140–141 |

All page references identify PDF pages of the uploaded English edition. Consult the [Greek edition](../../Diploma%20Thesis%20-%20Greek.pdf) alongside the English translation when reviewing the original wording.
