# Controller hardware-in-the-loop validation

[Project overview](../README.md) · [Detailed C2000 and HIL integration](../docs/embedded-hil.md)

The documented setup connects a TI Delfino F28379D LaunchPad to a Typhoon HIL402. The controller receives PV voltage, PV current and DC-link voltage feedback, and returns the boost switching command. Inverter control and modulation run inside the HIL schematic.

| Asset | Purpose |
| :--- | :--- |
| [Schematic Model.tse](Schematic%20Model.tse) | Electrical plant and internal inverter-control schematic |
| [Scada.cus](Scada.cus) | Monitoring and runtime interaction configuration |
| [Embedded controller model](../Models/pv_control.slx) | ADC acquisition, calibration, control and PWM implementation |

The MPPT stage provides a current reference; the current-control loop produces the duty command. The technical walkthrough documents ADC channels, trigger settings, rate transitions and the original thesis screenshots.

[Five experimental scenarios and current traces](../docs/results.md#3-controller-hardware-in-the-loop) · [Reproduction guide](../docs/reproduction.md)
