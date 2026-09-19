---
title: "Requirements for DLSS 5 Neural Rendering with Easy AIO Installer"
description: "Minimum and recommended requirements to use the DLSS 5 NR installer: NVIDIA RTX GPU, ReShade 6.8.0+ with full add-on support, and a compatible game."
---

# Easy AIO Installer Requirements

Before installing the pack, make sure you meet these requirements:

## ReShade

- **ReShade 6.8.0 or higher** with **Full Add-on Support**.
- Installed by **you**, into the game folder, **before** running this installer.
  - For **Native DX11/DX12** and **Modern** routes: ReShade as `dxgi.dll` is fine.
  - For **Vulkan** (Emulator) and **DXVK** (Legacy x64/x32) routes: ReShade must be installed as a **Vulkan layer**, not as `dxgi.dll`.
- On the effect-selection screen, leave **everything unchecked** — this pack ships its own shaders.

> The installer augments an existing ReShade install. It never installs ReShade for you.

## GPU

- **NVIDIA RTX GPU** — 20, 30, 40, or 50 series.
- **RTX 30 or newer recommended** for good performance.
- **Latest NVIDIA drivers** installed.

## Game

- **A working depth buffer** — required for Routes 1, 2, 3 (DX10/11/12) and 6. Routes 3 (VORT), 4 and 5 (Launchpad) generate motion optically and do not strictly require a depth buffer.
- **Both 32-bit and 64-bit games are supported** — Route 6 handles x86 titles via the `host64` companion process.
- **Single-player games** — anti-cheat may block injection.
- **Game folder without restricted write permissions**.

## Not supported

Native Vulkan games with DLSS (No Man's Sky, DOOM Eternal, Wolfenstein Youngblood, RDR2 in Vulkan mode). Use DX12 mode where available.

---

If you have any issues, check the [known issues guide](./known-issues.md).

[Back to Home](./index.md)
