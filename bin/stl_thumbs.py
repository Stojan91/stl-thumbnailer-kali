#!/usr/bin/env python3
import subprocess
from pathlib import Path
import sys

IMG_SIZE = "512,512"
VIEW_SCAD = Path.home() / ".config/stl_thumb/view.scad"

def generate_png(stl_path: Path):
    png_path = stl_path.with_suffix(stl_path.suffix + ".png")
    try:
        if png_path.exists() and png_path.stat().st_mtime >= stl_path.stat().st_mtime:
            return

        cmd = [
            "openscad",
            "-o", str(png_path),
            f"--imgsize={IMG_SIZE}",
            "--projection=perspective",
            "-D", f'file="{stl_path}"',
            str(VIEW_SCAD),
        ]

        print(f"[INFO] render: {stl_path} -> {png_path}")
        subprocess.run(cmd, check=True)
    except Exception as e:
        print(f"[WARN] problem z {stl_path}: {e}")

def walk_and_render(base: Path):
    for stl in base.rglob("*.stl"):
        generate_png(stl)

if __name__ == "__main__":
    if len(sys.argv) == 2:
        stl = Path(sys.argv[1])
        if stl.is_file():
            generate_png(stl)
        else:
            print(f"[ERROR] {stl} nie jest plikiem")
    else:
        base = Path.home() / "Pobrane"
        if not base.exists():
            print(f"[ERROR] katalog {base} nie istnieje")
        else:
            walk_and_render(base)
