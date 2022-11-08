local Remap = require("ortizojeda.keymap")
local nnoremap = Remap.nnoremap

-- nnoremap("<C-p>", ":Telescope")

-- nnoremap("<leader>ps", function()
--     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
-- end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>fw", function()
    require('telescope.builtin').live_grep()
end)

-- nnoremap("<leader>fw", function()
--     require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
-- end)

nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>db", function()
    require('telescope.actions').delete_buffer()
end)

nnoremap("<leader>fh", function()
    require('telescope.builtin').help_tags()
end)

nnoremap("<leader>fif", function()
    require('telescope.builtin').current_buffer_fuzzy_find()
end)

-- [[TODO: Fix this immediately
-- nnoremap("<leader>vwh", function()
--     require('telescope.builtin').help_tags()
-- end)]]

-- nnoremap("<leader>vrc", function()
--     require('ortizojeda.telescope').search_dotfiles({ hidden = true })
-- end)

nnoremap("<leader>gs", function()
    require('telescope.builtin').git_status()
end)

nnoremap("<leader>gb", function()
    require('ortizojeda.telescope').git_branches()
end)

nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)

nnoremap("<leader>gcw", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

nnoremap("<leader>ts", function()
    require('telescope.builtin').treesitter()
end)

nnoremap("<leader>bi", function()
    require('telescope.builtin').builtin()
end)

-- nnoremap("<leader>lg", function()
--     require("telescope").extensions.lazygit.lazygit()
-- end)

-- nnoremap("<leader>td", function()
--     require('ortizojeda.telescope').dev()
-- end)
