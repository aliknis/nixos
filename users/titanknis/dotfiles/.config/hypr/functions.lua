-- workspace OSD
hl.on("workspace.active", function(ws)
	hl.exec_cmd("notify-send -a workspace " .. ws.id)
end)

-- kanata toggle
local function toggle_kanata()
	hl.exec_cmd([[
		if systemctl is-active --quiet kanata-default.service; then
			systemctl stop kanata-default.service
			notify-send -a stat 'Kanata off'
		else
			systemctl start kanata-default.service
			notify-send -a stat 'Kanata on'
		fi
	]])
end

-- touchpad toggle
local touchpad_enabled = true
local TOUCHPAD_NAME = "asup1200:00-093a:200a-touchpad"

local function toggle_touchpad()
	touchpad_enabled = not touchpad_enabled
	hl.device({ name = TOUCHPAD_NAME, enabled = touchpad_enabled })
	hl.exec_cmd("notify-send -a stat '" .. (touchpad_enabled and "touchpad on" or "touchpad off") .. "'")
end

-- Layout cycle
local function cycle_layout()
	local ws = hl.get_active_special_workspace() or hl.get_active_workspace()
	if not ws then
		return
	end
	local next = { master = "monocle", monocle = "master" }
	hl.workspace_rule({ workspace = ws.name, layout = next[ws.tiled_layout] })
end

-- Per layout bindings
local function layout_bind(bind_table)
	return function()
		local ws = hl.get_active_special_workspace() or hl.get_active_workspace()
		if not ws then
			return
		end
		local layout = ws.tiled_layout
		if bind_table[layout] then
			hl.dispatch(bind_table[layout])
		end
	end
end

-- Status info OSD
local function status_info()
	hl.exec_cmd("~/.config/hypr/scripts/status.sh")
end

-- Volume OSD
local function volume_osd(dir)
	local actions = {
		up = "set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
		down = "set-volume @DEFAULT_AUDIO_SINK@ 5%-",
		mute = "set-mute @DEFAULT_AUDIO_SINK@ toggle",
	}
	return function()
		hl.exec_cmd("wpctl " .. actions[dir] .. ' && notify-send -a stat "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"')
	end
end

-- Mic mute OSD
local function mic_mute_osd()
	hl.exec_cmd(
		[[wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send -a stat "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{if(index($0,"MUTED")) print "\xef\x84\xb1  Mic muted"; else print "\xef\x84\xb0  Mic on"}')"]]
	)
end

-- Brightness OSD
local function brightness_osd(dir)
	local d
	if dir == "up" then
		d = "set 5%+"
	else
		d = "set 5%-"
	end
	return function()
		hl.exec_cmd(
			[[brightnessctl -e4 -n2 ]]
				.. d
				.. [[ && notify-send -a stat "brightness $(brightnessctl -m | awk -F',' '{printf "%.2f", $3/$5}')"]]
		)
	end
end

-- Workspace overview
return {
	toggle_kanata = toggle_kanata,
	toggle_touchpad = toggle_touchpad,
	cycle_layout = cycle_layout,
	layout_bind = layout_bind,
	status_info = status_info,
	volume_osd = volume_osd,
	mic_mute_osd = mic_mute_osd,
	brightness_osd = brightness_osd,
}
