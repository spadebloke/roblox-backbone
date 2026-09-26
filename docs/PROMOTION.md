# Promoting capability into the backbone

The backbone should grow in capability without growing indiscriminately in prompt size.

## Candidate

A project discovers a useful technique, script, test pattern, or workflow.

Keep it project-local first.

## Promote only when

- it has clear value across more than one project or is obviously generic;
- its interface can be made game-agnostic;
- maintenance cost is modest;
- it does not force unrelated projects to load dependencies/context;
- the simpler project-local solution is no longer sufficient.

## Promotion forms

Choose the lightest form:
- a short reference document for durable knowledge;
- a skill for an on-demand workflow;
- a script for deterministic automation;
- a small reusable Luau module for code capability;
- an MCP integration only for a live external boundary.

## Do not promote

- one-off game design decisions;
- historical notes;
- routine fixes already obvious from code/tests;
- speculative abstractions;
- duplicate instructions;
- large dependencies for convenience alone.

## Versioning

Backbone changes should be normal Git commits. Projects pin or record the backbone revision they adopted. Updating is explicit and diff-driven.
