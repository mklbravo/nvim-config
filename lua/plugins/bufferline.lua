--[[
  A snazzy buffer line (with tabpage integration)
  See: https://github.com/akinsho/bufferline.nvim
]]

return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Set plugin related keymaps
    vim.api.nvim_set_keymap('n', ']b',':BufferLineCycleNext<enter>', {})
    vim.api.nvim_set_keymap('n', '[b',':BufferLineCyclePrev<enter>', {})
  end,
  opts = {
    options = {
      always_show_bufferline = true,
      close_icon = '',
      color_icons = true,        -- whether or not to add the filetype icon highlights
      enforce_regular_tabs = false,
      left_trunc_marker = '',
      mode = 'buffer',
      numbers = 'ordinal',
      offsets = {
        {
          filetype = 'neo-tree',
          highlight = 'Directory',
          separator = true,
          text = 'Explorer',
          text_align = 'left',
        },
      },
      persist_buffer_sort = true,    -- whether or not custom sorted buffers should persist
      right_trunc_marker = '',
      separator_style = 'thick',
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_bufferclose_icons = false,
      show_close_icon = false,
      show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
      show_tab_indicators = false,
      tab_size = 22,
    },
  },
  version = '*',
}
