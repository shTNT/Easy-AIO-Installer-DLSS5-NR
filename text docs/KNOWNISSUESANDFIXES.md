# DLSS 5 Neural Rendering – Known Issues, Fixes & Troubleshooting Guide

This guide covers common problems, error messages, and game-specific workarounds for the **Easy AIO Installer: DLSS 5 + RenoDX + Lumenite ReShade Pack**.

If you have a problem, follow these steps before checking the solutions below.

---

## How to Diagnose DLSS5 NR Problems

1. Open the ReShade overlay with **HOME**.
2. Go to the **Log** tab.
3. Look for lines marked `ERROR` or `WARN`.
4. Search this guide for the error message or symptom.

---

## Global Issues & Solutions

### Missing ReShade.fxh or Other Standard Shaders

- **Symptom:** Shaders fail to compile with `could not open included file 'ReShade.fxh'`.
- **Cause:** ReShade was installed without the standard effects pack.
- **Fix:** Reinstall ReShade with full add-on support and run the Easy AIO Installer again.

### Installer Ran but No DLSS5 Shaders or Add-ons Appear

- **Symptom:** ReShade overlay opens and standard effects compile, but `Lumenite_Kernel`, `DLSS5_Feed.fx`, or the Neural Rendering add-on never appear.
- **Cause:** The installer was pointed to the wrong folder (launcher folder, parent directory, or subfolder like `Binaries` instead of the actual game folder containing the main `.exe`).
- **Fix:** Run the installer again and select the exact folder where the game executable is located (e.g., `...\inZOI\BlueClient\Binaries\Win64`). Verify that `reshade-shaders\Shaders\lumenite_Kernel.fx`, `reshade-shaders\Shaders\DLSS5_Feed.fx`, and the `.addon64` files are next to the game `.exe`.

### Unknown Technique Warnings

- **Symptom:** `unknown technique 'lumenite_Kernel'` or similar.
- **Cause:** Incorrect technique name or shader failed to compile.
- **Fix:** Ensure the preset uses exactly `Lumenite_Kernel` and `DLSS5_Feed`. Check the ReShade log for compilation errors if it persists.

### Duplicate Lumenite_Kernel or Weird .fx Conflicts

- **Symptom:** Duplicate Lumenite entries or strange errors after updating.
- **Cause:** Previous ReShade installation or leftover files from another pack.
- **Fix:** Uninstall ReShade completely, delete leftover files (`dxgi.dll`, `d3d11.dll`, `ReShade64.dll`, `reshade-shaders` folder), and reinstall cleanly before running the installer.

### Third-Party Shader Conflicts

- **Symptom:** Many `error X3020: cannot sample from texture that is also used as render target`.
- **Cause:** Old ReShade shaders incompatible with ReShade 6.8+.
- **Fix:** Remove or update those shaders. The installer works best on a clean ReShade installation.

### NR Stuck in Standby

- **Symptom:** Add-on shows "Standby" and no effect.
- **Cause:** Missing depth buffer, wrong add-on, or wrong graphics API.
- **Fix:**  
  - Verify depth buffer with `DisplayDepth.fx`.
  - Use the correct add-on: bridge for native DLSS, feed for non-native.
  - Install ReShade for the correct API (D3D11/12).
  - For DX9 games, use dgVoodoo2 to convert to D3D11.

### Black and White Image

- **Symptom:** Game renders in grayscale.
- **Cause:** Wrong color setting.
- **Fix:** In the ReShade Add-ons tab, under Neural Rendering, adjust the colour sliders or RGB profile selectors.

### Permission Errors or Settings Reset on Restart

- **Symptom:** Red permission error in ReShade, changes not saved, or `ReShadePreset.ini` missing.
- **Cause:** Write-protected game folder or ReShade cannot create/modify config files.
- **Fix:**  
  - Run the game as administrator once.
  - Adjust folder permissions to allow your user full control.
  - Create an empty `ReShadePreset.ini` manually and ensure it's not read-only.

