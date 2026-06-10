-- input {
--     repeat_rate = 40
--     repeat_delay = 600
-- }

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		-- kb_layout  = "us,us,fr,ara",
		kb_layout = "us,ara",
		kb_variant = "colemak_dh",
		kb_options = "grp:win_space_toggle,numpad:pc", -- kb_model   = "lv3:ralt_alt,grp:win_space_toggle,numpad:pc",
		kb_model = "",
		kb_rules = "",

		numlock_by_default = true,

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})
