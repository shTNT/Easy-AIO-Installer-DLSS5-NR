# Easy AIO Installer: DLSS 5 + RenoDX + Lumenite ReShade Pack v2.1

**by Kry0genik**  
[![Nexus Mods](https://img.shields.io/badge/Nexus%20Mods-DLSS%205%20AIO-blue)](https://www.nexusmods.com/site/mods/2251)  
[![GitHub Pages](https://img.shields.io/badge/Docs-GitHub%20Pages-green)](https://shTNT.github.io/Easy-AIO-Installer-DLSS5-NR/)  
[![GitHub release](https://img.shields.io/github/v/release/shTNT/Easy-AIO-Installer-DLSS5-NR)](https://github.com/shTNT/Easy-AIO-Installer-DLSS5-NR/releases)  
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](LICENSE)

> A hassle-free installer that automates the installation of DLSS 5 Neural Rendering (NR) into your game folder. No manual file hunting, no complex guides. Everything is pre-configured and ready to use.

---

## Contents

- [Requirements](#requirements)
- [File Index & Sources](#file-index--sources)
- [Known Issues](#known-issues--fixes)
- [Installation](#installation-steps)
- [In-Game Controls](#in-game-controls)
- [Adjusting Neural Rendering](#adjusting-neural-rendering)
- [Transparency](#transparency)
- [Disclaimer](#disclaimer)

---

## Requirements

- ReShade 6.8.0+ with **Full Add-on Support** installed in the game folder.
- A game with a working depth buffer.
- NVIDIA RTX 20/30/40/50 series GPU (RTX 30+ recommended).
- Latest NVIDIA drivers.
- Single-player games (anti-cheat may block injection).

---

## File Index & Sources

| Component | File(s) | Version / Source |
|-----------|---------|------------------|
| DLSS 5 Neural Rendering Add-on | `renodx-dlss5.addon64` | v4.7 (not ShortFuse's mod) |
| Lumenite Motion Vectors | `lumenite_Kernel.fx` + includes | [LumeniteFX](https://github.com/umar-afzaal/LumeniteFX) |
| DLSS5 Bridge (native DLSS) | `dlss5-dx11-bridge.addon64` | v1.4.1 – [NIGos/dlss5-bridge](https://github.com/NIGos/dlss5-bridge/releases/tag/v1.4.1) |
| DLSS5 Feeder (non-native DLSS) | `dlss5-feed.addon64` | v0.11.0-beta.2 – [jlrouzies-fr/DLSS5-Feeder](https://github.com/jlrouzies-fr/DLSS5-Feeder/releases/tag/v0.11.0-beta.2) |
| DLSS5 Feed Shader | `DLSS5_Feed.fx` | Bundled with Feeder |
| Patched DLSS-NR | `nvngx_dlssnr.dll` | RenoDX SF patched |
| NVIDIA Streamline DLLs | `nvngx_dlss.dll`, `nvngx_dlssg.dll`, ... | RenoDX Streamline Files |
| ReShade Configuration | `ReShade.ini` | `DLSS5_MV_PROVIDER=3` |
| ReShade Preset | `ReshadePreset.ini` | Load order: Lumenite_Kernel → DLSS5_Feed |
| Lumenite Textures | `lumenite_bluenoise256.png` | LumeniteFX |
| Installer Music | `musicainstalador.mp3` | Custom |
| Wizard Image | `fotoinstalador.bmp` | Custom |

---

## Known Issues & Fixes

See the full guide on the [documentation site](https://shTNT.github.io/Easy-AIO-Installer-DLSS5-NR/).

---

## Installation Steps

1. Download the installer: `EasyAIO_DLSS5_Lumenite_v2.1_Setup.exe`.
2. Run it.
3. Select the game folder (where the main `.exe` is located).
4. Confirm you have ReShade with add-on support (if not, it will open the official site).
5. Choose the correct option:
   - **[YES]** = Game has Native DLSS → installs `dlss5-dx11-bridge.addon64`
   - **[NO]** = Game does NOT have Native DLSS → installs `dlss5-feed.addon64`
6. Wait for the installation to finish (a chime will sound).
7. Launch the game. Neural Rendering is active by default.

---

## In-Game Controls

- **HOME** – Open/close ReShade overlay
- **DEL** – Toggle all effects ON/OFF
- **PRINT SCREEN** – Take a screenshot (saved in `.\ReShade Screenshots`)

---

## Adjusting Neural Rendering

1. Open the overlay with **HOME**.
2. Go to the **Add-ons** tab.
3. Find **DLSS 5 Neural Rendering**.
4. Use the **NR Intensity** slider to increase or decrease the effect.
5. If sliders are greyed out, adjust the color channel sliders.

---

## Transparency

- Full installer source code is included in this repository.
- File tree and file index are provided.
- The installer only uses publicly available patched NVIDIA DLLs and ReShade files.

---

## Disclaimer

Your antivirus will probably flag this installer.  
That's normal – it contains DLL injection and ReShade add-ons.  
Use [innoextract](https://constexpr.org/innoextract/) to inspect the files yourself.

This installer is free to distribute, modify, and share without restriction.  
Use it at your own risk. The author is not responsible for any damage, multiplayer bans, or unexpected behavior.  
If your PC explodes, that's on you. Enjoy the pack responsibly.
