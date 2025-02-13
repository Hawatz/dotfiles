require("gruvbox").setup({
    overrides = {
        ["@lsp.type.method"] = { bg = "#ff9900" },
        ["@comment.lua"] = { bg = "#000000" },
        ["@module.elixir"] = { link = "GruvboxYellow" }
    }
})
vim.cmd("colorscheme gruvbox")
