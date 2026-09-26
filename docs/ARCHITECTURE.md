# Architecture

## Goals

The architecture exists to make games easy to reason about locally, easy to test, and easy for agents to modify without loading unrelated code.

## Default layers

`src/server`
: authoritative rules, validation, persistence, purchases, server-owned world behavior.

`src/client`
: input, camera, UI/presentation, local effects.

`src/shared`
: shared types/config, deterministic shared utilities, and genuinely shared interfaces. Everything here is visible to clients.

## Start with modules, not framework machinery

The base template intentionally ships with no service lifecycle, DI container, networking framework, persistence layer, component system, or UI framework.

Add one only when a real project need justifies it.

Use a service-shaped module when a server feature owns meaningful state/lifetime and exposes operations to other systems or clients.

Use a controller-shaped module for client behavior with its own state/lifetime.

Use a component pattern for behavior attached to many tagged instances.

Use a plain module for pure logic or a focused concern inside one system.

When a system has several concerns, prefer:

```text
Inventory/
  init.luau
  Validation.luau
  Mutation.luau
  Catalog.luau
  Types.luau
```

Only `init.luau` should wire the pieces together when possible. Child modules should avoid hidden global state and side effects.

## Dependency direction

Prefer explicit one-way dependencies. If two systems need to communicate, consider an event/signal or extracting the shared concept rather than creating a require cycle.

Avoid side effects at require time. Connections, instances, long-lived tasks, and runtime startup should be created explicitly.

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

Do not ship a large custom packet/serialization layer in the backbone by default. Start with the simplest maintained mechanism that satisfies the game's requirements. Add optimized transport only when profiling or product requirements justify owning the complexity.

Always validate client-originated requests on the server.

## Persistence

Persistence is a capability, not a mandatory dependency. A project that needs player persistence should isolate it behind one data boundary and use a maintained library or a small explicit wrapper.

## Modularity as token economics

A module boundary is also a context boundary. Favor designs where changing one behavior requires reading a handful of files, not an entire subsystem.
