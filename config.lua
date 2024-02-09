-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])

--[[ 
 * Only for windows 
 * to solve the problem "... not a valid Win32 application"
 * install LLVM https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.4
 * add the code below to config.lua
 * then uninstall treesitter 
 * reopen LunarVim, a lazy installation window should appear after treesitter is installed again
 * we are good to go.
]]
--
vim.cmd([[
  lua require'nvim-treesitter.install'.compilers = { 'clang' }
]])

-- Set a compatible clipboard manager
vim.g.clipboard = {
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}
---------------------------------------------------------------
lvim.colorscheme = "gruvbox-material"

vim.opt.fillchars = { eob = " " }

-- relative line numbering stuff
vim.wo.number = true
vim.wo.relativenumber = true

-- lualine configuration
lvim.builtin.lualine.options = {
	icons_enabled = true,
	theme = "gruvbox-material",
	component_separators = { left = "", right = "" }, -- 
	section_separators = { left = "", right = "" }, -- 
}

-- function to find current time (hh:mm)
local function getTime()
	local time = os.date("*t")
	local hour = time.hour
	local am_pm = "AM"

	if hour >= 12 then
		am_pm = "PM"
		if hour > 12 then
			hour = hour - 12
		end
	elseif hour == 0 then
		hour = 12
	end

	local result = string.format("  %d:%02d %s", hour, time.min, am_pm)
	return result
end

lvim.builtin.lualine.sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = { "filename" },
	lualine_x = { "fileformat", "filetype" },
	lualine_y = { "progress" },
	lualine_z = { getTime },
}

-- which key configuration
lvim.builtin.which_key.setup.icons = {
	breadcrumb = "»",
	separator = " 󰁔 ",
	group = "+",
	get_lvim_base_dir,
}

lvim.builtin.which_key.setup.window = {
	border = "none",
	margin = { 0, 45, 0, 45 },
	padding = { 1, 1, 1, 1 },
	winblend = 10,
}

lvim.builtin.which_key.setup.show_help = false

-- resut the style of cmp completion snippets list
vim.o.pumblend = 10
lvim.builtin.cmp.window = {
	completion = {
		border = "none",
	},
	documentation = {
		border = "none",
	},
}

-- keybindings
lvim.keys.normal_mode["L"] = ":bnext<CR>"
lvim.keys.normal_mode["H"] = ":bprev<CR>"

-- plugins
lvim.plugins = {
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_transparent_background = 1
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1c1c1c", -- I don't know what this does :) but I it is recommended when the backtround is transparent
				stages = "fade",
				render = "compact",
			})
		end,
	},
}
