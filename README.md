<img width="800" height="967" alt="thubkali" src="https://github.com/user-attachments/assets/0b7c3742-2c6b-4eea-9237-c3abad88d842" />
# stl-thumbnailer-kali
Below is a clearer, more compact README in English.

***

# STL Thumbnails for Thunar (Kali / XFCE)

Small helper that generates thumbnails for `.stl` 3D models in Thunar using OpenSCAD and Tumbler.

## Features

- Renders `.stl` files to PNG previews via OpenSCAD  
- Integrates with XFCE Tumbler, so Thunar shows thumbnails instead of generic icons  
- Includes one‑shot installer script for Kali / XFCE

***

## Installation

```bash
git clone https://github.com/<your_user>/stl-thumbnailer-kali.git
cd stl-thumbnailer-kali
./install.sh
```

The installer will:

- install `openscad` and `tumbler` (if missing)  
- copy `stl_thumbs.py` to `~/scripts`  
- copy `view.scad` to `~/.config/stl_thumb/`  
- create `/usr/share/thumbnailers/stl-thumb.thumbnailer`  
- add an `[STL-Thumbnailer]` section to `/etc/xdg/tumbler/tumbler.rc`  
- restart the thumbnailing service

***

## Usage

After installation:

1. Open Thunar.  
2. In **Edit → Preferences → Display**, set **Show thumbnails** to *Always* or *Only for local files*.  
3. Navigate to any folder with `.stl` files and wait a moment for thumbnails to be generated.

***

## Manual commands

Generate thumbnails for all `.stl` files under `~/Pobrane`:

```bash
~/scripts/stl_thumbs.py
```

Generate or refresh a thumbnail for a single file:

```bash
~/scripts/stl_thumbs.py /path/to/model.stl
```

***

## Notes

- Rendering many large models can take some time on slower machines.  
- If thumbnails do not appear, try restarting Thunar and the thumbnailing daemon, then re‑open the folder with `.stl` files.


-----------------------------------------------------------------------------------------

Automatyczne miniatury plików STL w Thunarze (Kali / XFCE) z użyciem OpenSCAD.

## Instalacja

```bash
git clone https://github.com/<twoje_user>/stl-thumbnailer-kali.git
cd stl-thumbnailer-kali
./install.sh
```

Skrypt:
- instaluje `openscad` i `tumbler`,
- kopiuje `stl_thumbs.py` do `~/scripts`,
- kopiuje `view.scad` do `~/.config/stl_thumb/`,
- tworzy `/usr/share/thumbnailers/stl-thumb.thumbnailer`,
- dodaje sekcję `[STL-Thumbnailer]` do `/etc/xdg/tumbler/tumbler.rc`,
- restartuje usługę `tumblerd`.

Po instalacji:
- w Thunarze ustaw `Pokaż miniatury` na `Zawsze` lub `Tylko lokalne pliki`,
- wejdź do katalogu z `.stl` i poczekaj na wygenerowanie miniaturek.

## Ręczne użycie skryptu

Pełny przebieg po `~/Pobrane`:

```bash
~/scripts/stl_thumbs.py
```

Miniatura dla pojedynczego pliku:

```bash
~/scripts/stl_thumbs.py /ścieżka/do/modelu.stl
```
