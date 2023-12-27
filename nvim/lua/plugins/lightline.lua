-- Lightline: StatusBar
return {
  "https://github.com/itchyny/lightline.vim",
  lazy = false,
  config = function()
    -- set theme
    -- [[ executes multiple lines in a single call ]]
    vim.cmd [[
	let g:lightline = {
	    \'colorscheme': 'one'
	\}
    ]]
  end
}
