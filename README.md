# Easy AIO Installer: DLSS 5 + DFC Neural Rendering Pack v3.0.1

**by Kry0genik**  
[![Nexus Mods](https://img.shields.io/badge/Nexus%20Mods-DLSS%205%20AIO-blue)](https://www.nexusmods.com/site/mods/2251)  
[![GitHub Pages](https://img.shields.io/badge/Docs-GitHub%20Pages-green)](https://shTNT.github.io/Easy-AIO-Installer-DLSS5-NR/)  
[![GitHub release](https://img.shields.io/github/v/release/shTNT/Easy-AIO-Installer-DLSS5-NR)](https://github.com/shTNT/Easy-AIO-Installer-DLSS5-NR/releases)  
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](LICENSE)

> A standalone, offline installer that deploys **DLSS 5 Neural Rendering** into any compatible game, emulator, or legacy title — regardless of graphics API or bitness. Six routes, one wizard. Every dependency ships inside the installer. Nothing is downloaded at install time.

---

## What's new in v3.0.1

### Neural stack replaced

- **Deep Fried Chicken 2.0** replaces RenoDX and Lumenite as the neural consumer across all routes.
- **Motion providers** now split by route:
  - **VORT** (luma-based optical flow) on Modern and Legacy x32 routes.
  - **iMMERSE Launchpad** (NVIDIA Optical Flow) on Vulkan and Legacy x64 routes.

### Six installation routes

Full coverage from **DX8** through **DX12**, both **32-bit and 64-bit**, native and synthetic DLSS contracts. See [The six routes](#the-six-routes).

### host64 architecture

DFC and NGX are strictly 64-bit. To bring DLSS 5 NR to 32-bit games, the installer deploys a companion `host64\` subfolder running a 64-bit ReShade + DFC + NGX pipeline that exchanges frames with the 32-bit game via shared textures and a named pipe.

### DXVK x64 and x86 bundled

Legacy DX9/DX10/DX11 titles are translated to Vulkan via DXVK, where ReShade hooks as a machine-wide Vulkan layer. No local ReShade DLLs are deployed for these routes.

### DXGI overrider system

On local-DLL routes, ReShade is renamed to `d3d10.dll` / `d3d11.dll` / `d3d12.dll` to prevent conflicts with the Vulkan global layer.

### Cleanup

- **`PurgeShadersExceptCore`** replaces the old `DelTree` on `reshade-shaders\`. Third-party shaders are purged, but the mandatory ReShade `.fxh` headers and `DisplayDepth.fx` are preserved.
- **OptiScaler** leftovers are removed (conflicts with DFC).
- **dgVoodoo** leftovers are removed (no longer needed — Routes 5 and 6 handle legacy APIs natively via DXVK).
- ENB is **not** touched (out of scope).

### Other changes

- **Six languages**: English, Spanish, French, Italian, Russian, Simplified Chinese.
- **Wizard scaled to 140%**, modern dark theme.
- **Route detail panel** — click any route to read its description.
- **Ready-to-Install summary** — the wizard lists exactly which files will be deployed before you commit.

---

## Contents

- [Requirements](#requirements)
- [The six routes](#the-six-routes)
- [File index & sources](#file-index--sources)
- [Installation steps](#installation-steps)
- [In-game controls](#in-game-controls)
- [Adjusting Neural Rendering](#adjusting-neural-rendering)
- [Unsupported games](#unsupported-games)
- [Known issues & fixes](#known-issues--fixes)
- [Transparency](#transparency)
- [Disclaimer](#disclaimer)

---

## Requirements

- **ReShade 6.8.0 or higher** with **Full Add-on Support** installed in the game folder by you **before** running this installer.
  - For **Native DX11/DX12** and **Modern** routes: ReShade as `dxgi.dll` is fine.
  - For **Vulkan** (Emulator) and **DXVK** (Legacy x64/x32) routes: ReShade must be installed as a **Vulkan layer**, not as `dxgi.dll`.
- **NVIDIA RTX GPU** — 20/30/40/50 series. RTX 30+ recommended for good performance.
- **Latest NVIDIA drivers**.
- **Game with a working depth buffer** — except VORT/Launchpad routes which generate motion.
- **Single-player games** (anti-cheat may block injection).
- **Game folder without restricted write permissions**.

> The installer augments an existing ReShade install. It never installs ReShade for you.

---

## The six routes

| # | Route | API | Bitness | Native DLSS | Neural consumer | Motion provider |
|---|-------|-----|---------|-------------|-----------------|-----------------|
| 1 | NATIVE DX12 | D3D12 | x64 | Yes | DFC | — |
| 2 | NATIVE DX11 | D3D11 | x64 | Yes | DFC + Bridge | — |
| 3 | MODERN | D3D10 / D3D11 / D3D12 | x64 | No | DFC + Feeder | VORT |
| 4 | VULKAN | Vulkan | x64 | No | DFC + Feeder | iMMERSE Launchpad |
| 5 | LEGACY x64 | D3D9 → Vulkan (DXVK x64) | x64 | No | DFC + Feeder | iMMERSE Launchpad |
| 6 | LEGACY x32 | D3D8 / D3D9 / D3D10 / D3D11 → Vulkan (DXVK x86) | x86 | No | DFC + Feeder + host64 | VORT |

- **Route 3** has a sub-page to pick the exact DirectX version (DX10 / DX11 / DX12 / Compatibility).
- **Route 6** deploys the full DXVK x86 set: `d3d8.dll`, `d3d9.dll`, `d3d10core.dll`, `d3d11.dll`, `dxgi.dll`.

---

## File index & sources

| Component | File(s) | Version / Source |
|-----------|---------|------------------|
| Neural consumer | `deep-fried-chicken.addon64`, `deep-fried-chicken-nvngx.dll`, `deep-fried-chicken.cfg` | Deep Fried Chicken 2.0 — Alexander's Discord |
| DLSS5 Feeder | `dlss5-feed.addon64`, `dlss5-feed.addon32`, `dlss5-feed-host64.exe`, `DLSS5_Feed.fx` | [jlrouzies-fr/DLSS5-Feeder](https://github.com/jlrouzies-fr/DLSS5-Feeder) |
| DLSS5 Bridge (Route 2) | `dlss5-bridge.addon64` | [NIGos/dlss5-bridge](https://github.com/NIGos/dlss5-bridge) |
| Patched DLSS-NR | `nvngx_dlssnr.dll` | RenoDX Discord (must be signed for some games) |
| NVIDIA Streamline DLLs | `nvngx_dlss.dll`, `sl.common.dll`, `sl.dlss.dll`, `sl.dlss_g.dll`, `sl.dlss_nr.dll`, `sl.interposer.dll`, `sl.nis.dll`, `sl.pcl.dll`, `sl.reflex.dll` | Bundled |
| DXVK | x64: `d3d9.dll`, `dxgi.dll` · x86: `d3d8.dll`, `d3d9.dll`, `d3d10core.dll`, `d3d11.dll`, `dxgi.dll` | [doitsujin/dxvk](https://github.com/doitsujin/dxvk) |
| VORT shaders | `vort_Motion.fx`, `vort_Static.fx`, `vort_*.fxh`, textures | [vortigern11/vort_Shaders](https://github.com/vortigern11/vort_Shaders) |
| iMMERSE Launchpad | `MartysMods_LAUNCHPAD.fx` + shaders, `mmx_*.fxh`, textures | MartysMods |
| ReShade overriders | `d3d10.dll`, `d3d11.dll`, `d3d12.dll`, `x64pure\dxgi.dll` | ReShade 6.8.0+ renamed |
| ReShade configs | `ReShade.ini`, `ReshadePreset.ini` | Prebaked, per route |
| Installer media | `fotoinstalador.png`, `musicainstalador.mp3` | Custom |

License files for every third-party component are bundled in `licenses\` next to the game folder after install.

---

## Installation steps

1. Install **ReShade 6.8.0+ with Full Add-on Support** into the game folder yourself.
   - On the effect-selection screen, leave **everything unchecked** — this pack ships its own shaders.
   - For Vulkan routes (4, 5, 6), install ReShade as a **Vulkan layer**, not as `dxgi.dll`.
2. Download and run `EasyAIO_DLSS5_DFC_v3.0.1_Setup.exe`.
3. Select the **game folder** — the one containing the main `.exe`, not a launcher or shortcut.
4. Confirm the ReShade requirement (clicking NO opens the official download page and pauses the installer).
5. Pick the **route** that matches your game. Click any route to read its description in the panel below.
6. (Route 3 only) Pick the exact DirectX version on the next page.
7. Review the Ready-to-Install summary — it lists every file that will be deployed.
8. Wait for the install to finish (a chime sounds).

---

## In-game controls

- **HOME** — open / close the ReShade overlay
- **DEL** — toggle all effects ON/OFF
- **PRINT SCREEN** — screenshot (saved to `.\ReShade Screenshots`). If Windows intercepts it (Snip & Sketch on Win11), rebind it in ReShade's Settings tab.

---

## Adjusting Neural Rendering

1. Open the overlay with **HOME**.
2. Go to the **Deep Fried Chicken** tab.
3. Tune the NR intensity and preset there.
4. If you're on a Vulkan route, open ReShade's **Settings** tab and confirm the Vulkan layer is active.

---

## Unsupported games

### Native Vulkan games with DLSS

**No Man's Sky**, **DOOM Eternal**, **Wolfenstein Youngblood**, and **RDR2** in Vulkan mode are **not** supported. DFC cannot arm against a native Vulkan DLSS contract — the resource map never completes (confirmed empirically on DOOM Eternal with 46,000+ fail-open iterations).

**Workaround:** use DX12 mode where available (RDR2 supports DX12).

### DirectX 8 pre-2003 (LithTech Talos)

**Aliens vs. Predator 2** and other pre-2003 DX8 titles that probe D3D11 at startup will crash in the Windows `d3d11.dll` when a DXGI provider is present. Not supported.

---

## Known issues & fixes

Full guide: **[docs/known-issues.md](docs/known-issues.md)**

Quick hits:

| Symptom | Cause | Fix |
|---------|-------|-----|
| Cyberpunk 2077 — DFC pauses, `FeatureNotSupported 0xBAD00001` on feature 18 | Patched `nvngx_dlssnr.dll` fails NVIDIA signature validation | Use a clean signed binary |
| Metro 2033 Redux — Feeder fails to load | 4A Engine triple-init | Use Route 5 instead |
| RDR2 — Social Club graphics error in Vulkan mode | Known RDR2 Vulkan limitation | Force DX12 in `system.xml`, use Route 1 |
| Error 1114 — requested API version 20 not supported (18) | ReShade build too old | Reinstall ReShade from reshade.me (latest) |
| `ReShade64.dll` being used by another process | Vulkan layer loaded in another process | Restart PC |
| Missing `ReShade.fxh` | ReShade installed without standard effects | Reinstall ReShade with standard effects — the installer preserves `.fxh` automatically |

---

## Transparency

- Full installer source (`.iss`) is included in this repository.
- File tree and file index are documented in [docs/](docs/).
- The installer only uses publicly available DLLs and ReShade add-ons, all credited above.
- The installer never touches `C:\ProgramData\ReShade\` — your global Vulkan layer is off-limits.
- The installer never touches ENB files.

---

## Disclaimer

Your antivirus will probably flag this installer.  
That's normal — it contains DLL injection and ReShade add-ons.  
Use [innoextract](https://constexpr.org/innoextract/) to inspect the files yourself.

This installer is free to distribute, modify, and share without restriction.  
Use it at your own risk. The author is not responsible for any damage, multiplayer bans, or unexpected behavior.  
If your PC explodes, that's on you. Enjoy the pack responsibly.
