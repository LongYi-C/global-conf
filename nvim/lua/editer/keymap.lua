local ed = vim.opt

-- 外观
ed.relativenumber = true
ed.number = true
ed.signcolumn = "yes"        -- 左侧多一列

-- 缩进
ed.tabstop = 4
ed.shiftwidth = 4
ed.expandtab = true
ed.autoindent = true

-- 防止包裹
ed.wrap = false
ed.cursorline = true -- 启用鼠标

-- 快捷操作
local ky = vim.keymap
ky.set("i","jj","<ESC>")
ky.set("n","r","a<BS>")             -- r 修改字母
-- ky.set("n","e","ea<BS>")            -- e 修改单词
ky.set("n","<BS>","x")              -- 推格键删除
ky.set("v","<BS>","d")              -- 退格键删除

-- 特殊按键映射
ky.set("n","<CR>","A")

ky.set("n",";","A;")
ky.set("i",";","<ESC>A;")

ky.set("n","<Space>","<ESC>")
ky.set("v","<Space>","<ESC>")

-- 代码格式化
ky.set("v","<Tab>",">gv")
ky.set("n","<Tab>","v>gv<ESC>4l")
ky.set("i","<S-Tab>","<BS>")
ky.set("v","<S-Tab>","<gv")
ky.set("n","<S-Tab>","v<gv<ESC>4h")

-- 代码单行或者多行移动
ky.set("n","J",":m+1<CR>")
ky.set("n","K",":m-2<CR>")
ky.set("v","J",":m '>+1<CR>gv=gv")
ky.set("v","K",":m '<-2<CR>gv=gv")

-- 向下复制代码
ky.set("n","<C-d>","yyp")
ky.set("v","<C-d>","yyp")


-- windows 风格的复制剪切粘贴撤销
ky.set('v', '<Del>', 'd', { noremap = true })    -- 删除选中文本
ky.set('v', '<C-c>', 'y', { noremap = true })    -- 复制
ky.set('v', '<C-x>', 'x', { noremap = true })    -- 剪切
ky.set('n', '<C-v>', 'p', { noremap = true })    -- 粘贴
ky.set('i', '<C-v>', '<ESC>pi', { noremap = true })    -- 粘贴
ky.set('n', '<C-z>', 'u', { noremap = true }) -- 撤销
ky.set('i', '<C-z>', '<ESC>ui', { noremap = true }) -- 撤销
ky.set('i', '<C-A>', '<ESC>ggVG', { noremap = true })
ky.set('n', '<C-A>', 'ggVG', { noremap = true })
ky.set('n', '<C-j>', 'ggVG', { noremap = true })
ky.set('n', '<C-k>', 'ggVG', { noremap = true })


ky.set('v','d','"_d',{noremap = true})
ky.set('n','d','"_d',{noremap = true})
