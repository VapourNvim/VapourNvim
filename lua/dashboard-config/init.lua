vim.g.dashboard_custom_header = {
    [[__     __                           _   _       _           ]], [[\ \   / /_ _ _ __   ___  _   _ _ __| \ | |_   _(_)_ __ ___  ]],
    [[ \ \ / / _` | '_ \ / _ \| | | | '__|  \| \ \ / / | '_ ` _ \ ]], [[  \ V / (_| | |_) | (_) | |_| | |  | |\  |\ V /| | | | | | |]],
    [[   \_/ \__,_| .__/ \___/ \__,_|_|  |_| \_| \_/ |_|_| |_| |_|]], [[            |_|                                             ]]
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
    e = {description = {'  Config             '}, command = ':e ~/.config/nvim/init.lua'},
    l = {description = {'  Git                '}, command = 'LazyGit'}
}
vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix philosophy'}
