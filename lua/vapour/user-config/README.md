Use this directory to put any configurations you want.

Just create an `init.lua` file here and update that.

## Plugins

To install plugins, set the `Vapour.plugins.user` property.

For example, to install FTerm::

```
Vapour.plugins.user = {
    {"numtostr/FTerm.nvim", config = function() require("FTerm").setup() end}
}
```

If the plugin requires set up (i.e.: `require("FTerm").setup {}`) then you can either put it in the plugin object itself (like above), or add a file or folder to `vapour-user-config`.

## NeoVim Settings

Change a Vim configuration like so: `vim.o.hidden = false`

`init.lua` is used to load in these changes, but you can put whatever you like within this directory.
