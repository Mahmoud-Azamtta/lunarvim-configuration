-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
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
-- I have no idea what the code above does :), it was here
-- when I first launched LunarVim.
-- I think it may be ralted to windows powershell or something like that
--------------------------------------------------------------

--[[ 
 * Only for windows 
 * to solve the problem "... not a valid Win32 application"
 * install LLVM https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.4
 * add the code below to config.lua
 * then uninstall treesitter 
 * reopen LunarVim, a lazy installation window should appear after treesitter is installed again
 * we are good to go.
]]
vim.cmd([[
  lua require'nvim-treesitter.install'.compilers = { 'clang' }
]])

-- lualine configuration
require("builtins.lualine-config")

-- which key configuration
require("builtins.whichKey")

-- keybindings
require("builtins.keybindings")

-- alpha dashboard
require("builtins.alpha")

-- theme and some editor configs
lvim.colorscheme = "gruvbox-material"
vim.opt.fillchars = { eob = " " }
vim.opt.wrap = true

-- relative line numbering stuff
vim.wo.number = true
vim.wo.relativenumber = true

-- reset the style of cmp completion snippets list
vim.o.pumblend = 10
lvim.builtin.cmp.window = {
	completion = {
		border = "none",
	},
	documentation = {
		border = "none",
	},
}

lvim.builtin.nvimtree.setup.view.preserve_window_proportions = true

-- enable auto close tag and auto rename tag
-- Note: nvim-ts-autotag must be installed
lvim.builtin.treesitter.autotag.enable = true

--[[ plugins ]]
local gruvbox = require("plugins.gruvbox")
local noice = require("plugins.noice")
local notify = require("plugins.notify")
local conform = require("plugins.conform")
local colorizer = require("plugins.colorizer")
local devicons = require("plugins.devicons")

lvim.plugins = {
	gruvbox,
	noice,
	notify,
	conform,
	colorizer,
	devicons,
	{ "windwp/nvim-ts-autotag" },
}
