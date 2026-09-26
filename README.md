# Roblox Backbone

A reusable, lightweight development backbone for agent-assisted Roblox projects.

The goal is simple: **clean modular code, reusable capability across games, strong local testing, and low recurring context cost**.

The lead creative/architectural agent is expected to be Claude Opus. Specialist agents such as Codex may be delegated bounded jobs (for example image generation), while Roblox Studio and Blender are exposed through MCP where live application state is genuinely required.

This repository is deliberately not a giant agent framework. It is a small set of conventions, project templates, local scripts, skills, and integration boundaries designed to compound across projects without forcing every agent to reread the world on every prompt.

See `AGENTS.md` for the short operating contract and `docs/ADOPTION.md` for how a game project should consume this backbone.
