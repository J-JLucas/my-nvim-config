-- nvim-ufo: Function Folding
-- https://github.com/kevinhwang91/nvim-ufo
return {
    {
        "kevinhwang91/nvim-ufo",
        event = "BufRead",
        dependencies = {
            {"kevinhwang91/promise-async"},
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
            },
        },
        config = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

--	    require('ufo').setup()
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            })
        end,
    },
}
