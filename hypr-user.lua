---@module 'hl'

local terminal = "foot"

--## Monitors ###

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@165",
    position = "0x360",
    scale = 1,
})

-- Primary

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@165",
    position = "1920x0",
    scale = 1,
})

--## Execs ###

--## Window rules ###

hl.window_rule({
    match = { class = "org.keepassxc.KeePassXC" },
    workspace = "special",
})

--## Workspaces ###

hl.workspace_rule({
    workspace = 1,
    monitor = "DP-3",
    default = true,
})

hl.workspace_rule({
    workspace = 2,
    monitor = "DP-3",
})

hl.workspace_rule({
    workspace = 3,
    monitor = "HDMI-A-1",
    default = true,
})

hl.workspace_rule({
    workspace = "4-10",
    monitor = "HDMI-A-1",
})

--## Mouse ###

hl.config({
    input = {
        sensitivity = 0.0000,
        force_no_accel = true,
        accel_profile = "flat",
        kb_layout = "eu,es",
        -- eu => eurkey
        kb_options = "grp:alt_shift_toggle",
    },
})

-- No anims!!

hl.animation({ leaf = "workspaces", enabled = false, speed = 1, bezier = "specialWorkSwitch", style = "none" })

-- Binds

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))

-- Move window to workspace (Super+Shift+N)
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + SHIFT + " .. key, function()
        hl.dispatch(hl.dsp.window.move({ workspace = i }))
    end)
end

--## General config ###

hl.config({
    general = {
        border_size = 2,
        col = {
            active_border = "rgb(8ad6b7)",
            inactive_border = "rgba(8ad6b715)",
        },
    },
})

hl.config({
    misc = {
        vrr = 1,
    },
})

hl.config({
    debug = {
        full_cm_proto = true,
        error_position = 1,
        vfr = false,
    },
})

hl.device({
    name = "opentabletdriver-virtual-artist-tablet",
    output = "DP-3",
})

--## Gaming ###

-- windowrule = workspace 1 silent, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = no_anim on, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = no_blur on, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = no_shadow on, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = border_size 0, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = rounding 0, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = suppress_event fullscreen, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- windowrule = sync_fullscreen on, match:class ^(steam_app_.*|lutris_game_class|minigalaxy|playnite_game_class|gamescope|chiaki|moonlight|com\.moonlight_stream\.Moonlight|.*[Ww]ine.*)$

-- Browser
hl.unbind("SUPER + W")
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"))

-- GitHub Desktop
hl.bind("SUPER + G", hl.dsp.exec_cmd("github-desktop"))

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("vesktop")
    hl.exec_cmd("keepassxc")
    hl.exec_cmd("gpu-screen-recorder")
    hl.exec_cmd("otd-daemon")
end)

-- Fix cursor on reload (hyprland.start solo en first-start, no en hyprctl reload)
hl.on("config.reloaded", function()
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic")
end)
