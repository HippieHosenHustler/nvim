-- :help options

local options = {
   backup = false,				                -- creates a backup file
   clipboard = "unnamedplus",		            -- allows neovim to access the system clipboard
   cmdheight = 2,				                -- more space in the neovim command line for displaying messages
   completeopt = { "menuone", "noselect" },	    -- mostly just for cmp
   conceallevel = 0,			                -- so that `` is visible in markdown files
   fileencoding = "utf-8",			            -- the encoding written to a file
   hlsearch = true,				                -- highlight all matches on previous search pattern
   ignorecase = true,			                -- ignore case in search patterns
   mouse = "a",				                    -- allow the mouse to be used in neovim
   pumheight = 10,				                -- pup up menu height
   showmode = false,			                -- we don't need to see things like -- INSERT -- anymore
   showtabline = 2,				                -- always show tabs
   smartcase = true,			                -- smart case
   smartindent = true,			                -- make indenting smarter again
   splitbelow = true,			                -- force all horizontal splits to go below the current window
   splitright = true,			                -- force all vertical splits to go to the right of the current window
   swapfile = false,			                -- creates a swapfile
   termguicolors = true,			            -- set term gui colors
   timeoutlen = 1000,			                -- time to wait for a mapped sequence to end (in milliseconds)
   undofile = true,				                -- enable persistent undo
   updatetime = 300,			                -- faster completion (4000ms by default)
   writebackup = false,			                -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
   expandtab = true,			                -- convert tabs to spaces
   shiftwidth = 4,				                -- the number of spaces inserted for each indentation
   tabstop = 4,				                    -- insert 4 spaces for a tab
   cursorline = true,			                -- highlight the current line
   number = true,				                -- set numbered lines
   relativenumber = true,			            -- set relative numbered lines
   numberwidth = 4,				                -- set number column width (default 4)
   signcolumn = "yes",			                -- always show the sign column, otherwise it would shift the text each time
   wrap = false,				                -- display lines as one long line
   scrolloff = 8,				                -- minimal number of lines to show at top and bottom of screen
   sidescrolloff = 8,			                -- same for the side
   guifont = "Hack Nerd Font Mono",		        -- the font used in graphical neovim applications

}

vim.opt.shortmess:append "c"

vim.filetype.add({
    extension = {
        cmp = "html"
    }
})

vim.filetype.add({
    extension = {
        design = "html"
    }
})

vim.filetype.add({
    extension = {
        auradoc = "html"
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "st",
    callback = function()
      vim.cmd("set filetype=apex")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "mallard",
    callback = function()
      vim.cmd("set filetype=html")
    end,
})

for k,v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"		        -- allows movement between lines
vim.cmd [[set iskeyword+=-]]

