Vapour.utils.plugins.packadd('which-key.nvim')

local wk = Vapour.utils.plugins.require('which-key')

local mappings = {
    t = {
        name = "Terminal",
        f = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>", "Floating Terminal"},
        t = {":ToggleTerm<cr>", "Split Below"},
        l = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<cr>", "LazyGit"}
    },
    l = {i = {":LspInfo", "Connected Language Servers"}},
    x = {":bdelete<cr>", "Close Buffer"},
    q = {":q<cr>", "Quit"},
    Q = {":q!<cr>", "Force Quit"},
    w = {":w<cr>", "Write"},
}

if Vapour.plugins.nvim_tree.enabled then
  mappings.e = {":NvimTreeToggle<cr>", "File Explorerer"}
end

if Vapour.plugins.dashboard.enabled then
  mappings.d = {":Dashboard<cr>", "Dashboard"}
end

if Vapour.plugins.telescope.enabled then
  mappings.f = {
        name = "Telescope",
        f = {"<cmd>Telescope find_files<cr>", "Find Files"},
        r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
        b = {"<cmd>Telescope buffers<cr>", "Buffers"}
    }
end

if Vapour.plugins.nvim_comment.enabled then
  mappings["/"] = {":CommentToggle<cr>", "Toggle Comment"}
end

if not Vapour.settings.always_force_write then
  mappings.W = {":w!<cr>", "Force Write"}
else
  -- map n mode w to w!
end

for starter_key, definition in pairs(Vapour.plugins.which_key.user_defined) do
  assert(mappings[starter_key] == nil, 'which-key aleady has a definition for ' .. starter_key)
  mappings[starter_key] = definition
end

local opts = {prefix = "<leader>"}

wk.register(mappings, opts)
