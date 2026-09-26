# Roblox Backbone — agent contract

This repository is the reusable development backbone for agent-assisted Roblox projects.

## Prime directives

1. Keep it simple. Add machinery only when a concrete need justifies its recurring complexity and context cost.
2. Sip tokens, do not guzzle them. Never reread the whole repository by default. Read only the files required by the current task.
3. Optimize module boundaries for local reasoning. A feature should normally be understandable and testable without unrelated systems.
4. Opus is the lead creative and architectural agent. Delegate bounded specialist jobs only when specialization pays for another context.
5. Code on disk is authoritative for Rojo-managed source. Studio is authoritative for live world/runtime state and Studio-authored content.
6. Deterministic rules belong in scripts, tests, formatters, linters, or guards rather than repeated prompt prose.
7. Reusable capability should graduate into this backbone only after it proves useful across projects. Project-specific knowledge stays in the project.
8. Do not use GitHub Actions for routine validation. Run checks locally.
9. Never commit credentials, API keys, Roblox secrets, unpublished private assets, or account-specific secrets.
10. Prefer boring, inspectable files over opaque state: Markdown, Luau, PowerShell, TOML, JSON.

## Context discipline

Always-loaded instructions must stay short. Do not turn this file into a project encyclopedia.

For a task:
- inspect the relevant module(s), nearby tests, and the smallest applicable reference;
- load a skill only when its trigger matches the task;
- follow links from `.agent/INDEX.md` or project docs instead of preloading them;
- summarize durable current state by editing, not appending, `.agent/STATE.md`;
- do not read all docs, all skills, or all source files "just in case."

## Source layout

Default project shape:
- `src/server`: authoritative game rules, persistence, server services.
- `src/client`: input, camera, presentation, UI controllers.
- `src/shared`: shared types, config, small framework pieces, pure shared utilities.
- `tests`: unit and behavior tests.
- `assets`: source assets and manifests; keep generated derivatives reproducible.
- `docs`: durable project knowledge loaded on demand.
- `.agent`: tiny current state and index, not a diary.

Split by responsibility, not line count alone. If a system has multiple concerns, use a folder with `init.luau` plus focused child modules. Keep child modules plain where possible.

## Authority boundaries

- Edit Rojo-managed Luau on disk, not through Studio MCP.
- Use Studio MCP for DataModel inspection, Studio-owned instances, runtime diagnosis, playtesting, screenshots, and other live Studio work.
- Blender source belongs in versioned project storage; Blender MCP controls Blender when 3D work is needed.
- Asset-upload automation should return Roblox asset IDs; do not automate UI dialogs when a stable API path exists.
- Codex may be used as a specialist, for example image generation or a bounded implementation/review job. It is not a second autonomous owner of the same source tree.

## Quality

Use strict Luau. Favor explicit dependencies and server authority. Keep requires side-effect free where practical.

Before handoff:
- run the narrowest relevant tests first;
- run local formatting/static/build checks for changed code;
- expand to broader tests only when the change warrants it;
- never claim tests passed if they were not run.

Gameplay behavior should be testable. For nontrivial behavior changes, define or update tests before or alongside implementation.

## Backbone changes

A backbone addition must justify:
- cross-project reuse;
- maintenance cost;
- recurring token/context cost;
- why a simpler local project solution is insufficient.

Promote reusable knowledge; do not accumulate it automatically.

## Where to look

- `docs/ADOPTION.md`: consume this backbone from a game project.
- `docs/ARCHITECTURE.md`: code and ownership boundaries.
- `docs/CONTEXT.md`: token-efficient context model.
- `docs/TESTING.md`: testing layers and policy.
- `docs/TOOLS.md`: local toolchain and zero-Actions policy.
- `docs/MCP.md`: Studio, Blender, asset bridge, and specialist-agent boundaries.
- `docs/PROMOTION.md`: how capabilities graduate into the backbone.
- `skills/*/SKILL.md`: on-demand workflows.

Explicit user instructions override these defaults.
