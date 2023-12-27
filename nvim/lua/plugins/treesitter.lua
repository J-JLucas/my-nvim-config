-- Tree Sitter: Syntax Highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "c", "cpp", "llvm", "python", "bash", "make", "cmake", "markdown" },
      highlight = { enable = true, additional_vim_regex_highlighting = true, },
      indent = { enable = true }
    })
  end
}
