local showStatusBar = 0

function toggleStatusBar()
  if showStatusBar == 2 then
    showStatusBar = 0
    vim.opt.laststatus = 0
  else
    vim.opt.laststatus = 2
    showStatusBar = 2
  end
end

vim.opt.laststatus = 0
vim.keymap.set("n", "<C-s>", toggleStatusBar)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pa", "ggVG")

vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

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
