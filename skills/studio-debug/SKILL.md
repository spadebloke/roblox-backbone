---
name: studio-debug
description: Diagnose Roblox runtime behavior through Studio MCP without editing Rojo-owned source in Studio.
---

# Studio debug

Use when the question depends on live Studio/DataModel/runtime state.

1. Identify the runtime symptom and expected behavior.
2. Inspect the smallest relevant DataModel region and output/errors.
3. Run or reproduce the minimal play test needed.
4. Use screenshots only when visual state matters.
5. Trace the symptom back to disk-owned source or Studio-owned content.
6. Edit Rojo source on disk; edit Studio-owned instances through Studio MCP.
7. Re-run the minimal reproduction.

Do not browse the whole DataModel by default. Do not use Studio as a second source-code editor.
