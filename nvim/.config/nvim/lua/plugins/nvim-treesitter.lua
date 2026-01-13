return  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require( 'nvim-treesitter.config')

      configs.setup({
        ensure_installed = { 'bash' ,'c' ,'css' ,'diff' ,'dockerfile' ,'git_rebase' ,'gitcommit' ,'gitignore' ,'go' ,'gomod' ,'gotmpl' ,'html' ,'java' ,'javadoc' ,'javascript' ,'json' ,'lua' ,'luadoc' ,'markdown' ,'markdown_inline' ,'python' ,'query' ,'regex' ,'sql' ,'svelte' ,'sway' ,'tmux' ,'tsx' ,'typescript' ,'vim' ,'vimdoc' ,'xml' ,'yaml' ,'zig' ,'ziggy'
      },
      -- Autoinstall languages that are not installed
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true},
    })
  end,
}
