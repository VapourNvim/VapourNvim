Vapour.utils.plugins.packadd('which-key.nvim')

local wk = Vapour.utils.plugins.require('which-key')

local mappings = {
    f = {
        name = "Telescope",
        f = {"<cmd>Telescope find_files<cr>", "Find Files"},
        r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
        b = {"<cmd>Telescope buffers<cr>", "Buffers"}
    },
    t = {
        name = "Terminal",
        f = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>", "Floating Terminal"},
        t = {":ToggleTerm<cr>", "Split Below"},
        l = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<cr>", "LazyGit"}
    },
    l = {i = {":LspInfo", "Connected Language Servers"}},
    e = {":NvimTreeToggle<cr>", "File Explorer"},
    d = {":Dashboard<cr>", "Dashboard"},
    x = {":bdelete<cr>", "Close Buffer"},
    q = {":q<cr>", "Quit"},
    Q = {":q!<cr>", "Force Quit"},
    w = {":w<cr>", "Write"},
    W = {":w!<cr>", "Force Write"},
    ["/"] = {":CommentToggle<cr>", "Toggle Comment"}
}

local opts = {prefix = "<leader>"}

wk.register(mappings, opts)
