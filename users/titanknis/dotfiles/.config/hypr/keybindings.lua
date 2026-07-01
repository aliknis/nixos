local fn = require("functions")

-------------------
---- modifiers ----
-------------------

local mainMod = "SUPER"
local submod = "ALT"

---------------------
---- my programs ----
---------------------

local terminal = "kitty"
local fileManager = "yazi"
local browser = "qutebrowser"

---------------
---- menus ----
---------------

local menu = "rofi -show drun"
local window = "rofi -show window"
local calc = "rofi -show calc -p '󱖦' -no-show-match -no-sort -calc-command 'wtype '{result}' && wl-copy {result}'"
local powermenu = "~/.config/hypr/scripts/powerMenu.sh"
local networkmenu = "~/.config/hypr/scripts/networkMenu.sh"
local emojimenu = "~/.config/hypr/scripts/emojiMenu.sh"
local wallpapermenu = "~/.config/hypr/scripts/wallpaperMenu.sh"

-----------------
---- actions ----
-----------------

local lockscreen = "hyprlock"
local screenshot =
	"mkdir -p ~/Pictures/screenshots ; grim - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d_%Hh%Mm%Ss).png | wl-copy --type image/png"
local screencapture =
	'mkdir -p ~/Pictures/screenshots ; grim -g "$(slurp)" - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d_%Hh%Mm%Ss)_slurp.png | wl-copy --type image/png'
local earphones =
	"bluetoothctl info 54:84:50:E3:2D:90 | grep -q 'Connected: yes' && bluetoothctl disconnect 54:84:50:E3:2D:90 || bluetoothctl connect 54:84:50:E3:2D:90"
local extracttext = 'grim -g "$(slurp)" - | tesseract stdin stdout | wl-copy'

-------------------------
---- system controls ----
-------------------------

hl.bind(mainMod .. " + delete", hl.dsp.exit())
hl.bind("CTRL + ALT + delete", hl.dsp.exec_cmd("shutdown now"))
hl.bind("CTRL + ALT + k", fn.toggle_kanata)
-- hl.bind(submod .. " + k", fn.toggle_touchpad)
hl.bind(mainMod .. " + h", hl.dsp.exec_cmd("systemctl hibernate"), { locked = true })
hl.bind(mainMod .. " + l", hl.dsp.exec_cmd(lockscreen))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(lockscreen), { locked = true })

