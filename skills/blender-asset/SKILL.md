---
name: blender-asset
description: Create or revise a Roblox-bound 3D asset through Blender MCP and the asset bridge.
---

# Blender asset

Use for 3D geometry, UV, material, or export work.

Before creation, define the asset brief: style, scale, triangle budget, material/texture constraints, pivots/origin, collision needs, and intended Roblox use.

Keep editable Blender source versioned. Produce a deterministic export where practical.

Validate geometry before upload. Then send geometry/texture content through the asset bridge rather than automating Studio import dialogs.

Return/record the source-to-Roblox asset mapping in the project asset manifest. Prefer versioning an existing asset when the workflow supports it.

Do not load unrelated game source merely to make an asset.
