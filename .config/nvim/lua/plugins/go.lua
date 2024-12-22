return {
  {
    'olexsmir/gopher.nvim',
    dependecies = {
      'nvim-lua/plenary.nvim',
    },
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },
}
