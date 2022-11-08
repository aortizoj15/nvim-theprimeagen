local neogit = require('neogit')
local nnoremap = require('ortizojeda.keymap').nnoremap

neogit.setup {
  integrations = {
    diffview = true
  }
}

nnoremap("<leader>ng", function()
    neogit.open({ })
end);

-- nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
