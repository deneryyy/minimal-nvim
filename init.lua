-- Neovim settings
vim.wo.number = true
vim.keymap.set({ 'x', 'n' }, 'y', '"+y', { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

require("config.lazy")

-- Catpuccin Theme
require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Mason
require("mason").setup()

-- Nvim Tree
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
}

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Open parent directory" })

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Change tab to next" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Change tab to previous" })
