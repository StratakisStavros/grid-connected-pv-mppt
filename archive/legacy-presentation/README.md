# Previous presentation archive

[Current project overview](../../README.md)

The reviewed presentation was adopted as the main repository documentation on **23 October 2026**. This archive keeps the previous version available for comparison or restoration.

- [Browse the complete original repository snapshot](https://github.com/StratakisStavros/grid-connected-pv-mppt/tree/archive/thesis-original-presentation): the original overview, folder documentation, models, reports and thesis files.
- [Read the original landing page exactly as saved](original-README.md): an unchanged copy of the former root README. Its historical relative links were not rewritten; use the complete snapshot above to browse the old structure.
- [Historical preview review notes](preview-review-notes.md): the notes written while the replacement was being reviewed. Their references describe the former test-folder layout.

## Restore or compare later

The original snapshot is preserved by the Git tag `archive/thesis-original-presentation`, pointing to commit `068aa0cb7c0652e9ee0a11de5cf634d8ec34aaa4`. The snapshot is independent of later edits on `main`.

The commit immediately before promotion, `665f54c`, also preserves the approved presentation in its former `test/` layout. Both versions remain available in Git history.

To restore only the original landing page in a local clone, use:

```sh
git restore --source=archive/thesis-original-presentation -- README.md
```

Review and commit that change before publishing it. A full repository reset is unnecessary for restoring the old overview.

## What was preserved

The promotion relocated the approved documentation and extracted thesis images into `docs/` and `assets/`, and updated the root README and its links. The original `Algorithms/`, `Models/`, `HIL-Validation/`, `Reports/`, thesis PDFs and license remain unchanged.
