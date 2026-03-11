local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function bind(mode, key, action, opts)
  return vim.keymap.set(mode, key, action, opts)
end

bind("n", "<leader>fe", ":Ex<CR>", opts("File Explorer"));
