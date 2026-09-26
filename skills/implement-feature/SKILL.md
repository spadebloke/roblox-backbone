---
name: implement-feature
description: Implement or revise a gameplay feature with minimal context and strong local verification.
---

# Implement feature

Use when adding or materially changing gameplay behavior.

1. Read the project `.agent/STATE.md` and the smallest relevant entries in `.agent/INDEX.md`.
2. Inspect only the target system, direct dependencies/interfaces, and nearby tests.
3. State the behavior/invariants that must remain true.
4. Add or update focused tests for nontrivial behavior.
5. Implement in the smallest responsible module(s). Split concerns rather than growing a god module.
6. Run narrow tests, then local checks.
7. Update project state/docs only if the durable truth changed.

Done means behavior is implemented, relevant tests/checks pass, and no unrelated context or framework machinery was introduced.
