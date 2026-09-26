# Testing

Tests are a core part of the backbone because they let agents modify games without relying on confidence-by-inspection.

## Layers

1. Pure unit tests: deterministic modules with no Roblox runtime dependencies where possible.
2. Behavior tests: gameplay rules and invariants expressed as executable expectations.
3. DataModel integration tests: systems interacting with Roblox instances/services.
4. Studio play tests: live server/client behavior.
5. Multiplayer tests: multiple simulated clients when networking behavior warrants it.
6. Visual smoke tests: screenshots or targeted MCP inspection for presentation.
7. Optional remote/headless regression: only when a project has enough value to justify it.

Not every project needs all seven layers on day one.

## Test-first rule

For nontrivial gameplay behavior, define the desired behavior before or alongside implementation. Examples:
- cooldown rejects repeated requests;
- dead players cannot attack;
- inventory mutations are server-authoritative;
- purchases are idempotent;
- interaction range is validated;
- cleanup happens on player leave.

Do not create tests merely to inflate counts. Prefer behavior coverage that constrains regressions.

## Running tests

Run the narrowest relevant tests during iteration. Run broader checks before handoff or when shared framework code changes.

`scripts/test.ps1` is intentionally a project hook point. Projects may select their Luau test runner and Studio test strategy while keeping one local command.

No test workflow requires GitHub Actions.
