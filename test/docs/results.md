# Results & evidence

[← Project overview](../README.md)

The following findings come from the uploaded thesis and figures. This presentation does not introduce new simulations, hardware measurements or numerical benchmarks. Page references use the English PDF page numbers.

## Baseline: tracking changes in sunlight

Before comparing shaded operating points, the thesis evaluates the system under uniform irradiance with a changing sunlight level. The five-second simulation uses the following profile (p. 116):

| Time | Irradiance |
| :--- | :--- |
| 0–1 s | 800 W/m² |
| 1–2 s | Ramp from 800 to 1000 W/m² |
| 2–3 s | Hold at 1000 W/m² |
| 3–4 s | Ramp down to 900 W/m² |
| 4–5 s | Hold at 900 W/m² |

For the P&O case without loss correction, the thesis reports PV current near **30 A, 38 A and 34 A** at the corresponding irradiance levels (p. 119). It also reports regulation of the DC link to **1200 V** and reactive power around zero. This baseline checks how tracking and the surrounding control respond as available solar power changes.

[Original PV-current plot](../../Reports/MATLAB-NO%20SHADING/P%26O%20NO%20LOSSES/P%26O%20No%20Losses%20I-t.png) · [Original DC-link plot](../../Reports/MATLAB-NO%20SHADING/P%26O%20NO%20LOSSES/P%26O%20No%20Losses%20DC%20LINK%20V-t.png) · [Thesis, scenario definition](../../Diploma%20Thesis%20-%20English.pdf#page=116)

## 1. Partial shading changes the optimization problem

The thesis compares a PV-power characteristic with a loss-corrected characteristic. Two peaks are close in PV power, but their ordering changes after the current-dependent loss term is included.

| Static characteristic | Lower-voltage peak | Higher-voltage peak | Preferred region |
| :--- | :--- | :--- | :--- |
| PV terminal power | 14.6 kW at 327 V | 14.2 kW at 534 V | Lower voltage |
| Loss-corrected power | 12.6 kW at 330 V | 13.5 kW at 535 V | Higher voltage |

These are rounded values reported on **thesis p. 115**, for the static characterization study. They are not the grid-power values of the dynamic comparison below. The loss approximation contains a term proportional to current squared, which penalizes high-current operation.

![Original P–V characteristics under partial shading](../../Reports/Char/Partial%20Shadind/P-V%20Characteristics%20Partial%20Shading.png)

[Static characteristic files](../../Reports/Char/Partial%20Shadind) · [English thesis](../../Diploma%20Thesis%20-%20English.pdf#page=115)

## 2. Dynamic simulation: loss-aware PSO

![Original real-power comparison for the two PSO objectives](../../Reports/MATLAB-PARTIAL%20SHADING/PSO-%20LOSSES%20INCLUDED/PSO%20LOSSES%20REAL%20POWER.png)

The uploaded comparison shows higher real power for the loss-aware objective. The thesis describes operating currents of approximately **45 A** for the PV-power objective and **28 A** for the loss-aware objective (pp. 130–135). The latter favors a higher-voltage, lower-current region.

| MPPT objective | Approximate PV current | Approximate PV voltage |
| :--- | :--- | :--- |
| PV terminal power | 45 A | 275 V |
| Loss-aware power | 28 A | 410 V |

These values follow the comparison on **p. 135**. The preceding discussion on p. 132 rounds the loss-aware voltage to 420 V, so the values identify operating regions rather than exact setpoints. Multiplying PV voltage by PV current gives terminal power, not the grid-side real power shown in the comparison plot.

The engineering lesson is practical: **a broader search algorithm is only useful when its objective represents the quantity the system should optimize**. Here, accounting for current-dependent losses changes which operating region is preferred.

The thesis summarizes the benefit as **up to 5%** (pp. 140–141). Its narrative uses rounded power values, while the uploaded curves show ripple and somewhat different plotted levels; the headline is therefore attributed to the thesis, rather than presented as a newly calculated measurement from these images. Raw time-series exports are not part of the uploaded result collection.

The captions “without losses” and “with losses” are best read here as **excluding or including losses in the MPPT objective**. They should not be interpreted as proof that the entire simulated plant is physically lossless in the first case.

[PSO, PV-power objective](../../Reports/MATLAB-PARTIAL%20SHADING/PSO-%20NO%20LOSSES) · [PSO, loss-aware objective and comparison](../../Reports/MATLAB-PARTIAL%20SHADING/PSO-%20LOSSES%20INCLUDED)

## 3. Controller hardware-in-the-loop

The documented platform combines **Typhoon HIL402** and a **TI Delfino F28379D LaunchPad**. The thesis presents PV-current responses for the following scenarios (pp. 136–140):

| Scenario | Reported observation | Original trace |
| :--- | :--- | :--- |
| P&O, uniform irradiance | Follows the 800 → 1000 → 900 W/m² sequence smoothly | [Current response](../../Reports/Experimental%20Results/P%26O%20NO%20SHADING%20I-t.png) |
| PSO, uniform irradiance | Follows irradiance changes, with an oscillatory transient on the decrease | [Current response](../../Reports/Experimental%20Results/PSO%20NO%20SHADING%20I-t.png) |
| P&O, partial shading | Stops at the first encountered peak | [Current response](../../Reports/Experimental%20Results/P%26O%20PARTIAL%20SHADING%20I-t.png) |
| PSO, PV-power objective, partial shading | Explores peaks and converges near 45 A | [Current response](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20NO%20LOSSES%20I-t.png) |
| PSO, loss-aware objective, partial shading | Converges near 28 A | [Current response](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20LOSSES%20I-t.png) |

![HIL PV-current response for loss-aware PSO under partial shading](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20LOSSES%20I-t.png)

*Original HIL current trace. The current response supports the selected operating-region comparison; it is not itself a direct measurement of a 5% grid-power gain.*

## 4. Reading the conclusions correctly

- The P&O simulation discussion (p. 127) explicitly describes a favorable coincidence in reaching the best peak. The HIL discussion (p. 138) describes stopping at the first peak. Together they illustrate dependence on the operating trajectory, rather than a claim that P&O always fails under shading.
- The simulation results report a DC-link target of **1200 V** and reactive power averaging near zero. Those observations alone do not establish harmonic performance or grid-code compliance.
- Static characteristic sweeps, dynamic simulations and HIL current traces are different evidence types. Their numerical values should not be mixed into one benchmark.

## Full result index

| Study | Original files |
| :--- | :--- |
| Uniform-irradiance I–V / P–V characteristics | [Characteristic sweeps](../../Reports/Char/No%20Shading) |
| Partial-shading I–V / P–V characteristics | [Characteristic sweeps](../../Reports/Char/Partial%20Shadind) |
| Uniform irradiance, P&O with PV-power objective | [Simulation results](../../Reports/MATLAB-NO%20SHADING/P%26O%20NO%20LOSSES) |
| Uniform irradiance, P&O with loss-aware objective | [Simulation results](../../Reports/MATLAB-NO%20SHADING/P%26O%20LOSSES%20INCLUDED) |
| Partial shading, P&O | [Simulation results](../../Reports/MATLAB-PARTIAL%20SHADING/P%26O%20NO%20LOSSES) |
| Partial shading, PSO with PV-power objective | [Simulation results](../../Reports/MATLAB-PARTIAL%20SHADING/PSO-%20NO%20LOSSES) |
| Partial shading, PSO with loss-aware objective | [Simulation results](../../Reports/MATLAB-PARTIAL%20SHADING/PSO-%20LOSSES%20INCLUDED) |
| Controller HIL experiments | [Experimental results](../../Reports/Experimental%20Results) |
