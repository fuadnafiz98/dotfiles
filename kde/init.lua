vim.g.mapleader = " "
vim.opt.background = "dark"
vim.opt.encoding = "UTF-8"
vim.opt.compatible = false
vim.opt.errorbells = false
vim.opt.exrc = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.errorbells = false
vim.opt.signcolumn = "no"
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.cmd("syntax on")
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 1
vim.opt.ttyfast = true
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.scrolloff = 8
vim.opt.laststatus = 2
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 9999

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

-- Set options
vim.opt.cursorline = true

-- Basic lsp
vim.opt.completeopt:append("noselect")

-- Smooth scrolling keymaps
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- Normal mode mappings
vim.keymap.set("n", "<A-a>", "m<CR>", { noremap = true, silent = true, desc = "Set mark at current position" })
vim.keymap.set("n", "<C-\\>", "<C-^>", { noremap = true, silent = true, desc = "Switch to alternate file" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "Delete line without yanking" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.open_float({ scope = 'cursor' })<CR>", { noremap = true, silent = true, desc = "Open LSP diagnostic at cursor" })

-- Insert mode mappings
vim.keymap.set("i", "<C-\\>", "<ESC><C-^>", { noremap = true, silent = true, desc = "Exit insert mode and switch to alternate file" })

-- Visual mode mappings
vim.keymap.set("x", "<", "<gv", { noremap = true, silent = true, desc = "Re-indent selected block left" })
vim.keymap.set("x", ">", ">gv", { noremap = true, silent = true, desc = "Re-indent selected block right" })
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste without yanking deleted text" })

-- Autocommand to format buffer before writing
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Fold the code block under the cursor
vim.keymap.set("n", "<C-[", "za", { noremap = true, silent = true, desc = "Toggle fold" })
-- Unfold the code block under the cursor completely
vim.keymap.set("n", "<C-]>", "zA", { noremap = true, silent = true, desc = "Open fold recursively" })

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")

-- Native plugin 
vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

vim.o.background = "dark" 
require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, 
  contrast = "hard",
  palette_overrides = {},
  overrides = {},
  dim_inactive = true,
  transparent_mode = true,
})
vim.cmd([[colorscheme gruvbox]])

-- Transparent 
-- Highlight groups for a transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SpecialKey", { bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

-- Clear specific highlight groups by providing an empty table
vim.api.nvim_set_hl(0, "LineNr", {})
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "CursorLine", {})

-- Custom highlights for cursor-related groups
-- We'll set the background to NONE for transparency, and clear cterm-specific attributes
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })

vim.lsp.enable('ruff')
