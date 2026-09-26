# Context and token discipline

The default is progressive disclosure.

## Always in context

Keep this tiny:
- root `AGENTS.md`;
- project `.agent/STATE.md`;
- the current user task;
- names/descriptions of available skills/tools.

## Load on demand

Only when relevant:
- one architecture or domain document;
- the source modules being changed;
- their direct tests;
- a matching skill;
- nearby interfaces/types.

## Do not preload

- the whole repository;
- all historical decisions;
- all docs;
- every skill body;
- previous test logs;
- another agent's full transcript.

## State versus library

`.agent/STATE.md` answers: "What is true right now?" Keep it short and rewrite stale material.

`.agent/INDEX.md` answers: "Where do I look for X?" It contains paths and short descriptions, not duplicated explanations.

`docs/` is the durable knowledge library, read selectively.

Git history is history. Do not duplicate it into an ever-growing Markdown diary.

## Delegation

A specialist receives a bounded work order:
- objective;
- constraints;
- exact input files/assets;
- expected output;
- validation criteria.

Do not send the entire project context to a specialist unless the job genuinely requires it.

## Context budget smell tests

Refactor instructions if:
- a root file becomes long enough that agents repeatedly pay for irrelevant material;
- a task requires scanning unrelated directories to understand local behavior;
- a skill includes large reference material that could live in a separate file;
- multiple docs repeat the same rule;
- generated state is appended indefinitely.

The preferred fix is usually a better index, a smaller module, or a narrower skill—not a new memory system.
