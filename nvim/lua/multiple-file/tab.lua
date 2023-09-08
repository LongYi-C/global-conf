vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '<C-o>', ':bprevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':bnext<CR>', {noremap = true})

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}


