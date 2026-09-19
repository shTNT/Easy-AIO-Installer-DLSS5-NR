---
title: "Easy AIO Installer: DLSS 5 + DFC Neural Rendering Pack"
description: "Standalone offline installer that deploys DLSS 5 Neural Rendering into any compatible game, emulator, or legacy title. Six routes, one wizard."
---

# Easy AIO Installer — Documentation

Standalone offline installer that deploys **DLSS 5 Neural Rendering** into any compatible game, emulator, or legacy title — regardless of graphics API or bitness.

**Current version:** v3.0.1

---

## Quick links

- [Requirements](./requirements.md)
- [File Index & Sources](./file-index.md)
- [Known Issues & Fixes](./known-issues.md)
- [Main README](../README.md)
- [Nexus Mods page](https://www.nexusmods.com/site/mods/2251)
- [GitHub Releases](https://github.com/shTNT/Easy-AIO-Installer-DLSS5-NR/releases)

---

## The six routes at a glance

| # | Route | API | Bitness | Native DLSS | Neural consumer | Motion provider |
|---|-------|-----|---------|-------------|-----------------|-----------------|
| 1 | NATIVE DX12 | D3D12 | x64 | Yes | DFC | — |
| 2 | NATIVE DX11 | D3D11 | x64 | Yes | DFC + Bridge | — |
| 3 | MODERN | D3D10 / D3D11 / D3D12 | x64 | No | DFC + Feeder | VORT |
| 4 | VULKAN | Vulkan | x64 | No | DFC + Feeder | iMMERSE Launchpad |
| 5 | LEGACY x64 | D3D9 → Vulkan (DXVK x64) | x64 | No | DFC + Feeder | iMMERSE Launchpad |
| 6 | LEGACY x32 | D3D8 / D3D9 / D3D10 / D3D11 → Vulkan (DXVK x86) | x86 | No | DFC + Feeder + host64 | VORT |

---

## Certified games

| Route | Game | Notes |
|-------|------|-------|
| 1 | Gothic 1 Remake | Native DX12 + DLSS, MFG and Reflex native |
| 1 | Cyberpunk 2077 | Requires signed `nvngx_dlssnr.dll` or signature validation disabled |
| 2 | Crysis Remastered | DFC + Bridge load, NR applies |
| 3 | Fallout 4 | DX11 sub-mode required, Compat breaks |
| 3 | Fallout: New Vegas | — |
| 3 | Left 4 Dead 2 | — |
| 4 | RPCS3 — Demon's Souls | Feeder + Launchpad load |
| 5 | Risen | — |
| 6 | Battle Realms (DX9) | — |
| 6 | Far Cry 2 (DX10 mode) | — |
| 6 | BioShock Infinite (DX11) | — |

**Pending certification:** PCSX2 (any title), any DX8 32-bit title.

---

## Unsupported

- **Native Vulkan games with DLSS** — No Man's Sky, DOOM Eternal, Wolfenstein Youngblood, RDR2 in Vulkan mode. Use DX12 mode where available.
- **Pre-2003 DX8 (LithTech Talos)** — Aliens vs. Predator 2 and similar titles.

---

[Back to Home](./index.md) · [Requirements](./requirements.md) · [File Index](./file-index.md) · [Known Issues](./known-issues.md)
