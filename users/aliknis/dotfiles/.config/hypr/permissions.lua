-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission("/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim", "screencopy", "allow")
hl.permission("/nix/store/[a-z0-9]{32}-hyprlock-[0-9.]*/bin/hyprlock", "screencopy", "allow")
hl.permission(
	"/nix/store/[a-z0-9]{32}-xdg-desktop-portal-hyprland-[0-9.]*/libexec/.xdg-desktop-portal-hyprland-wrapped",
	"screencopy",
	"allow"
)
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
