# About this preview

[Open the proposed project overview](README.md) · [Compare the original overview](../README.md)

This is an additive presentation draft. It reorganizes access to existing work without relocating or changing the thesis, source code, models or result figures.

## What changes in the presentation

- Leads with the engineering question and the distinction between PV power and loss-aware power optimization.
- Uses a concise system diagram, a featured original comparison and a practical reading path.
- Separates simulation findings from controller HIL observations.
- Links every model using its actual filename and records saved MATLAB releases from SLX metadata.
- Explains the current-reference algorithm interface and the difference between standalone functions and embedded model code.
- Attributes quantitative findings to the thesis and limits conclusions to the reported scenarios.

## Portfolio reading path

The overview introduces the engineering problem in plain language, then connects modeling, control, implementation and real-time evaluation to concrete repository evidence. Selected parameters and the irradiance test profile are drawn from the thesis, with page references. Detailed implementation caveats remain in the supporting pages so a first-time reader can understand the project before inspecting its internals.

## Engineering expansion

The preview now includes three illustrated technical chapters covering the electrical plant, control derivation and tuning, and C2000/HIL integration. Twenty-one original embedded images were extracted from the English thesis without visual modification; their source pages, figure numbers and checksums are recorded in `assets/thesis/sources.json`.

The tuning narrative and interface description were checked against the Greek text as well as the English edition. ADC assignments and selected calibration/rate-transition details were cross-checked against the existing controller model. The chapters distinguish thesis screenshots from saved-model settings and identify where a complete physical wiring schedule or tuning history is not supplied.

## Scope

Every file introduced by this draft is inside `test/`. Existing result plots and implementation files are linked from their original locations. Extracted thesis screenshots are additional copies under `test/assets/thesis/`; both original PDFs are unchanged. The root README, existing folders, repository settings and original assets are unchanged.

No simulations, code generation or HIL experiments were rerun. The preview was checked against the thesis text, the existing figures, standalone algorithm sources and embedded model metadata/code.

If this presentation is adopted later, its relative links must be adjusted for their final location. This draft makes no such move and removes no original content.
