-- set leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- timeout leader key
-- vim.g.timeoutlen=3000
vim.g.timeout = false

-- set tabs indentation
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- navigate tabs
-- vim.keymap.set("n", "<Leader>´", ":tabprevious<CR>", { desc = "Previous tab" })
-- vim.keymap.set("n", "<Leader>ç", ":tabnext<CR>", { desc = "Next tab" })
--vim.keymap.set("n", "<Leader>'", ":tabfirst<CR>", { desc = "First tab" })
--vim.keymap.set("n", "<Leader>¡", ":tablast<CR>", { desc = "Last tab" })

vim.o.number = true
vim.o.relativenumber = true

vim.opt.mouse = ""
