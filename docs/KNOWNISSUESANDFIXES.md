---
title: "Known Issues & Fixes – Easy AIO Installer DLSS5 NR"
description: "Troubleshooting guide for the Easy AIO Installer: common errors, per-game workarounds, and Vulkan/DXVK specifics."
---

# Known Issues, Fixes & Troubleshooting Guide

This guide covers common problems, error messages, and game-specific workarounds for the **Easy AIO Installer: DLSS 5 + DFC Neural Rendering Pack v3.0.1**.

If you hit a problem, follow these steps before checking the solutions below.

---

## How to diagnose DLSS5 NR problems

1. Open the ReShade overlay with **HOME**.
2. Go to the **Log** tab.
3. Look for lines marked `ERROR` or `WARN`.
4. Search this guide for the error message or symptom.

If the ReShade overlay itself does not open, the problem is upstream of this pack — usually a broken ReShade install or a wrong API hook.

---

## Global issues & solutions

### Missing `ReShade.fxh` or other standard shaders

- **Symptom:** Shaders fail to compile with `could not open included file 'ReShade.fxh'`.
- **Cause:** ReShade was installed without the standard effects pack.
- **Fix:** Reinstall ReShade with Full Add-on Support and make sure standard effects are included, then run the Easy AIO Installer again. The installer's cleanup preserves the mandatory `.fxh` headers, so this error is almost always caused by the ReShade install itself.

### Installer ran but no DFC shaders or add-ons appear

