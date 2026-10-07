#!/usr/bin/env bash
set -e

RED='\033[0;31m'; GRN='\033[0;32m'; YLW='\033[1;33m'; NC='\033[0m'
ok()   { echo -e "${GRN}[OK]${NC} $1"; }
warn() { echo -e "${YLW}[WARN]${NC} $1"; }
bad()  { echo -e "${RED}[MISSING]${NC} $1"; }

echo "=== Zebu Rice installer ==="

# ---- package presence check ----
PACKAGES=(
  hyprland waybar kitty rofi wlogout hyprlock awww matugen
  cava fastfetch starship fish eza bat playerctl grim slurp
  dolphin btop wl-copy wpctl pactl sensors brightnessctl
  hyprpolkitagent
)

# command name -> Arch package name
declare -A PKGMAP=(
  [sensors]=lm_sensors
  [wl-copy]=wl-clipboard
  [wpctl]=wireplumber
  [pactl]=pipewire-pulse
  [dolphin]=dolphin
  [fish]=fish
)
MISSING=()
for p in "${PACKAGES[@]}"; do
  if command -v "$p" >/dev/null 2>&1 || \
     { [ "$p" = "wpctl" ] && command -v wpctl >/dev/null 2>&1; }; then
    ok "$p"
  else
    bad "$p"
    MISSING+=("$p")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo
  warn "Missing tools: ${MISSING[*]}"
  INSTALLER=""
  command -v yay >/dev/null 2>&1 && INSTALLER="yay"
  command -v paru >/dev/null 2>&1 && INSTALLER="paru"
  if [ -n "$INSTALLER" ]; then
    read -p "Install them with $INSTALLER? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      PKGLIST=()
      for m in "${MISSING[@]}"; do PKGLIST+=("${PKGMAP[$m]:-$m}"); done
      $INSTALLER -S --needed "${PKGLIST[@]}"
    fi
  else
    echo "No AUR helper found. On Arch install them with:"
    PKGLIST=()
    for m in "${MISSING[@]}"; do PKGLIST+=("${PKGMAP[$m]:-$m}"); done
    echo "  sudo pacman -S ${PKGLIST[*]}"
  fi
  echo
  read -p "Continue copying configs anyway? [y/N] " -n 1 -r
  echo
  [[ ! $REPLY =~ ^[Yy]$ ]] && exit 1
fi

# ---- fonts ----
if fc-list | grep -qi 'JetBrainsMono Nerd'; then
  ok "JetBrainsMono Nerd Font"
else
  warn "JetBrainsMono Nerd Font not found — install it for the correct look"
fi
if fc-list | grep -qi 'SF Pro Display'; then
  ok "SF Pro Display"
else
  warn "SF Pro Display not installed (used by Hyprlock; otherwise substitute the font)"
fi

# ---- copy configs ----
SRC="$(cd "$(dirname "$0")" && pwd)"

echo "Copying configs..."
cp -r "$SRC/.config/"* ~/.config/
mkdir -p ~/.local/bin
cp -r "$SRC/.local/bin/"* ~/.local/bin/
chmod +x ~/.local/bin/wallpaper-switcher

# seed wallpapers (won't overwrite existing ones)
if [ -d "$SRC/Pictures/Wallpapers" ]; then
  mkdir -p ~/Pictures
  cp -rn "$SRC/Pictures/Wallpapers" ~/Pictures/ 2>/dev/null || cp -r "$SRC/Pictures/Wallpapers" ~/Pictures/
fi
ok "Configs installed"

# ---- reload running things ----
if command -v hyprctl >/dev/null 2>&1; then
  hyprctl reload >/dev/null 2>&1 || true
fi

echo
echo "Done! Next steps:"
echo "  1. Wallpapers are already in ~/Pictures/Wallpapers (copied by the installer)"
echo "  2. Run ~/.local/bin/wallpaper-switcher once to set a wallpaper"
echo "     (this also generates colors for waybar/hyprland/kitty/etc.)"
echo "  3. Restart waybar if it's already running"
