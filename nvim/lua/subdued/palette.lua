-- Kanagawa-inspired dark palette (low contrast)
-- Source: https://github.com/rebelot/kanagawa.nvim
local dark = {
  bg_edge2 = '#16161D',
  bg_edge  = '#181820',
  bg       = '#1F1F28',
  bg_mid   = '#2A2A37',
  bg_mid2  = '#363646',

  fg_edge2 = '#F0ECD5',
  fg_edge  = '#E8E3C8',
  fg       = '#DCD7BA',
  fg_mid   = '#C8C093',
  fg_mid2  = '#A09A8A',

  accent    = '#7E9CD8',
  accent_bg = '#223249',

  red    = '#E46876',
  orange = '#DCA561',
  yellow = '#E6C384',
  green  = '#98BB6C',
  cyan   = '#7AA89F',
  azure  = '#7E9CD8',
  blue   = '#957FB8',
  purple = '#b8b4d0',

  red_bg    = '#43242B',
  orange_bg = '#3A3520',
  yellow_bg = '#3A3520',
  green_bg  = '#2B3328',
  cyan_bg   = '#252535',
  azure_bg  = '#252535',
  blue_bg   = '#223249',
  purple_bg = '#252535',
}

-- Dayfox-inspired light palette (high contrast)
-- Source: https://github.com/EdenEast/nightfox.nvim
local light = {
  bg_edge2 = '#FCFAF8',
  bg_edge  = '#F9F6F3',
  bg       = '#F6F2EE',
  bg_mid   = '#E4DCD4',
  bg_mid2  = '#D3C7BB',

  fg_edge2 = '#1A1030',
  fg_edge  = '#2A1C3E',
  fg       = '#3D2B5A',
  fg_mid   = '#643F61',
  fg_mid2  = '#824D5B',

  accent    = '#2848A9',
  accent_bg = '#D3C7BB',

  red    = '#A5222F',
  orange = '#AC5402',
  yellow = '#8B7500',
  green  = '#396847',
  cyan   = '#287980',
  azure  = '#2848A9',
  blue   = '#6E33CE',
  purple = '#A440B5',

  red_bg    = '#F0D8D8',
  orange_bg = '#F0E0D0',
  yellow_bg = '#F0ECD0',
  green_bg  = '#D8ECD0',
  cyan_bg   = '#D0E8EC',
  azure_bg  = '#D0DCEC',
  blue_bg   = '#D8D0EC',
  purple_bg = '#ECD0E8',
}

return function()
  if vim.o.background == 'dark' then
    return vim.deepcopy(dark)
  else
    return vim.deepcopy(light)
  end
end
