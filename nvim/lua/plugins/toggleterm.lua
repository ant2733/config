return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    -- 大小和位置
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    
    -- 终端方向: horizontal, vertical, float, tab
    direction = 'float',
    
    -- 快捷键映射
    open_mapping = [[<c-\>]],
    
    -- 外观
    hide_numbers = true,
    autochdir = false,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = -25,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    
    -- 行为
    persist_mode = true,
    persist_size = true,
    close_on_exit = true,
    auto_scroll = true,
    
    -- 浮动窗口配置
    float_opts = {
      border = 'double',
      width = function() return math.floor(vim.o.columns * 0.8) end,
      height = function() return math.floor(vim.o.lines * 0.8) end,
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    
    -- 自定义终端函数
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    
    -- 自定义终端实例
    local Terminal = require('toggleterm.terminal').Terminal
    
    -- Python REPL
    local python = Terminal:new({
      cmd = "python",
      hidden = true,
      direction = "horizontal",
    })
    
    -- Node.js REPL
    local node = Terminal:new({
      cmd = "node",
      hidden = true,
      direction = "vertical",
    })
    
    -- 自定义快捷键
    vim.keymap.set('n', '<leader>py', function() python:toggle() end)
    vim.keymap.set('n', '<leader>js', function() node:toggle() end)
  end
}
