### I-V and P-V Curves under Partial Shading with Loss Compensation

These plots compare the I-V and P-V curves of a partially shaded PV system, with and without accounting for power losses due to converter and cabling resistances.

In the P-V curve, we observe the presence of multiple local maxima—a typical outcome under partial shading. When power losses are considered, the global Maximum Power Point (MPP) shifts significantly. Initially, the true MPP is at 327 V and 14.6 kW, but after including losses, it moves to 535 V and 13.5 kW. This change highlights the importance of loss-aware MPPT algorithms, which can yield up to 5% more output power by targeting the actual optimal operating point.

In contrast, the I-V curves remain visually unchanged, since losses primarily affect power rather than current-voltage behavior.

- **Files**:
  - `I-V Characteristics Partial Shading.png`
  - `P-V Characteristics Partial Shading.png`
