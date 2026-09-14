--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- NOTE: my rules

-- Floating Windows
hl.window_rule({ match = { class = "^.*blueman.*$" }, float = true })
hl.window_rule({ match = { class = "^org.keepassxc.KeePassXC$" }, float = true, size = "1000 700" })
-- hl.window_rule({ match = { class = "^.*KeePass.*$" }, float = true, center = true })
hl.window_rule({ match = { class = "^org.pulseaudio.pavucontrol$" }, float = true })

-- Display/Image Viewer
hl.window_rule({ match = { class = "^Display$" }, float = true, center = true, pin = true })

-- Media Player
hl.window_rule({ match = { class = "^mpv$" }, fullscreen = true })
hl.window_rule({ match = { class = "^imv$" }, fullscreen = true })
hl.window_rule({ match = { class = "^.*zathura$" }, fullscreen = true })

-- File Chooser
hl.window_rule({ match = { title = "^termfilechooser$" }, float = true, size = "1000 700" })
-- windowrule = size 1000 700, match:title ^termfilechooser$
