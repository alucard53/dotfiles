local showStatusBar = 0
local showLineNumbers = false

local function toggleStatusBar()
  if showStatusBar == 2 then
    showStatusBar = 0
    vim.opt.laststatus = 0
  else
    vim.opt.laststatus = 2
    showStatusBar = 2
  end
end

local function toggleLineNumbers()
  if showLineNumbers then
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn = 'no'
    showLineNumbers = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = 'yes'
    showLineNumbers = true
  end
end 

vim.opt.laststatus = 0
vim.keymap.set("n", "<C-s>", toggleStatusBar)

vim.keymap.set("n", "<C-k>", toggleLineNumbers)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pa", "ggVG")

-- vim.opt.guicursor = ''
vim.opt.signcolumn = "no"
vim.opt.nu = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.g.editorconfig = false
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
