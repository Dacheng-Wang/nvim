return {
  'gelguy/wilder.nvim', -- Specify the Wilder plugin
  config = function() -- Configure Wilder here
    local wilder = require 'wilder'
    wilder.setup { modes = { ':', '/', '?' } }

    wilder.set_option(
      'renderer',
      wilder.renderer_mux {
        [':'] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
          highlighter = wilder.lua_fzy_highlighter(),
          highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
            border = 'Normal', -- highlight to use for the border
          },
          left = {
            ' ',
            wilder.popupmenu_devicons(),
          },
          right = {
            ' ',
            wilder.popupmenu_scrollbar(),
          },
          border = 'rounded',
        }),
        ['/'] = wilder.wildmenu_renderer {
          highlighter = wilder.lua_fzy_highlighter(),
          highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
          },
        },
      }
    )
    -- Disable Python remote plugin
    wilder.set_option('use_python_remote_plugin', 0)

    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.cmdline_pipeline {
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        },
        wilder.vim_search_pipeline()
      ),
    })
  end,
}
