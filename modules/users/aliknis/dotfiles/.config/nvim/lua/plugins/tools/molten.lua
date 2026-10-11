-- molten.lua
--
return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	dependencies = {
		{
			"3rd/image.nvim",
			opts = {
				backend = "kitty",
				-- use the ImageMagick CLI (`magick`) instead of the magick Lua rock
				processor = "magick_cli",
				max_width = 100,
				max_height = 12,
				max_height_window_percentage = math.huge,
				max_width_window_percentage = math.huge,
				window_overlap_clear_enabled = true,
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			},
		},
	},
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_auto_open_output = false
		vim.g.molten_output_win_max_height = 20
	end,
	config = function()
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = "Molten: " .. desc })
		end

		map("n", "<localleader>mi", ":MoltenInit<CR>", "init kernel")
		map("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", "run line")
		map("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", "run selection")
		map("n", "<localleader>rc", "vip:<C-u>MoltenEvaluateVisual<CR>gv<Esc>", "run cell (paragraph)")
		map("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", "re-run cell")
		map("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", "show / enter output")
		map("n", "<localleader>oh", ":MoltenHideOutput<CR>", "hide output")
		map("n", "<localleader>oi", ":MoltenImagePopup<CR>", "open image in popup")
		map("n", "<localleader>mn", ":MoltenNext<CR>", "next cell")
		map("n", "<localleader>mp", ":MoltenPrev<CR>", "previous cell")

		-- Auto-start the python3 kernel when a notebook is opened (once per buffer)
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "*.ipynb",
			group = vim.api.nvim_create_augroup("MoltenAutoInit", { clear = true }),
			callback = function(args)
				if vim.b[args.buf].molten_autoinit_done then
					return
				end
				vim.b[args.buf].molten_autoinit_done = true
				vim.schedule(function()
					if vim.fn.exists(":MoltenInit") == 2 then
						vim.cmd("MoltenInit python3")
					end
				end)
			end,
		})
	end,
}