- **Symptom:** ReShade overlay opens and standard effects compile, but `DLSS5_Feed.fx`, VORT or Launchpad shaders, or the DFC add-on never appear.
- **Cause:** The installer was pointed to the wrong folder — a launcher folder, a parent directory, or a subfolder like `Binaries\` instead of the folder containing the main `.exe`.
- **Fix:** Run the installer again and select the exact folder where the game `.exe` lives. Verify that `deep-fried-chicken.addon64`, `reshade-shaders\Shaders\DLSS5_Feed.fx` (or the VORT/Launchpad shaders), and the other deployed files sit next to the game `.exe`.

### Third-party shader conflicts

- **Symptom:** Many `error X3020: cannot sample from texture that is also used as render target`.
- **Cause:** Old ReShade shaders incompatible with ReShade 6.8+.
- **Fix:** Remove or update those shaders. The installer works best on a clean ReShade installation. Its `PurgeShadersExceptCore` step already removes third-party shaders from `reshade-shaders\`, keeping only the mandatory ReShade headers and `DisplayDepth.fx`.

### Duplicate or leftover shaders from another pack

- **Symptom:** Duplicate shader entries, strange errors after an update, or files that refuse to disappear.
- **Cause:** Previous ReShade installation or leftover files from another pack with different names.
- **Fix:** Uninstall ReShade completely, delete leftover files (`dxgi.dll`, `d3d11.dll`, the `reshade-shaders` folder), and reinstall cleanly before running the installer.

### NR stuck in standby

- **Symptom:** The DFC panel shows *Standby* and no effect applies.
- **Cause:** Missing depth buffer, wrong route, or wrong graphics API.
- **Fix:**
  - Verify the depth buffer with `DisplayDepth.fx`.
  - Make sure the selected route matches the game's API and bitness.
  - On DX9 titles use Route 5 (x64) or Route 6 (x86) — DXVK handles the API translation. Do not use dgVoodoo2.
  - On native Vulkan games with DLSS, there is no supported route — use DX12 where available.

### Black and white image

- **Symptom:** Game renders in grayscale.
- **Cause:** Wrong color setting.
- **Fix:** Open the DFC tab and adjust the colour sliders or RGB profile selectors.

### Permission errors or settings reset on restart

- **Symptom:** Red permission error in ReShade, changes not saved, or `ReShadePreset.ini` missing after a restart.
- **Cause:** Write-protected game folder, or ReShade cannot create/modify config files.
- **Fix:**
  - Run the game as administrator once.
  - Adjust folder permissions to allow your user full control.
  - Create an empty `ReShadePreset.ini` manually and ensure it is not read-only.

### Massive FPS drop

- **Symptom:** FPS drops 70–90% with Neural Rendering enabled.
- **Cause:** DLSS 5 NR is extremely demanding.
- **Fix:** Lower the NR intensity in the DFC panel, or disable Neural Rendering if you prefer performance.

### Error 1114 — requested API version 20 not supported (18)

- **Cause:** The installed ReShade build is too old and does not expose ReShade API v20.
- **Fix:** Reinstall ReShade from [reshade.me](https://reshade.me) (latest release) with Full Add-on Support.

### `ReShade64.dll` being used by another process

- **Cause:** The machine-wide Vulkan layer is loaded in a Vulkan process (an emulator, another Vulkan game, or a background service).
- **Fix:** Restart the PC. This only concerns the global Vulkan layer at `C:\ProgramData\ReShade\` — local DXGI routes do not use `ReShade64.dll`.

---

## Per-game issues & fixes

### Cyberpunk 2077 — DFC pauses, `FeatureNotSupported 0xBAD00001` on feature 18

- **Cause:** The patched `nvngx_dlssnr.dll` fails NVIDIA's signature validation.
- **Fix:** Use a clean, signed binary.

### Metro 2033 Redux — Feeder fails to load

- **Cause:** The 4A Engine triple-initialises the graphics device and the Feeder process does not survive.
- **Fix:** Use **Route 5** specifically for Metro. Do not use Route 3.

### Red Dead Redemption 2 — Social Club graphics error in Vulkan mode

- **Cause:** Known RDR2 Vulkan limitation.
- **Fix:** Force DX12 in `system.xml` and use **Route 1**. Native Vulkan with DLSS is not supported.

### GTA V Enhanced (repack) — settings reset or permission error

- **Fix:** Make sure the game folder is not write-protected. Run the game as administrator. Adjust folder permissions. Manually create `ReShadePreset.ini` if missing. If the problem persists, the repack may have a broken file system — use a clean installation.

### Resident Evil 2/3/4/7/8 (Ray Tracing) — no DLSS hook

- **Fix:** Install the REFramework DLSS mod, then pick **Route 2 (NATIVE DX11)** in the installer.

### Kenshi — shaders fail to compile or NR standby

- **Cause:** The depth buffer may not be accessible to ReShade.
- **Fix:** Install ReShade with standard effects. If the depth buffer is still broken, install **Dust - A Kenshi Rendering Framework** from the Steam Workshop. If Dust is already installed, this pack may not be needed.

---

## Legacy DirectX 9 games

The installer no longer requires manual dgVoodoo2 setup. DX9 titles are handled by:

- **Route 5** — 64-bit DX9 games via DXVK x64 + Feeder + iMMERSE Launchpad.
- **Route 6** — 32-bit DX8/DX9/DX10/DX11 games via DXVK x86 + `host64` + Feeder + VORT.

If a DX9 title does not work on Route 5 or 6, it is likely an unsupported engine behaviour (see **Unsupported** below), not a missing setup step.

---

## Unsupported

### Native Vulkan games with DLSS

No Man's Sky, DOOM Eternal, Wolfenstein Youngblood, and RDR2 in Vulkan mode are **not** supported. DFC cannot arm against a native Vulkan DLSS contract — the resource map never completes.

**Workaround:** Use DX12 mode where available (RDR2 supports DX12).

### Pre-2003 DirectX 8 (LithTech Talos)

Aliens vs. Predator 2 and similar titles probe D3D11 at startup when a DXGI provider is present and crash in the Windows `d3d11.dll`. Not supported.

---

## Final note

Some issues are caused by the game itself, not the installer.  
Always use a clean ReShade installation with Full Add-on Support and standard effects before installing the Easy AIO pack.

For more information, visit the [Nexus Mods page](https://www.nexusmods.com/site/mods/2251) or the [GitHub repository](https://github.com/shTNT/Easy-AIO-Installer-DLSS5-NR).

---

[Back to Home](./index.md) · [Requirements](./requirements.md) · [File Index](./file-index.md)
