local map = vim.keymap.set
map("n", "<leader>fn", "<cmd>Neotree reveal<cr>", { desc = "Focus on current file in Neotree" })
map("n", "<leader>fw", ":w<cr>", { desc = "Write buffer / save file" })
map("n", "<leader>fW", ":wall<cr>", { desc = "Write all buffer(s) / save all file(s)" })
