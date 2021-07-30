Vapour.utils.plugins.packadd('which-key.nvim')

local wk = Vapour.utils.plugins.require('which-key')

local mappings = {
    l = {name = "LSP", i = {":LspInfo<cr>", "Connected Language Servers"}},
    x = {":bdelete<cr>", "Close Buffer"},
    X = {":bdelete!<cr>", "Force Close Buffer"},
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

for plugin, plugin_options in pairs(Vapour.plugins) do
  if plugin_options.which_key ~= nil and plugin_options.enabled then
    local whichkey_opts = plugin_options.which_key

    local whichkey_mappings = {}

    if mappings[whichkey_opts.root] ~= nil then
      whichkey_mappings = mappings[whichkey_opts.root]

      for key, actions in pairs(mappings[whichkey_opts.root]) do
        whichkey_mappings[key] = actions
      end
    else
      whichkey_mappings = {
        -- Give a special name if provided otherwise just use the plugin name
        name = whichkey_opts.name or plugin
      }
    end

    for key, actions in pairs(whichkey_opts.definitions) do
      whichkey_mappings[key] = actions
    end

    mappings[whichkey_opts.root] = whichkey_mappings
  end
end

mappings = Vapour.utils.tables.copy(mappings, Vapour.plugins.which_key.user_defined)

local opts = {prefix = "<leader>"}

wk.register(mappings, opts)
