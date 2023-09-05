
-- treesitter.configs
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
require'nvim-treesitter.configs'.setup {
    -- 支持的语言
    ensure_installed = {"sql","markdown","html","css","gitignore","xml","yaml","vue","typescript", "c", "lua", "vim", "vimdoc", "query","bash","cpp","javascript","json","python", },

    highlight = {enable = true },
    indent = { enable = true },

    -- 不同括号颜色区分
    rainbow = {
        enable = true,
        extended_mode = true,
    }
}
