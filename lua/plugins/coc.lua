local common  = require('common')

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_document()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

vim.g.coc_global_extensions = {'coc-json', 'coc-clangd', 'coc-rust-analyzer'}

-- Keymaps
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', {silent = true, expr = true, noremap = true, replace_keycodes = false})
vim.keymap.set('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', {silent = true, expr = true, noremap = true, replace_keycodes = false})
vim.keymap.set('n', 'K', '<CMD>lua _G.show_document()<CR>', {silent = true})
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true, remap = true})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent = true, remap = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true, remap = true})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true, remap = true})
vim.keymap.set('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true})

-- Rename all variables.
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {remap = true})

-- Choose action
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', {remap = true})

-- Scroll the floating window.
vim.keymap.set({'n', 'v'}, '<C-N>', 'coc#float#has_scroll() ? coc#float#scroll(1) : ""', {silent = true, nowait = true, expr = true})
vim.keymap.set('i', '<C-N>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : ""', {silent = true, nowait = true, expr = true})
vim.keymap.set({'n', 'v'}, '<C-P>', 'coc#float#has_scroll() ? coc#float#scroll(0) : ""', {silent = true, nowait = true, expr = true})
vim.keymap.set('i', '<C-P>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : ""', {silent = true, nowait = true, expr = true})

-- Add commands
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
vim.api.nvim_create_user_command("OI", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Disable some file types
-- vim.cmd [[
  -- augroup CocGroup
    -- autocmd!
    -- autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
  -- augroup end
-- ]]
