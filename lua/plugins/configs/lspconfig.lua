vim.lsp.config('lua-language-server', {
})

vim.lsp.config('clangd', {});

-- Keybinds
vim.keymap.set("n", "<leader>fm",
  function ()
    vim.lsp.buf.format { async = true }
  end,
  { desc = 'LSP Formatting' });

vim.keymap.set("n", "gD", function ()
    vim.lsp.buf.declaration()
  end,
  { desc = "LSP declaration" })

vim.keymap.set("n", "gd", function ()
    vim.lsp.buf.definition()
  end,
  { desc = "LSP definition" })

vim.keymap.set("n", "gi", function ()
    vim.lsp.buf.implementation()
  end,
  { desc = "LSP implementation" })

vim.keymap.set("n", "gr", function ()
    vim.lsp.buf.references()
  end,
  { desc = "LSP references" })

-- Nvim DAP
vim.keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" })
vim.keymap.set(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
