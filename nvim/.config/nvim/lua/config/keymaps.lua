vim.keymap.set("n", "-", "<cmd> Oil --float<CR>", { desc = "Open Parent Dir in Oil" })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- FZF Lua keymaps
vim.keymap.set("n", "<C-f><C-p>", function()
	require("fzf-lua").files()
end, { desc = "Fuzzy find in project" })

vim.keymap.set("n", "<C-f><C-h>", function()
	FzfLua.files({ cwd = "~/" })
end, { desc = "FZF in home directory" })

vim.keymap.set("n", "<C-f><C-o>", function()
	FzfLua.files({ cwd = "~/.config" })
end, { desc = "FZF in .config" })

vim.keymap.set("n", "<C-f><C-g>", function()
	FzfLua.live_grep()
end, { desc = "FZF grep in project" })

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Show diagnostic warning/error in float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file using Conform" })

-- Change Copilot accept to Ctrl+J
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