### Massive FPS Drop

- **Symptom:** FPS drops 70–90% with Neural Rendering enabled.
- **Cause:** DLSS5 NR is extremely demanding.
- **Fix:** Disable Neural Rendering if you prefer performance.

---

## Game-Specific Issues & Fixes

### The Witcher 3 – DLSS5 Not Recognized

- Download Streamline.zip.
- Copy only `nvngx_dlssnr.dll` and `nvngx_dlss.dll` to the game folder.
- In game, set DLSS to Ultra Performance in the main menu.
- Load save, then change DLSS setting to any other value to trigger recognition.
- This method is unstable and may not work for everyone.

### Red Dead Redemption 2 – NR Not Working or Crashes

- Use Vulkan.
- Install ReShade for Vulkan.
- Place Streamline DLLs and `nvngx_dlssnr.dll` next to the game `.exe`.
- Use DLSSFeeder and ReshadeMotionEstimation.
- In NVIDIA App, set preset to L (custom) and resolution scale to 100% (DLAA).
- In ReShade, put DRME at top and DLSS5_Feed underneath, then enable the AI add-on.
- If you get a white screen, adjust the HDR bar.

### Crimson Desert – CreateFeature Exception

- Try `dlss5-dx11-bridge.addon64`.
- Or try a newer version of the add-on.

### GTA V Enhanced (Repack) – Settings Reset or Permission Error

- Ensure game folder is not write-protected.
- Run game as administrator.
- Adjust folder permissions.
- Manually create `ReShadePreset.ini` if missing.
- If it persists, the repack may have a broken file system; use a clean installation.

### The Last of Us Part 1 – Crash with Native DLSS

- Use modified `renodx-dlss5-tlou.addon64` that prevents Streamline hooks from resolving `slEvaluateFeature` and `slSetTag`.
- Only copy `nvngx_dlss.dll`, `nvngx_dlssg.dll`, and `nvngx_dlssnr.dll`.
- Do NOT copy SL DLLs.
- Verify game files if crash persists.

### Dirt Rally 2.0 – Unrecognized Compiler Target

- Error: `unrecognized compiler target cs_5_1`.
- Incompatible; try bridge version instead of feed.

### Far Cry 3 and Other Old DX9 Games – Can't Unroll Loops

- Error: `error X3531: can't unroll loops`.
- Incompatible with DirectX 9.
- Use dgVoodoo2 to force D3D11.

### Kenshi – Shaders Fail to Compile or NR Standby

- Depth buffer may not be accessible to ReShade.
- Install ReShade with standard effects.
- If depth buffer is bad, install **Dust - A Kenshi Rendering Framework** from Steam Workshop.
- If Dust is installed, this pack may not be needed.

### Resident Evil 2/3/4/7/8 (Ray Tracing) – No DLSS Hook

- Install the REFramework DLSS mod.
- Then choose YES (bridge) in the installer.

---

## DirectX 9 Games – Manual dgVoodoo2 Setup

The next version of the Easy AIO Installer will include automatic dgVoodoo2 support.

For now, follow these steps for DirectX 9 games:

1. Download dgVoodoo2 from [dege.freeweb.hu](https://dege.freeweb.hu/dgVoodoo2/dgVoodoo2/).
2. Extract it and open the `MS\x86` folder.
3. Copy `D3D9.dll` and `DDraw.dll` into the game folder, next to the game `.exe`.
4. Install ReShade for **DirectX 11** (not DX9) into the game folder.
5. Run the Easy AIO Installer again and select the game folder.
6. ReShade should now load with add-ons and the pack's shaders.

---

## Final Note

Some issues are caused by the game itself, not the installer.  
Always use a clean ReShade installation with full add-on support and standard effects before installing the Easy AIO pack.

For more information, visit the official Nexus Mods page or the GitHub repository.

## Requirements

See the [full requirements page](./requirements.md) for more details.
