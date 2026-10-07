# Zebu Rice™

Hyprland + Waybar + Kitty + Rofi + Wlogout + Hyprlock + Matugen-rice.

## Install (Arch)

```bash
git clone <repo-url> zebu-rice
cd zebu-rice
./install.sh
```

The installer will:
1. Check which dependencies you're missing and offer to install them (`yay`/`paru`/`pacman`)
2. Copy all configs into `~/.config` and `~/.local/bin`
3. Copy the included wallpapers into `~/Pictures/Wallpapers` (won't overwrite existing)
4. Reload Hyprland

After it finishes:
1. Press `SUPER+W` to open the wallpaper switcher and pick a wallpaper — this generates all the colors
2. Restart waybar / kitty / cava if they were open
3. Run `fastfetch` for the full effect 🎉

Wallpapers are included in the package and get copied to `~/Pictures/Wallpapers`.

It checks for dependencies, copies the configs into `~/.config` and `~/.local/bin`,
then tells you what to do next.

### Required packages

`hyprland waybar kitty rofi wlogout hyprlock awww matugen cava fastfetch starship fish eza bat playerctl grim slurp wl-copy wireplumber/wpctl pipewire/pulseaudio-utils lm_sensors brightnessctl hyprpolkitagent`

### Fonts

- **JetBrainsMono Nerd Font** (everything)
- **SF Pro Display** (Hyprlock — optional, can substitute)

## Shortcuts

| Key | Action |
|---|---|
| `SUPER+Q` | Terminal (kitty) |
| `SUPER+C` | Close window |
| `SUPER+V` | Toggle float |
| `SUPER+J` | Toggle split |
| `SUPER+F11` | Fullscreen |
| `SUPER+P` | Pseudotile |
| `SUPER+SPACE` | App launcher (rofi) |
| `SUPER+W` | Wallpaper switcher |
| `SUPER+L` | Lock (hyprlock) |
| `SUPER+End` | Logout menu (wlogout) |
| `SUPER+E` | Dolphin |
| `SUPER+ESC` | btop |
| `SUPER+S` | Special workspace |
| `SUPER+SHIFT+S` | Send window to special workspace |
| `SUPER+<num>` / `SUPER+SHIFT+<num>` | Switch workspace / move window |
| `SUPER+arrows` | Move focus |
| `Print` | Screenshot (region, saved + copied) |
| Media keys | Volume / brightness / playback |
| `SUPER+mouse:272` (drag) / `SUPER+mouse:273` (resize) | Move/resize floating windows |
| `SUPER+mouse_up` | Previous workspace |

## Dependencies

| Package | What it does |
|---|---|
| hyprland | Compositor + WM |
| waybar | Status bar |
| kitty | Terminal |
| rofi | App launcher + wallpaper picker |
| wlogout | Logout menu |
| hyprlock | Lock screen |
| awww | Wallpaper daemon |
| matugen | Generates all the colors from the wallpaper |
| cava | Audio visualizer |
| fastfetch | System info on terminal start |
| starship | Shell prompt |
| fish | Shell |
| eza | Modern `ls` (Fish aliases) |
| bat | Modern `cat` (Fish alias) |
| dolphin | File manager |
| btop | System monitor |
| playerctl | Media key control + hyprlock song widget |
| grim | Screenshots |
| slurp | Screen region select |
| wl-copy | Clipboard |
| wl-clipboard | Clipboard tools |
| wireplumber / pipewire-pulse | wpctl / pactl for the waybar audio module |
| lm_sensors | CPU/GPU temp for waybar |
| brightnessctl | Media-key brightness |
| hyprpolkitagent | Polkit agent |

`install.sh` checks for all of these and can install the missing ones for you (Arch + yay).

## How colors flow

```
rofi wallpaper-picker → awww sets wallpaper → matugen regenerates colors
  → waybar/colors.css, hypr/colors.lua, kitty/themes/Matugen.conf,
    cava/themes/matugen, starship.toml, fastfetch/config.jsonc, rofi/*.rasi
  → hyprctl reload + kitty reload + cava SIGUSR2
  → hyprlock.conf wallpaper path gets updated too
```

To start fresh: `~/.local/bin/wallpaper-switcher`

## Things you may need to tweak

- `hypr/hyprland.lua`: monitor mode (`1920x1080@60`, scale `1.20`) and the `Win7Bulid-cursors` cursor theme
- `waybar/config.jsonc`: temp sensor labels (`Package id 0` etc.) already made generic
- `hypr/hyprlock.conf`: SF Pro fonts + wallpaper path (auto-updated by the switcher)
