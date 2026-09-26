# MCP and agent boundaries

MCP is for live applications and capabilities, not for replacing the repository.

## Lead agent

Claude Opus is the intended creative/architectural lead. It owns project direction, architecture, source integration, and final acceptance.

## Codex

Codex is a specialist service when useful, for example:
- image generation;
- a bounded implementation task;
- an independent review;
- a focused code transformation.

Give Codex a narrow work order. Do not let multiple agents independently own the same source tree.

## Roblox Studio MCP

Use Studio MCP for:
- inspecting the live DataModel;
- Studio-owned instances and authored world/UI content;
- runtime output/errors;
- play/run tests;
- screenshots and live diagnosis.

Do not use Studio MCP to edit Rojo-managed Luau source. Edit that source on disk.

## Blender MCP

Use Blender MCP for 3D creation and inspection. Keep source `.blend` files and relevant export configuration in project storage.

Generated game assets should be reproducible from versioned source when practical.

## Asset bridge

The desired mesh/texture workflow is API-oriented:

```text
Blender
  -> export geometry/texture bytes
  -> local asset bridge
  -> Roblox conversion place/service
  -> EditableMesh / EditableImage
  -> CreateAssetAsync (or maintained successor API)
  -> asset IDs returned to the lead agent
```

Avoid computer-use automation of import dialogs when an API path is available.

The bridge should eventually support stable source-to-asset manifests and asset version updates rather than creating unnecessary duplicate assets.

## Capability rule

Do not create an MCP server merely to store Markdown knowledge or project memory. Files are cheaper, versioned, searchable, and inspectable. Add MCP only when an external live system or privileged action genuinely requires it.
