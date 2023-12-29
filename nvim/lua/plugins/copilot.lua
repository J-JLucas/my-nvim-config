-- Pure lua copilot
-- https://github.com/zbirenbaum/copilot.lua
-- this guy seems to know what he's doing with copilotlol
-- https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-lazyvim/lua/plugins/ai.lua
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false, -- disable built-in keymapping
        keymap = {
          accept = "<S-Tab>",
          accept_word = false,
          accept_line = false,
          --next = "<M-]>",
          --prev = "<M-[>",
          --dismiss = "<C-]>",
        },
      },
    })
  end
}
