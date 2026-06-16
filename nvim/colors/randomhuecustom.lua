local hues = require('mini.hues')

math.randomseed(vim.loop.hrtime())
local base_colors = hues.gen_random_base_colors()

hues.setup({
  background = base_colors.background,
  foreground = base_colors.foreground,
  n_hues = 4,
  saturation = vim.o.background == 'dark' and 'lowmedium' or 'high',
  accent = 'bg',
})

vim.g.colors_name = 'customrandom'

