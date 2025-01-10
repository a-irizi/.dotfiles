-- NOTE: ensure lldb is installed on the system
return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'rcarriga/nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text' },
    config = function()
      local dap = require('dap')
      local ui = require('dapui')
      require('dapui').setup()

      Keymap('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Debug [B]reakpoint' })
      Keymap('n', '<leader>dr', dap.continue, { desc = '[D]ebug Run to [R]esume' })
      Keymap('n', '<C-d><C-j>', dap.step_over, { desc = '[D]ebug step o[V]er' })
      Keymap('n', '<leader>di', dap.step_into, { desc = '[D]ebug setp [I]nto' })
      Keymap('n', '<leader>db', dap.step_back, { desc = '[D]ebug setp [B]ack' })
      Keymap('n', '<leader>do', dap.step_out, { desc = '[D]ebug step [O]ut' })
      Keymap('n', '<leader>dc', dap.run_to_cursor, { desc = '[D]ebug Run to [C]ursor' })
      Keymap('n', '<Leader>dR', dap.toggle_breakpoint, { desc = 'Debug [B]reakpoint' })
      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio', 'folke/lazydev.nvim' },
  },
  { 'folke/lazydev.nvim' },
  -- {
  --   'mfussenegger/nvim-dap',
  --   config = function()
  --     local dap = require('dap')
  --     Keymap('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })
  --     Keymap('n', '<leader>dv', dap.step_over, { desc = '[D]ebug step o[V]er' })
  --     Keymap('n', '<leader>di', dap.step_into, { desc = '[D]ebug setp [I]nto' })
  --     Keymap('n', '<leader>do', dap.step_out, { desc = '[D]ebug step [O]ut' })
  --     Keymap('n', '<Leader>db', dap.toggle_breakpoint, { desc = '[D]ebug toggle [B]reakpoint' })
  --     -- Keymap("n", "<Leader>dr", dap.repl.open)
  --     -- Keymap("n", "<Leader>dl", dap.run_last)
  --     -- Keymap({ "n", "v" }, "<Leader>dh", dap.ui.widgets.hover)
  --     -- Keymap({ "n", "v" }, "<Leader>dp", function()
  --     -- 	require("dap.ui.widgets").preview()
  --     -- end)
  --     -- Keymap("n", "<Leader>df", function()
  --     -- 	local widgets = require("dap.ui.widgets")
  --     -- 	widgets.centered_float(widgets.frames)
  --     -- end)
  --     -- Keymap("n", "<Leader>ds", function()
  --     -- 	local widgets = require("dap.ui.widgets")
  --     -- 	widgets.centered_float(widgets.scopes)
  --     -- end)
  --     vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
  --     local dapui = require('dapui')
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated.dapui_config = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited.dapui_config = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  -- {
  --   'folke/neodev.nvim',
  --   opts = {
  --     library = {
  --       plugins = { 'nvim-dap-ui' },
  --       type = true,
  --     },
  --   },
  -- },
}
