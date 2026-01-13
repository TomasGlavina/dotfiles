return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	config = function()
		local configs = require("render-markdown")

		configs.setup({
			completions = { lsp = { enabled = true } },
		})
	end,
}
