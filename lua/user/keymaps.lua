local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x",
-- term_mode = "t"
-- command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "ª", "<C-w>h", opts)        -- move to left window, opt+h
keymap("n", "º", "<C-w>j", opts)        -- move to lower window, opt+j
keymap("n", "∆", "<C-w>k", opts)        -- move to higher window, opt+k
keymap("n", "@", "<C-w>l", opts)        -- move to right window, opt+l

keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- open file explorer

-- TODO: Resizing of windows

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)        -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts)    -- previous buffer

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<º>", ":m .+1<CR>==", opts)        -- Move selected text down, opt j
keymap("v", "<∆>", ":m .-2<CR>", opts)        -- Move selected text up, opt k
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Muve text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "º", ":move '>+1<CR>gv-gv", opts)       -- opt j
keymap("x", "∆", ":move '<-1<CR>gv-gv", opts)       -- opt k

-- Terminal --
-- Better terminal navigation
keymap("t", "ª", "<C-\\><C-N><C-w>h", term_opts)    -- opt h
keymap("t", "º", "<C-\\><C-N><C-w>j", term_opts)    -- opt j
keymap("t", "∆", "<C-\\><C-N><C-w>k", term_opts)    -- opt k
keymap("t", "@", "<C-\\><C-N><C-w>l", term_opts)    -- opt l

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
