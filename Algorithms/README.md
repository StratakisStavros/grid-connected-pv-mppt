# MPPT algorithm implementations

[Project overview](../README.md) · [Algorithm interfaces and integration notes](../docs/implementation.md#algorithm-interfaces)

These MATLAB functions implement current-reference tracking for the PV boost-control loop.

| Source | Objective |
| :--- | :--- |
| [mppt_po_basic.m](mppt_po_basic.m) | P&O using PV terminal power |
| [mppt_po_losses.m](mppt_po_losses.m) | P&O using a current-dependent loss approximation |
| [mppt_pso_basic.m](mppt_pso_basic.m) | PSO using the supplied power-fitness signal |
| [mppt_pso_losses.m](mppt_pso_losses.m) | The same PSO search logic with loss-corrected fitness supplied upstream |

The output is a PV current reference. The surrounding current loop generates the duty command. The Simulink models contain embedded MATLAB Function blocks; changing these standalone files does not automatically replace embedded model code.

[Control design and tuning](../docs/control-design.md) · [Experimental comparison](../docs/results.md#3-controller-hardware-in-the-loop)
