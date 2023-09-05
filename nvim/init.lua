-- 插件
require("plugins")
-- 编辑器
require("editer.keymap")        -- 快捷键，输入keymap
require("editer.syntax-highlighting")
require("editer.lsp")
require("editer.cmp")

-- 多文件编辑
require("multiple-file.tab")
require("multiple-file.window")
require("multiple-file.nvim-tree")

-- 主题
require("theme.lualine")

-- 
require("find-modify.telescope")

vim.opt.mouse:append("a") -- 启用鼠标
vim.opt.clipboard:append("unnamedplus") --启用系统剪切板

-- 多文件编辑（tab与window）
vim.opt.splitright = true 		-- 默认新窗口在右
vim.opt.splitbelow = true		-- 默认新窗口在下
vim.keymap.set("n","<leader>sv","<C-w>v")

-- 搜索
local search = vim.opt
search.ignorecase = true 		-- 搜索忽略大小写
search.smartcase = true

-- 外观
local theme = vim.opt
theme.termguicolors = true

-- 主题插件
vim.cmd[[colorscheme tokyonight-moon]]

-- 离开插入模式保存
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.fn.execute("silent! write")
        vim.notify("Autosaved!", vim.log.levels.INFO, {})
    end,
})