hl.bind(mainMod .. " + t", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + y", hl.dsp.exec_cmd(terminal .. " " .. fileManager))
hl.bind(mainMod .. " + f", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind(mainMod .. " + k", hl.dsp.exec_cmd("pkill keepassxc || keepassxc"))
hl.bind(submod .. " + k", hl.dsp.exec_cmd("pkill keepassxc || keepassxc"))
hl.bind(submod .. " + s", hl.dsp.exec_cmd("~/.config/hypr/scripts/status.sh"), { repeating = true })
hl.bind(submod .. " + m", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(submod .. " + b", hl.dsp.exec_cmd(earphones))
hl.bind(submod .. " + SHIFT + r", hl.dsp.exec_cmd("timeout 2s bash ~/.config/hypr/scripts/wallpaper.sh"))

--------------------
---- rofi menus ----
--------------------

hl.bind(submod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || " .. menu))
hl.bind(submod .. " + q", hl.dsp.exec_cmd("pkill rofi || " .. calc))
hl.bind(submod .. " + w", hl.dsp.exec_cmd("pkill rofi || " .. window))
hl.bind(submod .. " + e", hl.dsp.exec_cmd("pkill rofi || " .. emojimenu))
hl.bind(submod .. " + backspace", hl.dsp.exec_cmd("pkill rofi || " .. powermenu))
hl.bind(submod .. " + d", hl.dsp.exec_cmd("pkill rofi || " .. networkmenu))
hl.bind(mainMod .. " + d", hl.dsp.exec_cmd("pkill rofi || " .. networkmenu))
hl.bind(submod .. " + r", hl.dsp.exec_cmd("pkill rofi || " .. wallpapermenu))
hl.bind(
	submod .. " + v",
	hl.dsp.exec_cmd("pkill rofi || cliphist list | rofi -dmenu -p ' ' | cliphist decode | wl-copy")
)
hl.bind(
	mainMod .. " + v",
	hl.dsp.exec_cmd("pkill rofi || cliphist list | rofi -dmenu -p ' ' | cliphist decode | wl-copy")
)

------------------------
---- screen capture ----
------------------------

hl.bind(mainMod .. " + print", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + SHIFT + x", hl.dsp.exec_cmd(extracttext))
hl.bind(mainMod .. " + SHIFT + c", hl.dsp.exec_cmd(screencapture))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("hyprpicker -a"))

-------------------------
---- window controls ----
-------------------------

hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind("ALT + f4", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + m", hl.dsp.window.fullscreen())
-- hl.bind(mainMod .. " + m", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + w", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + p", hl.dsp.window.pin())
hl.bind(mainMod .. " + SHIFT + f", hl.dsp.focus({ window = "floating" }))
hl.bind(submod .. " + SHIFT + p", hl.dsp.window.pseudo())

----------------------
---- window focus ----
----------------------

hl.bind(mainMod .. " + n", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + i", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + u", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + e", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next({ prev = true }))

-----------------------
---- window resize ----
-----------------------

hl.bind(submod .. " + CTRL + i", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + n", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + u", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + e", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(submod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

---------------------
---- window move ----
---------------------

hl.bind(mainMod .. " + CTRL + i", hl.dsp.window.move({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + n", hl.dsp.window.move({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + u", hl.dsp.window.move({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + e", hl.dsp.window.move({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ x = 0, y = 30, relative = true }), { repeating = true })

-------------------------------
---- mouse window controls ----
-------------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------------
---- layout controls ----
-------------------------

hl.bind(mainMod .. " + m", fn.cycle_layout)
hl.bind(
	mainMod .. " + o",
	fn.layout_bind({
		monocle = hl.dsp.layout("cycleprev"),
		master = hl.dsp.layout("swapwithmaster master"),
	})
)
hl.bind(mainMod .. " + r", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + SHIFT + u", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + e", hl.dsp.window.swap({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + SHIFT + y", hl.dsp.layout("removemaster"))
hl.bind(submod .. " + SHIFT + i", hl.dsp.layout("mfact +0.05"), { repeating = true })
hl.bind(submod .. " + SHIFT + n", hl.dsp.layout("mfact -0.05"), { repeating = true })

------------------------------
---- workspace management ----
------------------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(submod .. " + i", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(submod .. " + n", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(submod .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(submod .. " + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(submod .. " + u", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + SHIFT + i", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + s", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }))

------------------------
---- group controls ----
------------------------

hl.bind(mainMod .. " + g", hl.dsp.group.toggle())
hl.bind(submod .. " + CTRL + n", hl.dsp.group.prev())
hl.bind(submod .. " + CTRL + i", hl.dsp.group.next())
hl.bind(submod .. " + CTRL + left", hl.dsp.group.prev())
hl.bind(submod .. " + CTRL + right", hl.dsp.group.next())

---------------------------
---- hardware controls ----
---------------------------

hl.bind("XF86AudioRaiseVolume", fn.volume_osd("up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", fn.volume_osd("down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", fn.volume_osd("mute"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", fn.mic_mute_osd, { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", fn.brightness_osd("up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", fn.brightness_osd("down"), { locked = true, repeating = true })
hl.bind("CTRL + SHIFT + XF86MonBrightnessUp", fn.temperature_osd("up"), { locked = true, repeating = true })
hl.bind("CTRL + SHIFT + XF86MonBrightnessDown", fn.temperature_osd("down"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessUp", fn.temperature_osd("temperature 4000"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessDown", fn.temperature_osd("identity"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

------------------
---- gestures ----
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special", param = "magic" })
