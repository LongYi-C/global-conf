vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
vim.g.mapleader=" "

vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

