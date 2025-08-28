-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "H", "0", { noremap = true, desc = "跳转到行首" })
vim.keymap.set("n", "L", "$", { noremap = true, desc = "跳转到行尾" })
vim.keymap.set("n", "J", "H", { noremap = true, desc = "跳转到屏幕顶部" })
vim.keymap.set("n", "K", "L", { noremap = true, desc = "跳转到屏幕底部" })

---vim.keymao.set("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Tab Previous", silent = true })
---vim.keymao.set("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Tab Next", silent = true })
---vim.keyma-vim.keymao.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Tab Close", silent = true })
---vim.keyma-vim.keymao.set("n", "<leader>tO", "<cmd>tabonly<cr>", { desc = "Tab Close Other", silent = true })
---vim.keyma-vim.keymao.set("n", "<leader>tH", "<cmd>tabfirst<cr>", { desc = "Tab First", silent = true })
---vim.keyma-vim.keymao.set("n", "<leader>tL", "<cmd>tablast<cr>", { desc = "Tab Last", silent = true })
