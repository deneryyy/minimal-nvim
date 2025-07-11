-- Neovim settings
vim.wo.number = true
vim.keymap.set({ 'x', 'n' }, 'y', '"+y', { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

require("config.lazy")

-- Blink cmp for autocompletion
local cmp = require("blink.cmp")
cmp.setup({
  -- Enables keymaps, completions and signature help when true (doesn't apply to cmdline or term)
  --
  -- If the function returns 'force', the default conditions for disabling the plugin will be ignored
  -- Default conditions: (vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false)
  -- Note that the default conditions are ignored when `vim.b.completion` is explicitly set to `true`
  --
  -- Exceptions: vim.bo.filetype == 'dap-repl'
  enabled = function () return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype) end,

  -- Disable cmdline
  cmdline = { enabled = false },
  completion = {
    list = {
      selection = "auto_insert",
    },
  },

  sources = {
    -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- Use a preset for snippets, check the snippets documentation for more information
  snippets = { preset = 'default' },

  -- Experimental signature help support
  signature = { enabled = true }
})

-- Autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

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
  -- Disable all git highlighting cuz annoying
  git = {
    enable = false,
  },
  renderer = {
    highlight_git = false,
    icons = {
      show = {
        git = false,
      },
    },
  },
  on_attach = my_on_attach,
}

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Open parent directory" })

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Change tab to next" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Change tab to previous" })

-- Refactoring
require('refactoring').setup({
  prompt_func_return_type = {
    go = false,
    java = false,

    cpp = false,
    c = false,
    h = false,
    hpp = false,
    cxx = false,
  },
  prompt_func_param_type = {
    go = false,
    java = false,

    cpp = false,
    c = false,
    h = false,
    hpp = false,
    cxx = false,
  },
  printf_statements = {},
  print_var_statements = {},
  show_success_message = false,   -- shows a message with information about the refactor on success
  -- i.e. [Refactor] Inlined 3 variable occurrences
})

vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
