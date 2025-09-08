vim.keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>aa", ":lua print(123)<CR>", {silent = true})

vim.keymap.set("n", "<F5>", ":w<CR>:!python %<CR>", {noremap = true})
