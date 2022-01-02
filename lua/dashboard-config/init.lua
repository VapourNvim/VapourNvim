vim.g.dashboard_custom_header = {
  [[__     __                           _   _       _           ]],
  [[\ \   / /_ _ _ __   ___  _   _ _ __| \ | |_   _(_)_ __ ___  ]],
  [[ \ \ / / _` | '_ \ / _ \| | | | '__|  \| \ \ / / | '_ ` _ \ ]],
  [[  \ V / (_| | |_) | (_) | |_| | |  | |\  |\ V /| | | | | | |]],
  [[   \_/ \__,_| .__/ \___/ \__,_|_|  |_| \_| \_/ |_|_| |_| |_|]],
  [[            |_|                                             ]]
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
  a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
  b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  e = {
    description = {'  Config             '},
    command = 'edit ~/.config/nvim/lua/vapour/user-config/init.lua'
  },
  f = {description = {'  Git                '}, command = 'LazyGit'}
}
vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix philosophy'}
