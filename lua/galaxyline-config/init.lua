local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local utils = require('galaxyline-config.utils')
gl.short_line_list = {'NvimTree', 'packer', 'dashboard', 'toggleterm'}

-- Tables

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

local separators = {bLeft = '  ', bRight = ' ', uLeft = ' ', uTop = ' '}

-- Functions
local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

local in_git_repo = function()
    local vcs = require('galaxyline.provider_vcs')
    local branch_name = vcs.get_git_branch()

    return branch_name ~= nil
end

local checkwidth = function()
    return utils.has_width_gt(40) and in_git_repo()
end

local highlight_background_color = function()
    if in_git_repo() then return colors.lightbg end
    return colors.black
end

-- Left side

gls.left[1] = {
    ViMode = {
        provider = function()
            local mode_color = {n = colors.white, i = colors.green, v = colors.blue, V = colors.blue, [''] = colors.yellow, c = colors.purple, R = colors.blue}
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '   '
        end,
        highlight = {colors.white, colors.black, 'bold'}
    }
}

gls.left[2] = {
    NameText = {
        provider = function()
            return 'VapourNvim '
        end,
        highlight = {colors.white, colors.black, 'bold'},
        separator = separators.bRight,
        separator_highlight = {colors.lightbg, colors.black}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.lightbg}
    }
}
gls.left[4] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = separators.uLeft,
        separator_highlight = {colors.lightbg, colors.black}
    }
}

gls.left[5] = {DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.red, colors.black}}}

gls.left[6] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.yellow, colors.black}}}

gls.left[7] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.blue, colors.black}}}

-- Git stuff on the right side

gls.right[1] = {
    Octo = {
        provider = function()
            return '  '
        end,
        condition = in_git_repo,
        highlight = {colors.red, colors.lightbg},
        separator = separators.bRight,
        separator_highlight = {colors.lightbg, colors.black}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = function()
            local vcs = require('galaxyline.provider_vcs')
            local branch_name = vcs.get_git_branch()
            if (string.len(branch_name) > 28) then return string.sub(branch_name, 1, 25) .. "..." end
            return branch_name .. " "
        end,
        condition = in_git_repo,
        highlight = {colors.white, colors.lightbg}
    }
}

gls.right[3] = {DiffAdd = {provider = 'DiffAdd', condition = checkwidth, icon = ' ', highlight = {colors.green, colors.lightbg}}}
gls.right[4] = {DiffModified = {provider = 'DiffModified', condition = checkwidth, icon = ' ', highlight = {colors.yellow, colors.lightbg}}}
gls.right[5] = {DiffRemove = {provider = 'DiffRemove', condition = checkwidth, icon = ' ', highlight = {colors.red, colors.lightbg}}}

gls.right[6] = {
    FileFormat = {
        provider = function()
            return vim.bo.filetype
        end,
        highlight = {colors.black, colors.green},
        separator = separators.bRight,
        -- separator_highlight = {colors.green, colors.lightbg}
        separator_highlight = {colors.green, highlight_background_color()}
    }
}

gls.right[7] = {
    FileEncode = {
        provider = "FileEncode",
        separator = separators.bRight,
        separator_highlight = {colors.blue, colors.green},
        highlight = {colors.black, colors.blue}
    }
}

gls.right[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = separators.bRight,
        separator_highlight = {colors.yellow, colors.blue},
        highlight = {colors.black, colors.yellow}
    }
}

-- For short line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.black},
    highlight = {colors.blue,colors.black,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.white,colors.black,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.white,colors.black}
  }
}
