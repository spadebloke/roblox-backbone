# Local toolchain

## Principles

- Pin tool versions.
- Keep setup reproducible.
- Run validation locally.
- Do not depend on GitHub-hosted Actions.
- Prefer one obvious command per job.
- A tool or package must earn its recurring maintenance and context cost.

## Baseline

The starter uses only:
- Rojo for filesystem/Studio source synchronization;
- StyLua for deterministic formatting;
- Rokit to pin/install those developer tools.

Rokit is a bootstrap convenience, not a runtime dependency. Rojo is the only non-Roblox tool that is architecturally central to the default source-of-truth model.

The starter intentionally does **not** include:
- Wally or another package manager;
- a testing framework;
- luau-lsp or another static-analysis package;
- a runtime service/lifecycle framework;
- a networking framework;
- a persistence library;
- an input/component/UI framework.

Add any of these at project level only after a real need justifies it.

## Why pin developer tools

Pinned developer tools reduce drift: a new upstream release does not silently change a project. Update pins intentionally and validate the project after doing so.

Because Rojo and StyLua do not become part of the shipped game architecture, replacing their installer or changing versions later is much cheaper than replacing a runtime framework threaded throughout gameplay code.

## Commands

The project template exposes:
- `scripts/install.ps1`: install the pinned baseline tools.
- `scripts/check.ps1`: format source and verify a Rojo build.
- `scripts/test.ps1`: a stable project-level entry point if/when the project chooses a test mechanism.

These scripts run on the developer machine. GitHub is not the compute platform.

## Package managers and other tools

Do not add Wally (or an alternative) preemptively. If a project adopts its first package, choose the current package-management option then, pin it, and update the project's install/check scripts explicitly.

Likewise, do not standardize a test runner or static analyzer merely because one looks attractive. Promote one into the backbone only after multiple real projects demonstrate that the benefit exceeds dependency/update cost.

## GitHub

The intended default is:
- public or private repo as desired;
- local checks before commits;
- GitHub for remote storage, history, code review, issues, and collaboration;
- no `.github/workflows` directory in the backbone template.

If CI is ever added, it is a project-level decision, not a backbone assumption.
