local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist
			},
      n = {
        ["<C-h>"] = "which_key",
    	  ['<C-b>'] = actions.delete_buffer
        -- lazyGit nvim integration
        -- ['<C-g>'] = require('telescope').load_extension('lazygit')       
      },
		},
	},
    --[[
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
    ]]
})

require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("fzy_native")
-- lazyGit nvim integration
-- require('telescope').load_extension('lazygit')

local M = {}

function M.reload_modules()
	-- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
	-- awesome things.
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< DotFiles >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

local function set_background(content)
    print(content)
	vim.fn.system("feh --bg-fill " .. content .. "'\"")
end

local function select_background(prompt_bufnr, map)
	local function set_the_background(close)
		local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
        print(vim.inspect(content))
		set_background(content.cwd .. "/" .. content.value)
		if close then
			require("telescope.actions").close(prompt_bufnr)
		end
	end

	map("i", "<C-p>", function()
		set_the_background()
	end)

	map("i", "<CR>", function()
		set_the_background(true)
	end)
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

return M
