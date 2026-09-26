# Project agent contract

This game uses the Roblox Backbone operating model.

## Always apply

- Keep code modular and locally understandable.
- Sip context: inspect only files/docs/skills needed for the current task.
- Rojo-managed source is edited on disk; Studio MCP is for live Studio/runtime state and Studio-owned content.
- Prefer deterministic scripts and focused tests over repeated prose rules.
- Server owns authoritative game outcomes; validate client requests.
- Dependencies must earn their place; do not add packages or frameworks preemptively.
- Do not commit secrets or private credentials.
- Run the local checks and relevant tests the project actually has before handoff.
- Do not use GitHub Actions unless the project explicitly chooses to.

## Project context

Read `.agent/STATE.md` for current truth and `.agent/INDEX.md` to locate deeper context. Do not preload all referenced files.

Record project-specific architecture/design in this repository. Generic reusable methods belong in the backbone only after explicit promotion.

## Backbone

Record the adopted backbone revision in `.agent/INDEX.md`. Consult the matching backbone docs or skills only when relevant.

Explicit user instructions override these defaults.
