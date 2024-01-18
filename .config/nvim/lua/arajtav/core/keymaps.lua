vim.g.mapleader = " "
local km = vim.keymap

km.set("n", "<leader>sv", "<C-w>v")                 -- split vertical
km.set("n", "<leader>sh", "<C-w>s")                 -- split horizontal
km.set("n", "<leader>se", "<C-w>=")                 -- make windows equal
km.set("n", "<leader>sx", ":close<CR>")             -- close window
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")   -- maximize

km.set("n", "<leader>to",       ":tabnew<CR>")      -- new tab
km.set("n", "<leader>tx",       ":tabclose<CR>")    -- close tab
km.set("n", "<leader><Right>",  ":tabn<CR>")        -- go to next tab
km.set("n", "<leader><Left>",   ":tabp<CR>")        -- go to previous tab

km.set("n", "<leader>e", ":NvimTreeToggle<CR>")     -- nvim tree

-- telescope stuff
km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")      -- fzf
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")       -- ripgrep
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")     -- occurrences of string under cursor
km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")         -- open buffers
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")       -- help tags

km.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")     -- git commits
km.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")   -- git commits in current file
km.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")    -- git branches
km.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")      -- git status
