local get_colors = function()
  if Vapour.settings.colorscheme == 'onedark' then
    local colors = {
      lightbg = '#38393f',
      black = "#2a2e36",
      red = "#e06c75",
      green = "#93c379",
      yellow = "#e5c07b",
      blue = "#61afef",
      purple = "#c678dd",
      cyan = "#56b6c2",
      white = "#cfcfcf"
    }
    return colors
  elseif Vapour.settings.colorscheme == 'rose-pine' then
    local colors = {
      lightbg = "#232136",
      black = "#191824",
      red = "#EB6F92",
      green = "#31748F",
      yellow = "#F6C177",
      blue = "#9CCFD8",
      purple = "#C4A7E7",
      cyan = "#EBBCBA",
      white = '#FAF4ED'
    }
    return colors
  elseif Vapour.settings.colorscheme == 'tokyonight' then
    local colors = {
      lightbg = "#414868",
      black = "#24283b",
      red = "#f7768e",
      green = "#9ece6a",
      yellow = "#e0af68",
      blue = "#7aa2f7",
      purple = "#bb9af7",
      cyan = "#2ac3de",
      white = '#d5d6db'
    }
    return colors
  elseif Vapour.settings.colorscheme == 'nord' then
    local colors = {
      lightbg = '#4C566A',
      black = "#3B4252",
      red = "#BF616A",
      green = "#A3BE8C",
      yellow = "#EBCB8B",
      blue = "#81A1C1",
      purple = "#B48EAD",
      cyan = "#88C0D0",
      white = "#E5E9F0"
    }
    return colors
  elseif Vapour.settings.colorscheme == 'custom' then
    local colors = {
      lightbg = "#414868",
      black = "#24283b",
      red = "#f7768e",
      green = "#9ece6a",
      yellow = "#e0af68",
      blue = "#7aa2f7",
      purple = "#bb9af7",
      cyan = "#2ac3de",
      white = '#d5d6db'
    }
    return colors
  elseif Vapour.settings.colorscheme == 'gruvbox' then
    local colors = {
      lightbg = "#504945",
      black = '#272727',
      red = "#cc231c",
      green = "#989719",
      yellow = "#d79920",
      blue = "#448488",
      purple = "#b16185",
      cyan = "#689d69",
      white = "#ebdbb2"
    }
    return colors
  elseif Vapour.settings.colorscheme == 'dracula' then
    local colors = {
      lightbg = "#44475a",
      black = '#282a36',
      red = "#ff5555",
      green = "#50fa7b",
      yellow = "#f1fa8c",
      blue = "#6272a4",
      purple = "#bd93f9",
      cyan = "#8be9fd",
      white = "#f8f8f2"
    }
    return colors
  end
end

local colors = get_colors()
local my_colors = {
  n = colors.blue,
  i = colors.cyan,
  c = colors.yellow,
  v = colors.purple,
  V = colors.purple
}

local staline = require('staline')
local percentage = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = {
    "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end
local time = function()
  return os.date("%a │ %H:%M %x")
end
staline.setup {
  sections = {
    left = {
      'mode', ' ', {'StalineBranch', 'branch'}
      -- branch,
    },
    mid = {{'StalineName', 'file_name'}},
    right = {'-lsp', ' ', time, '  ', percentage}
  },
  defaults = {
    true_colors = true, -- LSP highlighing
    font_active = "none",
    branch_symbol = " ", -- Change the branch symbol
    mod_symbol = "  " -- Change the modified symbol
  },
  mode_icons = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['nov'] = 'NORMAL',
    ['noV'] = 'NORMAL',
    ['niI'] = 'NORMAL',
    ['niR'] = 'NORMAL',
    ['niV'] = 'NORMAL',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['ix'] = 'INSERT',
    ['s'] = 'INSERT',
    ['S'] = 'INSERT',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL',
    [''] = 'VISUAL',
    ['r'] = 'REPLACE',
    ['r?'] = 'REPLACE',
    ['R'] = 'REPLACE',
    ['c'] = 'COMMAND',
    ['t'] = 'TERMINAL'
  },
  mode_colors = my_colors, -- Change mode colors
  special_table = {
    NvimTree = {'File Explorer', ' '},
    packer = {'Packer', ' '},
    TelescopePrompt = {'Telescope', ' '}
  },
  lsp_symbols = {Error = " ", Info = " ", Warn = " ", Hint = " "}
}
vim.cmd('hi StalineBranch guifg=' .. colors.purple)
vim.cmd('hi StalineName guifg=' .. colors.cyan)
