---@module 'hl'

local terminal = "foot"
local wsaction = "~/.config/hypr/scripts/wsaction.fish"

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
	name = "workspace_special",
	match = {
		match = "class org.keepassxc.KeePassXC",
	},
	workspace = "special",
})

--## Workspaces ###

hl.workspace_rule({
	workspace = 1,
	monitor = "DP-3",
	is_default = true,
})

hl.workspace_rule({
	workspace = 2,
	monitor = "DP-3",
})

hl.workspace_rule({
	workspace = 3,
	monitor = "HDMI-A-1",
	is_default = true,
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
		kb_layout = { "eu", "es" },
		-- eu => eurkey
		kb_options = "grp:alt_shift_toggle",
	},
})

-- No anims!!

hl.animation({ leaf = "workspaces", enabled = false, speed = 1, bezier = "specialWorkSwitch", style = 0 })

-- Binds

hl.unbind("Super" .. " + " .. "C")

hl.bind("Super" .. " + " .. "Return", hl.dsp.exec_cmd(terminal))

hl.bind("Super" .. " + " .. "C", hl.dsp.window.close())

-- Move window to workspace (Super+Shift+X)

hl.bind("Super+Shift" .. " + " .. 1, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 1"))

hl.bind("Super+Shift" .. " + " .. 2, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 2"))

hl.bind("Super+Shift" .. " + " .. 3, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 3"))

hl.bind("Super+Shift" .. " + " .. 4, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 4"))

hl.bind("Super+Shift" .. " + " .. 5, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 5"))

hl.bind("Super+Shift" .. " + " .. 6, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 6"))

hl.bind("Super+Shift" .. " + " .. 7, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 7"))

hl.bind("Super+Shift" .. " + " .. 8, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 8"))

hl.bind("Super+Shift" .. " + " .. 9, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 9"))

hl.bind("Super+Shift" .. " + " .. 0, hl.dsp.exec_cmd(wsaction .. " movetoworkspace 10"))

--## General config ###

hl.config({
	general = {
		border_size = 2,
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

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("vesktop")
	hl.exec_cmd("keepassxc")
	hl.exec_cmd("gpu-screen-recorder")
	hl.exec_cmd("otd-daemon")
end)
