---
name: gameplay-testing
description: Design focused tests for Roblox gameplay behavior and regression safety.
---

# Gameplay testing

Use when behavior is important enough that future agents must not regress it.

Prefer observable behavior over implementation details.

Cover the smallest meaningful invariants: authorization, ranges, cooldowns, state transitions, cleanup, idempotence, persistence boundaries, and client/server trust.

Choose the lowest test layer that can prove the behavior:
- pure unit;
- behavior/module;
- DataModel integration;
- Studio play;
- multiplayer;
- visual smoke.

Do not jump to expensive live tests when a pure test suffices. Do not mock away the behavior being tested.

Keep fixtures small and reusable. Run only the relevant subset while iterating, then broader checks when shared code changes.
