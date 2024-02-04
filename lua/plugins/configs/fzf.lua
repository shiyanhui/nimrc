vim.g.fzf_history_dir         = '~/.local/share/fzf-history'
vim.g.fzf_buffers_jump        = true
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
vim.g.fzf_tags_command        = 'ctags -R'
vim.g.fzf_commands_expect     = 'alt-enter,ctrl-x'
vim.g.fzf_layout              = { window = { width = 0.88, height = 0.66 } }

vim.keymap.set('n', '<Leader>f', ':Files<CR>')
vim.keymap.set('n', '<Leader>b', ':Buffers<CR>')
vim.keymap.set('n', '<Leader>ag', ':Ag<CR>')

vim.cmd [[
  command! -bang -nargs=* Ag call fzf#vim#ag(
    \ <q-args>, {'options': extend(get(fzf#vim#with_preview(), 'options', []), ['--delimiter', ':', '--nth', '4..'])}, <bang>0)
]]
