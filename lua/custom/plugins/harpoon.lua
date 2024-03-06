return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():append()
    end, { desc = 'append to harpoon list' })

    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():remove()
    end, { desc = 'delete from harpoon list' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():next()
    end, { desc = 'toggle next buffer' })

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():prev()
    end, { desc = 'toggle previous buffer' })

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hl', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'harpoon list' })
  end,
}
