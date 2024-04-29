-- NOTE: ensure lldb is installed on the system
return {
	{
		"rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			Keymap("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
			Keymap("n", "<leader>dv", dap.step_over, { desc = "[D]ebug step o[V]er" })
			Keymap("n", "<leader>di", dap.step_into, { desc = "[D]ebug setp [I]nto" })
			Keymap("n", "<leader>do", dap.step_out, { desc = "[D]ebug step [O]ut" })
			Keymap("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebug toggle [B]reakpoint" })
			-- Keymap("n", "<Leader>dr", dap.repl.open)
			-- Keymap("n", "<Leader>dl", dap.run_last)
			-- Keymap({ "n", "v" }, "<Leader>dh", dap.ui.widgets.hover)
			-- Keymap({ "n", "v" }, "<Leader>dp", function()
			-- 	require("dap.ui.widgets").preview()
			-- end)
			-- Keymap("n", "<Leader>df", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.frames)
			-- end)
			-- Keymap("n", "<Leader>ds", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.scopes)
			-- end)
			vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"folke/neodev.nvim",
		opts = {
			library = {
				plugins = { "nvim-dap-ui" },
				type = true,
			}
		},
	},
}
