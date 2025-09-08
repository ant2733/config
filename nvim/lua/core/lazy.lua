local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- 代码补全插件
        { import = "plugins.blink" },

        -- 主题插件
        { import = "plugins.onedarkpro"},
        
        -- 美观的标签栏
        { import = "plugins.bufferline"},

        -- 状态栏的实现
        { import = "plugins.lualine"},

        -- 补全括号
        { import = "plugins.nvim-autopairs"},

        -- 侧边栏
        { import = "plugins.nvim-tree"},

        -- 缩进提示框
        { import = "plugins.indent-blankline"},
        
        -- 查找文件
        { import = "plugins.telescope"},

        -- 全局替换
        { import = "plugins.grug-far"},

        -- lsp管理
        { import = "plugins.mason"},

        -- 代码格式化
        { import = "plugins.none-ls"},

        -- 对括号、引号内内容进行快速操作
        { import = "plugins.nvim-surround"},

        -- 代码高亮，同时也是很多插件的基本插件
        { import = "plugins.nvim-treesitter"},

        -- 显示图片
        { import = "plugins.snacks"},

        -- 终端管理插件
        { import = "plugins.toggleterm"},

        -- 终端文档管理器
        { import = "plugins.yazi-nvim"},

        -- 显示变量引用信息（lsp增强插件）
        { import = "plugins.lspsaga"},
    }
})
