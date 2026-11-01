-- csvview.lua
return {
	"hat0uma/csvview.nvim",
	---@module "csvview"
	---@type CsvView.Options
	opts = {
		-- parser = { comments = { "#", "//" } },
		parser = {
			comments = { "#", "//" },
			delimiter = function(buf)
				if vim.api.nvim_buf_get_name(buf):match("%.tsv$") then
					return "\t"
				end
				local l = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""
				return select(2, l:gsub(";", "")) > select(2, l:gsub(",", "")) and ";" or ","
			end,
		},
		-- keymaps etc. unchanged
		keymaps = {
			-- Text objects for selecting fields
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			-- Excel-like navigation:
			-- Use <Tab> and <S-Tab> to move horizontally between fields.
			-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
			-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
			jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
	},
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle", "CsvViewInfo" },
	ft = "csv,tsv",
	-- lazy = false,
	keys = {
		{ "<leader>cc", "<cmd>CsvViewToggle display_mode=border<cr>", desc = "Toggle CsvView mode" },
		{ "<leader>cb", "<cmd>CsvViewEnable display_mode=border<cr>", desc = "Enable CsvView border" },
		{ "<leader>c;", "<cmd>CsvViewToggle delimiter=;<cr>", desc = "Set CsvView delimiter to ;" },
		{ "<leader>c,", "<cmd>CsvViewToggle delimiter=,<cr>", desc = "Set CsvView delimiter to ," },
		{ "<leader>ci", "<cmd>CsvViewInfo<cr>", desc = "Show CsvView info" },
	},
}
