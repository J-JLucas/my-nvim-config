-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.opt.number = true        -- set numbered lines
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
--vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus' -- lets neovim copy to system clipboard
-- requires program called xclip 'sudo apt install xclip'
vim.opt.showmode = false          -- status line takes care of this now
vim.opt.cursorline = true         -- highlights cursorline
vim.opt.scrolloff = 8             -- 8 line vertical buffer when moving cursor

-- leftovers recommended by default config vim
vim.opt.showcmd = true
vim.opt.showmatch = true -- show matching brackets

-- these two work together
-- if search string all lowercase, search case-insensitve
-- if string capitalized then search capitalization sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Setup 'lazy.nvim' Package Manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- set theme depending on system time
local hour = os.date("*t").hour
-- Check if the hour is between 5am and 5pm
if hour >= 5 and hour < 17 then
  -- Set the daytime theme
  vim.cmd('colorscheme dawnfox')
else
  -- Set the nighttime theme
  vim.cmd('colorscheme jellybeans')
end

-- format file on close
vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.format()
]]

-- return to last position when reopening file --
vim.api.nvim_exec([[
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]], false)
