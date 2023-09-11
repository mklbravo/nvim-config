local map = vim.api.nvim_set_keymap -- Alias for function that set new keybindings

-- Helper Functions {{{{
function nm (key, command)
  map('n', key, command , { noremap = true })
end

-- }}}}

-- Movement {{{{
nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')
-- }}}}
