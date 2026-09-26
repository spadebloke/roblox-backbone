# Local toolchain

## Principles

- Pin tool versions.
- Keep setup reproducible.
- Run validation locally.
- Do not depend on GitHub-hosted Actions.
- Prefer one obvious command per job.

## Recommended baseline

- Rojo for filesystem/Studio source synchronization.
- Rokit for tool version management.
- Wally only when the project actually has package dependencies.
- StyLua for formatting.
- luau-lsp for static analysis once Roblox type definitions are configured.

A project may replace a tool when there is a concrete reason, but the replacement should remain locally reproducible.

## Commands

The project template exposes:
- `scripts/install.ps1`: install pinned tools and any declared packages.
- `scripts/check.ps1`: formatting, sourcemap generation, optional static analysis when type definitions are present, and Rojo build.
- `scripts/test.ps1`: project-selected tests.

These scripts run on the developer machine. GitHub is not the compute platform.

## GitHub

The intended default is:
- public or private repo as desired;
- local checks before commits;
- GitHub for remote storage, history, code review, issues, and collaboration;
- no `.github/workflows` directory in the backbone template.

If CI is ever added, it is a project-level decision, not a backbone assumption.
