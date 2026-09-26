# Adopting Roblox Backbone

A game project should receive the complete operating model without copying the entire backbone into its prompt.

## Recommended relationship

Keep this repository as the canonical reusable source. A game repository contains a small project layer and a pinned/copy-synced backbone layer. Avoid Git submodules unless a project has a compelling reason.

A game should contain at minimum:

```text
AGENTS.md
CLAUDE.md
.agent/
  STATE.md
  INDEX.md
src/
  server/
  client/
  shared/
assets/
docs/
scripts/
default.project.json
rokit.toml
```

Add `tests/`, package manifests, static-analysis configuration, UI frameworks, persistence libraries, networking libraries, or other tooling only when that game actually needs them.

Copy or synchronize the project template from `templates/project/`. Record the backbone revision used by the game in `.agent/INDEX.md` or a small `BACKBONE_VERSION` file.

## Complete-instructions rule

A downstream agent must be able to discover every required instruction from the project without preloading everything.

The project root `AGENTS.md` should:
1. state the project's few always-applicable rules;
2. identify the backbone and pinned revision;
3. point to project docs and relevant backbone docs/skills;
4. forbid wholesale context loading.

Project-specific decisions always live in the project. Generic Roblox methods, scripts, test patterns, and tool workflows belong here only after they have demonstrated cross-project value.

## Updating a project

Backbone updates should be explicit:
1. compare the project's pinned revision with the desired backbone revision;
2. inspect the diff;
3. copy/sync only reusable backbone-managed files;
4. preserve project-owned files and project-specific choices;
5. run local checks and tests that the project actually has;
6. update the pinned revision.

Do not silently overwrite project-specific instructions.

## Dependency policy

The starter deliberately has almost no dependencies.

A project may add a dependency when a concrete repeated problem justifies it. Record why the dependency is needed and pin its version when practical. Do not add a package manager until there is a package to manage.

## No Actions dependency

The backbone assumes local validation. Projects may use GitHub as remote storage, history, diffs, branches, issues, and pull requests without requiring GitHub-hosted Actions.
