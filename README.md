<img width="800" height="967" alt="thubkali" src="https://github.com/user-attachments/assets/0b7c3742-2c6b-4eea-9237-c3abad88d842" />
# stl-thumbnailer-kali

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
