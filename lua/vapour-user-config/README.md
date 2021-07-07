Use this directory to put any configurations you want.

Just create an `init.lua` file here and update that.

For example, to install FTerm:

```
Vapour.user_plugins = {
  {"numtostr/FTerm.nvim", config = function() require("FTerm").setup() end}
}
```

Change a Vim configuration like so: `vim.o.hidden = false`

`init.lua` is used to load in these changes, but you can put whatever you like within this directory.
