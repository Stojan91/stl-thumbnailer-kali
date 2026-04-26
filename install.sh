#!/usr/bin/env bash
set -e

USER_HOME="$HOME"
SCRIPTS_DIR="$USER_HOME/scripts"
CONFIG_DIR="$USER_HOME/.config/stl_thumb"

echo "[*] Instalacja zależności (openscad, tumbler)..."
sudo apt update
sudo apt install -y openscad tumbler

echo "[*] Kopiowanie skryptu Pythona do $SCRIPTS_DIR..."
mkdir -p "$SCRIPTS_DIR"
cp bin/stl_thumbs.py "$SCRIPTS_DIR/"
chmod +x "$SCRIPTS_DIR/stl_thumbs.py"

echo "[*] Kopiowanie view.scad do $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR"
cp config/view.scad "$CONFIG_DIR/"

echo "[*] Tworzenie thumbnailera /usr/share/thumbnailers/stl-thumb.thumbnailer..."
sudo tee /usr/share/thumbnailers/stl-thumb.thumbnailer >/dev/null <<EOF
[Thumbnailer Entry]
TryExec=$SCRIPTS_DIR/stl_thumbs.py
Exec=$SCRIPTS_DIR/stl_thumbs.py %i
MimeType=model/stl;model/x.stl-ascii;model/x.stl-binary;application/sla;
EOF

echo "[*] Konfiguracja Tumblera w /etc/xdg/tumbler/tumbler.rc..."
if ! grep -q "^\[STL-Thumbnailer\]" /etc/xdg/tumbler/tumbler.rc 2>/dev/null; then
  sudo tee -a /etc/xdg/tumbler/tumbler.rc >/dev/null <<EOF

[STL-Thumbnailer]
Disabled=false
Priority=1
Locations=
MaxFileSize=2147483648
EOF
else
  echo "    [INFO] Sekcja STL-Thumbnailer już istnieje – pomijam."
fi

echo "[*] Restart tumblerd..."
pkill -f tumblerd || true

echo "[*] Gotowe. Upewnij się w Thunarze, że włączone są miniatury (Preferencje -> Wyświetlanie)."
echo "[*] Wejdź do folderu z .stl i poczekaj na generowanie podglądów."
