-- jupytext.lua
return {
	"GCBallesteros/jupytext.nvim",
	opts = {
		-- 	style = "percent",
		-- 	style = "percent",
		-- 	output_extension = "auto",
		-- 	force_ft = "python",
		--
		custom_language_formatting = {
			python = {
				extension = "md",
				style = "markdown",
				force_ft = "markdown", -- you can set whatever filetype you want here

				-- extension = "qmd",
				-- style = "quarto",
				-- force_ft = "quarto", -- you can set whatever filetype you want here
			},
		},
	},
}
