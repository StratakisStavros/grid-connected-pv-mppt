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

The experiments combine **Typhoon HIL402** with a **TI Delfino F28379D LaunchPad**. The physical controller receives feedback from the simulated plant and returns the boost switching command. The five uploaded experimental plots record **PV current versus time**, allowing the tracking trajectory and final operating region to be compared.

[Controller connections, ADC acquisition and PWM implementation](embedded-hil.md) · [Original experimental files](../../Reports/Experimental%20Results)

### Experimental comparison matrix

| Test | Algorithm | Shading condition | Loss treatment in the MPPT objective | Main observation | Thesis |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [E1](#e1-po-under-uniform-irradiance) | P&O | Uniform, changing irradiance | No separate with/without-loss comparison reported for this HIL case | Smooth tracking of the irradiance changes | §7.3.1, p. 136 |
| [E2](#e2-pso-under-uniform-irradiance) | PSO | Uniform, changing irradiance | No separate with/without-loss comparison reported for this HIL case | Similar current levels, with an oscillatory transient during the decrease | §7.3.2, p. 137 |
| [E3](#e3-po-under-partial-shading) | P&O | Partial shading | No separate loss-aware P&O HIL trace supplied | Settles at the first encountered peak | §7.3.3, p. 138 |
| [E4](#e4-pso-under-partial-shading-pv-power-objective) | PSO | Partial shading | Losses excluded from the objective | Moves through a lower-current region to the higher-current peak | §7.3.4, p. 139 |
| [E5](#e5-pso-under-partial-shading-loss-aware-objective) | PSO | Partial shading | Losses included in the objective | Selects the lower-current region favored by the loss-aware objective | §7.3.5, p. 140 |

The explicit experimental **loss-treatment comparison is E4 versus E5**. The collection does not contain every possible algorithm × shading × loss combination. “No losses” refers to the optimization objective, not a claim that the HIL plant has no losses.

### E1. P&O under uniform irradiance

![E1: experimental P&O PV-current response under uniform irradiance](../../Reports/Experimental%20Results/P%26O%20NO%20SHADING%20I-t.png)

**Test condition.** The thesis describes the irradiance sequence **800 → 1000 → 900 W/m²**, with no partial shading.

**Observed response.** After startup, current reaches a first plateau, rises as irradiance increases, and falls to an intermediate level when irradiance decreases. The trace shows a smooth envelope at these transitions, consistent with the discussion on p. 136.

**Engineering interpretation.** In this reported uniform-irradiance test, local tracking is sufficient to follow the changing operating point. This is a useful baseline for judging whether a more complex search strategy improves the response.

[Original figure](../../Reports/Experimental%20Results/P%26O%20NO%20SHADING%20I-t.png) · [Thesis discussion, p. 136](../../Diploma%20Thesis%20-%20English.pdf#page=136)

### E2. PSO under uniform irradiance

![E2: experimental PSO PV-current response under uniform irradiance](../../Reports/Experimental%20Results/PSO%20NO%20SHADING%20I-t.png)

**Test condition.** The same irradiance sequence is evaluated using PSO.

**Observed response.** The current follows the same broad progression as E1. The prominent difference is the oscillatory transient around the transition from the highest irradiance level to the final level. Small current ripple is also visible.

**Engineering interpretation.** PSO's ability to search multiple peaks does not automatically give it a better transient response under uniform irradiance. The thesis identifies the irradiance-decrease response as less favorable than P&O in this experiment (p. 137).

The five-second offline ramp schedule described earlier belongs to the simulation study. The experimental images show their own startup and transition timing; they are not treated as time-aligned repetitions of those simulation plots.

[Original figure](../../Reports/Experimental%20Results/PSO%20NO%20SHADING%20I-t.png) · [Thesis discussion, p. 137](../../Diploma%20Thesis%20-%20English.pdf#page=137)

### E3. P&O under partial shading

![E3: experimental P&O PV-current response under partial shading](../../Reports/Experimental%20Results/P%26O%20PARTIAL%20SHADING%20I-t.png)

**Test condition.** Partial shading introduces multiple candidate power peaks.

**Observed response.** The trace rises and settles near **27–28 A**, with small steady ripple. The thesis describes the controller as stopping at the first maximum encountered (p. 138).

**Engineering interpretation.** A stable current response establishes convergence to an operating region, but does not show that all competing power peaks were considered. This is the limitation illustrated by the P&O test.

The endpoint is close to that of loss-aware PSO in E5. That similarity does **not** establish equivalent search behavior or prove that P&O selected an inferior net-power point in this particular trace. The thesis's simulation discussion also notes a case where the first peak happens to be favorable (p. 127). The important distinction is how the point is selected, not a blanket claim that P&O must always finish at the wrong point.

[Original figure](../../Reports/Experimental%20Results/P%26O%20PARTIAL%20SHADING%20I-t.png) · [Thesis discussion, p. 138](../../Diploma%20Thesis%20-%20English.pdf#page=138)

### E4. PSO under partial shading: PV-power objective

![E4: experimental PSO response under partial shading with losses excluded from the objective](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20NO%20LOSSES%20I-t.png)

**Test condition.** PSO evaluates PV terminal power without the loss correction used in E5.

**Observed response.** The current first approaches a region near **27–28 A**, then moves to a higher plateau near **44 A** in the uploaded image. The thesis describes the final region using the rounded value **45 A** and interprets the trajectory as exploration of both peaks (p. 139).

**Engineering interpretation.** The search moves beyond the initial region, unlike the displayed P&O trajectory. However, its objective favors the higher-current PV-power peak. The characteristic and simulation studies show why that choice can be less favorable after current-dependent conversion losses are considered.

[Original figure](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20NO%20LOSSES%20I-t.png) · [Thesis discussion, p. 139](../../Diploma%20Thesis%20-%20English.pdf#page=139)

### E5. PSO under partial shading: loss-aware objective

![E5: experimental PSO response under partial shading with losses included in the objective](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20LOSSES%20I-t.png)

**Test condition.** The PSO objective incorporates the loss estimate, changing the ranking of candidate operating points.

**Observed response.** Current converges near **27–28 A**; the thesis reports approximately **28 A** (p. 140). The final region differs clearly from E4's higher-current plateau.

**Engineering interpretation.** This agrees with the lower-current operating region favored by the loss-corrected characteristic and dynamic comparison. The displayed current trace identifies the endpoint; the wider interpretation of that endpoint as the preferred loss-aware peak comes from the characteristic and power studies, not current alone.

[Original figure](../../Reports/Experimental%20Results/PSO%20PARTIAL%20SHADING%20LOSSES%20I-t.png) · [Thesis discussion, p. 140](../../Diploma%20Thesis%20-%20English.pdf#page=140)

### What changes with the algorithm, shading and losses?

| Comparison | Evidence from the reported experiments | Engineering takeaway |
| :--- | :--- | :--- |
| P&O versus PSO, uniform irradiance: E1 / E2 | Both follow irradiance changes; PSO has a visible oscillatory transient on the decrease | More extensive search is not automatically better for a single-peak tracking scenario |
| P&O versus PSO, partial shading: E3 / E4 | P&O remains at the first region; PSO moves through that region to another peak | Search behavior matters when multiple peaks are available |
| PSO objective without versus with loss correction: E4 / E5 | The selected current changes from the higher plateau to approximately 28 A | The objective determines which peak the search favors |
| P&O versus loss-aware PSO: E3 / E5 | Similar final current in these traces | Similar endpoints do not establish identical robustness across shading patterns or starting conditions |

**Evidence boundary.** These are controller-HIL current responses. They support a qualitative comparison of trajectories and selected operating regions. The uploaded images do not provide synchronized raw voltage/current/power data for calculating tracking efficiency, energy yield, settling time under a defined tolerance, or uncertainty. The thesis's **up-to-5%** statement is supported by its broader study; it is not a new grid-power measurement derived from these five current traces.

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
