return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'select around function' },
            ['if'] = { query = '@function.inner', desc = 'select inside function' },
            ['ac'] = { query = '@class.outer', desc = 'select around class' },
            ['ic'] = { query = '@class.inner', desc = 'select inside class' },
            ['al'] = { query = '@loop.outer', desc = 'select around loop' },
            ['il'] = { query = '@loop.inner', desc = 'select inside loop' },
            ['ab'] = { query = '@block.outer', desc = 'select around block' },
            ['ib'] = { query = '@block.inner', desc = 'select inside block' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@function.outer', desc = 'go to next function' },
            [']c'] = { query = '@class.outer', desc = 'go to next class' },
            [']l'] = { query = '@loop.outer', desc = 'go to next loop' },
            [']b'] = { query = '@block.outer', desc = 'go to next block' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@function.outer', desc = 'go to previous function' },
            ['[c'] = { query = '@class.outer', desc = 'go to previous class' },
            ['[l'] = { query = '@loop.outer', desc = 'go to previous loop' },
            ['[b'] = { query = '@block.outer', desc = 'go to previous block' },
          },
        },
        lsp_interop = {
          enable = true,
          border = 'rounded',
          peek_definition_code = {
            ['gp'] = { query = '@function.outer', desc = 'peek function definition' },
            ['gcp'] = { query = '@class.outer', desc = 'peek class definition' },
          },
        },
      },
    }
  end,
}
