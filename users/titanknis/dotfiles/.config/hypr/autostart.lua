-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	-- System Services
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- System Tray
	-- hl.exec_cmd("waybar")
	hl.exec_cmd("batsignal -b -w 30 -c 15")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("blueman-applet")

	-- Clipboard Manager
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- User Scripts
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img ~/Pictures/Wallpapers/i-touch-this.jpg") -- now i prefer a static wallpaper
	-- hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh") -- Random wallpaper(got bored of it)
end)
