---
title: "File Index & Sources – Easy AIO Installer DLSS5 NR"
description: "Complete file index of the Easy AIO Installer for DLSS 5 Neural Rendering: components, versions, and original sources. Transparent and safe."
---

# File Index & Sources

This page lists every file included in the **Easy AIO Installer: DLSS 5 + RenoDX + Lumenite ReShade Pack**, along with its version and original source where available.

| Component | File(s) | Version / Source |
|-----------|---------|------------------|
| DLSS 5 Neural Rendering Add-on | `renodx-dlss5.addon64` | v4.7 (not ShortFuse's mod) |
| Lumenite Motion Vectors | `lumenite_Kernel.fx` + includes | [LumeniteFX – GitHub](https://github.com/umar-afzaal/LumeniteFX) |
| DLSS5 Bridge (native DLSS) | `dlss5-dx11-bridge.addon64` | v1.4.1 – [NIGos/dlss5-bridge](https://github.com/NIGos/dlss5-bridge/releases/tag/v1.4.1) |
| DLSS5 Feeder (non-native DLSS) | `dlss5-feed.addon64` | v0.11.0-beta.2 – [jlrouzies-fr/DLSS5-Feeder](https://github.com/jlrouzies-fr/DLSS5-Feeder/releases/tag/v0.11.0-beta.2) |
| DLSS5 Feed Shader | `DLSS5_Feed.fx` | Bundled with Feeder |
| Patched DLSS-NR (RTX 20/30/40/50) | `nvngx_dlssnr.dll` | RenoDX SF patched |
| NVIDIA Streamline DLLs | `nvngx_dlss.dll`, `nvngx_dlssg.dll`, `sl.common.dll`, `sl.dlss.dll`, `sl.dlss_g.dll`, `sl.dlss_nr.dll`, `sl.interposer.dll`, `sl.nis.dll`, `sl.pcl.dll`, `sl.reflex.dll` | RenoDX Streamline Files |
| License files | `nis.license.txt`, `nvngx_dlss.license.txt`, `reflex.license.txt` | Included for compliance |
| ReShade Configuration | `ReShade.ini` | Custom overlay style, key mappings, `DLSS5_MV_PROVIDER=3` |
| ReShade Preset | `ReshadePreset.ini` | Load order: Lumenite_Kernel → DLSS5_Feed |
| Lumenite Textures | `lumenite_bluenoise256.png` | [LumeniteFX](https://github.com/umar-afzaal/LumeniteFX) |
| Installer Music (optional) | `musicainstalador.mp3` | Custom installer music, compressed |
| Wizard Image | `fotoinstalador.bmp` | Custom installer background |

All files are placed automatically by the installer based on user choices. The installer also removes any conflicting add-on from a previous installation.

---

[Back to Home](./index.md) · [Requirements](./requirements.md) · [Known Issues & Fixes](./index.md#known-issues--fixes)
