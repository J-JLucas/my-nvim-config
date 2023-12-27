-- Nvim-Tree: File Explorer
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup ({
	sort = {sorter = "case_sensitive",},
	view = {width = 30,},
	renderer = {group_empty = true, indent_markers = {enable = true}},
	git = {ignore = false},
	filters = {dotfiles = true,},
    })
    vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>" , {})	
    end
}
