---
title: "File Index & Sources – Easy AIO Installer DLSS5 NR"
description: "Complete file index of the Easy AIO Installer for DLSS 5 Neural Rendering: components, versions, and original sources. Transparent and safe."
---

# File Index & Sources

This page lists every file included in the **Easy AIO Installer: DLSS 5 + DFC Neural Rendering Pack v3.0.1**, along with its version and original source where available.

All files are placed automatically by the installer based on the route you select. The installer also removes conflicting add-ons from previous installations before deploying.

---

## Core components

| Component | File(s) | Version / Source |
|-----------|---------|------------------|
| Neural consumer | `deep-fried-chicken.addon64`, `deep-fried-chicken-nvngx.dll`, `deep-fried-chicken.cfg` | Deep Fried Chicken 2.0 — Alexander's Discord |
| DLSS5 Feeder | `dlss5-feed.addon64`, `dlss5-feed.addon32`, `dlss5-feed-host64.exe`, `DLSS5_Feed.fx` | [jlrouzies-fr/DLSS5-Feeder](https://github.com/jlrouzies-fr/DLSS5-Feeder) |
| DLSS5 Bridge (Route 2) | `dlss5-bridge.addon64` | [NIGos/dlss5-bridge](https://github.com/NIGos/dlss5-bridge) |
| Patched DLSS-NR | `nvngx_dlssnr.dll` | RenoDX Discord (must be signed for some games) |
| NVIDIA Streamline DLLs | `nvngx_dlss.dll`, `sl.common.dll`, `sl.dlss.dll`, `sl.dlss_g.dll`, `sl.dlss_nr.dll`, `sl.interposer.dll`, `sl.nis.dll`, `sl.pcl.dll`, `sl.reflex.dll` | Bundled |
| DXVK x64 | `d3d9.dll`, `dxgi.dll` | [doitsujin/dxvk](https://github.com/doitsujin/dxvk) |
| DXVK x86 | `d3d8.dll`, `d3d9.dll`, `d3d10core.dll`, `d3d11.dll`, `dxgi.dll` | [doitsujin/dxvk](https://github.com/doitsujin/dxvk) |
| VORT shaders | `vort_Motion.fx`, `vort_Static.fx`, `vort_*.fxh`, textures | [vortigern11/vort_Shaders](https://github.com/vortigern11/vort_Shaders) |
| iMMERSE Launchpad | `MartysMods_LAUNCHPAD.fx` + shaders, `mmx_*.fxh`, textures | MartysMods |
| ReShade overriders | `d3d10.dll`, `d3d11.dll`, `d3d12.dll`, `x64pure\dxgi.dll` | ReShade 6.8.0+ renamed |
| ReShade configs | `ReShade.ini`, `ReshadePreset.ini` | Prebaked, per route |
| Installer media | `fotoinstalador.png`, `musicainstalador.mp3` | Custom |

---

## Deployment per route

### Route 1 — NATIVE DX12 (x64)

- **Root:** `deep-fried-chicken.*`, `nvngx_dlssnr.dll`, `d3d12.dll`, `ReShade.ini`, `ReshadePreset.ini`, `licenses\`

### Route 2 — NATIVE DX11 (x64)

- **Root:** `deep-fried-chicken.*`, `dlss5-bridge.addon64`, `nvngx_dlssnr.dll`, `d3d11.dll`, `ReShade.ini`, `ReshadePreset.ini`, `licenses\`

### Route 3 — MODERN (x64)

- **Root:** `deep-fried-chicken.*`, `dlss5-feed.addon64`, `DLSS5_Feed.fx`, VORT shaders, `nvngx_dlssnr.dll`, DLSS-BINARIES, one of `d3d10.dll` / `d3d11.dll` / `d3d12.dll` (per sub-page), `ReShade.ini`, `ReshadePreset.ini`, `licenses\`

### Route 4 — VULKAN (x64)

- **Root:** `deep-fried-chicken.*`, `dlss5-feed.addon64`, `DLSS5_Feed.fx`, iMMERSE Launchpad shaders, `nvngx_dlssnr.dll`, DLSS-BINARIES, `ReShade.ini`, `ReshadePreset.ini`, `licenses\`

### Route 5 — LEGACY x64 (DXVK)

- **Root:** `deep-fried-chicken.*`, `dlss5-feed.addon64`, `DLSS5_Feed.fx`, iMMERSE Launchpad shaders, `nvngx_dlssnr.dll`, DLSS-BINARIES, DXVK x64 (`d3d9.dll`, `dxgi.dll`), `ReShade.ini`, `ReshadePreset.ini`, `licenses\`

### Route 6 — LEGACY x32 (DXVK + host64)

- **Root:** `dlss5-feed.addon32`, `DLSS5_Feed.fx`, VORT shaders, DXVK x86 (`d3d8.dll`, `d3d9.dll`, `d3d10core.dll`, `d3d11.dll`, `dxgi.dll`), `ReShade.ini`, `ReshadePreset.ini`, `licenses\`
- **`host64\`:** `dlss5-feed-host64.exe`, `dxgi.dll` (pure 64-bit ReShade), `deep-fried-chicken.*`, `nvngx_dlss.dll`, `nvngx_dlssnr.dll`, all `sl.*.dll`

> On Route 6, DFC, NGX, and the `sl.*.dll` Streamline files are **only** deployed inside `host64\` — never at the game root. The root `dxgi.dll` is the DXVK x86 one, not ReShade.

---

## ReShade overrider matrix

| File deployed | Routes |
|---------------|--------|
| `d3d12.dll` (ReShade renamed) | 1, 3 (DX12 or Compat) |
| `d3d11.dll` (ReShade renamed) | 2, 3 (DX11 or Compat) |
| `d3d10.dll` (ReShade renamed) | 3 (DX10 or Compat) |
| `x64pure\dxgi.dll` (pure ReShade) → `host64\dxgi.dll` | 6 |

On Routes 4, 5, 6 no local ReShade DLL is deployed at the game root — ReShade hooks via the machine-wide Vulkan layer at `C:\ProgramData\ReShade\`.

---

## Not touched by the installer

- The user's global Vulkan layer at `C:\ProgramData\ReShade\`.
- ENB files.
- `nvngx_dlss.dll`, `nvngx_dlssnr.dll`, `sl.*.dll` at the game root — they are only replaced by `[Files]` when the selected route deploys them.
- Third-party `.addon32` / `.addon64` files not matching the specific names listed in the cleanup groups.

---

## License files

Every third-party component ships with its license file inside `licenses\` next to the game folder after install, including (but not limited to):

`LICENSE-Deep-Fried-Chicken.md`, `LICENSE-DLSSFeeder.txt`, `LICENSE-DLSSBridge.txt`, `LICENSE-DXVK.txt`, `LICENSE-IMMERSEShaders.txt`, `LICENSE-RenoDX.md`, `LICENSE-Vort.txt`, `Detours-LICENSE.md`, `DLSSNR-Cost-Scaler-MIT.txt`, `optimizer-fps-dlss5-MIT.txt`, `ReShade-LICENSE.md`, and the root `MIT LICENSE.txt`.

---

[Back to Home](./index.md) · [Requirements](./requirements.md) · [Known Issues](./known-issues.md)
