# Architecture

## Goals

The architecture exists to make games easy to reason about locally, easy to test, and easy for agents to modify without loading unrelated code.

## Default layers

`src/server`
: authoritative rules, validation, persistence, purchases, server-owned world behavior.

`src/client`
: input, camera, UI/presentation, local effects.

`src/shared`
: shared types/config, small framework pieces, deterministic shared utilities. Everything here is visible to clients.

## Systems

Use a service for a server feature that owns meaningful state/lifetime and exposes operations to other systems or clients.

Use a controller for client behavior with its own state/lifetime.

Use a component for behavior attached to many tagged instances.

Use a plain module for pure logic or a focused concern inside one system.

When a system has several concerns, prefer:

```text
InventoryService/
  init.luau
  Validation.luau
  Mutation.luau
  Catalog.luau
  Types.luau
```

Only `init.luau` wires the pieces together. Child modules should avoid hidden global state and side effects.

## Lifecycle

The template provides a deliberately small `Init -> Start -> Destroy` lifecycle. It is optional rather than sacred. Keep it if it remains useful; do not evolve it into a large DI framework.

- `Init`: establish local state and capture dependencies; do not assume peers have started.
- `Start`: bind events and begin work.
- `Destroy`: clean up idempotently; tolerate partial startup.
- Module loading should avoid connections, instances, yields, or permanent loops.

## Dependency direction

Prefer explicit one-way dependencies. If two systems need to communicate, consider a signal/event or extracting the shared concept rather than creating a require cycle.

## Rojo / Studio ownership

Rojo owns mapped source folders. Studio owns live world state, lighting, terrain, and other authored instances unless a project deliberately maps them to disk.

Use `$ignoreUnknownInstances` where appropriate so Rojo does not erase Studio-owned content.

## UI

The backbone does not force one UI technology.

A project may choose:
- Studio-authored ScreenGuis driven by Luau; or
- code-authored UI such as React/Luau.

Record that choice in project docs. Do not mix approaches casually.

## Networking

Do not ship a large custom packet/serialization layer in the backbone by default. Start with the simplest maintained mechanism that satisfies the game's requirements. Add optimized transport only when profiling or product requirements justify ownership of the complexity.

Always validate client-originated requests on the server.

## Persistence

Persistence is a capability, not a mandatory dependency. A project that needs player persistence should isolate it behind one data service and use a maintained persistence library or a small explicit wrapper.

## Modularity as token economics

A module boundary is also a context boundary. Favor designs where changing one behavior requires reading a handful of files, not an entire subsystem.
