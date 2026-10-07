-- ============================================================
-- ZEBU HYPRLAND CONFIG
-- Standalone configuration
-- Originally based on the default Hyprland Lua config
-- + HyprMod-generated settings
-- ============================================================

-- ============================================================
-- MATUGEN COLORS
-- ============================================================

local colors = dofile(os.getenv("HOME") .. "/.config/hypr/colors.lua")


-- ============================================================
-- MONITORS
-- ============================================================

hl.monitor({
    output   = "",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "1.20",
    cm       = "srgb",
})


-- ============================================================
-- PROGRAMS
-- ============================================================

local terminal    = "kitty"
local fileManager = "XDG_MENU_PREFIX=arch- dolphin"


-- ============================================================
-- ENVIRONMENT VARIABLES
-- ============================================================

hl.env("XCURSOR_THEME", "Win7Bulid-cursors")
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "18")


-- ============================================================
-- GENERAL / LOOK AND FEEL
-- ============================================================

hl.config({
    cursor = {
        hide_on_touch = false,
        no_hardware_cursors = 1,
    },

    general = {
        allow_tearing = true,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    colors.active_border_color,
                    colors.inactive_border_color,
                },
                angle = 90,
            },
        },

        gaps_in = 3,
        gaps_out = 5,

        layout = "dwindle",

        snap = {
            border_overlap = true,
            enabled = true,
            respect_gaps = true,
        },
    },

    decoration = {
        active_opacity = 1,
        inactive_opacity = 1,

        blur = {
            enabled = true,
            ignore_opacity = true,
            noise = 0.00,
            size = 8,
            passes = 3,
            xray = false,
        },

        rounding = 14,
        rounding_power = 2,

        shadow = {
            enabled = true,
        },
    },

    dwindle = {
        force_split = 2,
        smart_split = true,
        preserve_split = true,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        accel_profile = "flat",
        follow_mouse = 1,
        numlock_by_default = true,
        sensitivity = -0.25,

        touchpad = {
            natural_scroll = false,
        },
    },

    misc = {
        force_default_wallpaper = -1,

        disable_hyprland_logo = true,
        disable_splash_rendering = true,

        mouse_move_enables_dpms = false,

        vrr = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})


-- ============================================================
-- ANIMATIONS
-- ============================================================

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1}
    }
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1}
    }
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1}
    }
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1}
    }
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1}
    }
})

hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 238.1191,
    dampening = 24.21279333
})

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.2,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5.0,
    spring = "easy"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5.2,
    bezier = "easeOutQuint",
    style = "slide"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4.8,
    bezier = "easeInOutCubic",
    style = "slide"
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 4.8,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 4.2,
    bezier = "easeInOutCubic"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4.5,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4.8,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 5.0,
    bezier = "easeOutQuint",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 4.5,
    bezier = "easeInOutCubic",
    style = "fade"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 4.5,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 4.2,
    bezier = "easeInOutCubic"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4.8,
    bezier = "easeInOutCubic",
    style = "slidefade 35%"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 4.6,
    bezier = "easeOutQuint",
    style = "slidefade 35%"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 4.2,
    bezier = "easeInOutCubic",
    style = "slidefade 35%"
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 5.0,
    bezier = "easeOutQuint"
})


-- ============================================================
-- KEYBINDINGS
-- ============================================================

local mainMod = "SUPER"


-- Terminal
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)


-- Close window
hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)


-- Shutdown
hl.bind(
    mainMod .. " + End",
    hl.dsp.exec_cmd(
        "wlogout"
    )
)


-- Float window
hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({
        action = "toggle"
    })
)



-- Wallpaper switcher
hl.bind(
    mainMod .. " + W",
    hl.dsp.exec_cmd("$HOME/.local/bin/wallpaper-switcher")
)


-- App menu
hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd("rofi -show drun -theme $HOME/.config/rofi/matugen.rasi")
)


-- Pseudo
hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)


-- Fullscreen toggle (the game's own F11 doesn't work under XWayland)
hl.bind(
    mainMod .. " + F11",
    hl.dsp.window.fullscreen()
)


-- Toggle split
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)



-- Dolphin
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd("XDG_MENU_PREFIX=arch- dolphin")
)


-- Btop
hl.bind(
    mainMod .. " + ESCAPE",
    hl.dsp.exec_cmd("kitty -e btop")
)


-- Hyprlock
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)


-- Screenshot
hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        "mkdir -p \"$HOME/Pictures/Screenshots\"; f=\"$HOME/Pictures/Screenshots/screenshot-$(date +%F-%H%M%S).png\"; grim -g \"$(slurp)\" \"$f\" && wl-copy --type image/png < \"$f\""
    )
)


-- Move focus
hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


-- Workspaces
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i
        })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i
        })
    )
end


-- Special workspace
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic"
    })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({
        workspace = "e-1"
    })
)


-- Mouse window manipulation
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true
    }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true
    }
)


-- Volume
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- Media controls
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true
    }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true
    }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true
    }
)


-- ============================================================
-- AUTOSTART
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
end)


-- ============================================================
-- WINDOW RULES
-- ============================================================

local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*"
    },

    suppress_event = "maximize",
})


hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = true,
        pin        = false,
    },

    no_focus = true,
})


hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run"
    },

    move = "20 monitor_h-120",
    float = true,
})


hl.window_rule({
    match = { class = "Spotify" },
    opacity = 0.7,
})


-- MC 1.8.9 (LWJGL2/XWayland): F11 sets the game's own fullscreen flag
-- but no request ever reaches the compositor, so the window stays
-- dwindle-tiled below Waybar's reserved strip. Force real fullscreen
-- on launch -> covers 0,0 to full output and hides the bar.
-- NOTE: match.class is a REGEX that must match the WHOLE string
-- (no Lua %. escaping, and an anchor at the start alone is not enough:
--  "^CMCLIENT" never matched, "^CMCLIENT.*" does).
hl.window_rule({
    name = "mc-189-fullscreen",
    match = { class = "^CMCLIENT.*" },
    fullscreen = true,
})





hl.layer_rule({
    name = "blur-wlogout",
    match = { namespace = "logout_dialog" },
    blur = true,
    ignore_alpha = 0.3,
})

-- ============================================================
-- END
-- ============================================================