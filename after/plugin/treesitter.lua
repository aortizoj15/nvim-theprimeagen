require('nvim-treesitter.configs').setup({
    ensure_installed = {"html", "css", "scss", "javascript", "typescript", "vim"},
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
      enable = true,
      config = {
        handlebars = { __default = '{{!-- %s --}}', __multiline = '{{!-- %s --}}' }
      },
    },
})