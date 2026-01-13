-- lua/config/lsp/gopls.lua
---@type vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "go.work", "go.mod", ".git" })
    on_dir(root or vim.fn.getcwd())
  end,
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
}

