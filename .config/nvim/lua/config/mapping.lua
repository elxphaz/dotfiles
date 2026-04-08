vim.g.mapleader = " "

local function bind(mode, key, action, opts)
  return vim.keymap.set(mode, key, action, opts)
end

bind("n", "<leader>fe", "<cmd>Explore<cr>", { noremap = true});

vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<cr>")
