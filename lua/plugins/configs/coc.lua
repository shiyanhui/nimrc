local common              = require("core.common")
local keyset              = vim.keymap.set
local create_user_command = vim.api.nvim_create_user_command

function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

function _G.show_document()
  local cw = vim.fn.expand("<cword>")
  if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command("h " .. cw)
  elseif vim.api.nvim_eval("coc#rpc#ready()") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

vim.g.coc_global_extensions = {"coc-json", "coc-clangd", "coc-rust-analyzer"}

---------------- Keymaps ----------------
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>",     'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>",   [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],                                         opts)
keyset("i", "<c-space>", 'coc#refresh()',                                                                            {silent = true, expr = true})
keyset("n", "K",         '<CMD>lua _G.show_document()<CR>',                                                          {silent = true})

-- GoTo code navigation
keyset("n", "gd",        '<Plug>(coc-definition)',                                                                   {silent = true})
keyset("n", "gy",        '<Plug>(coc-type-definition)',                                                              {silent = true})
keyset("n", "gi",        '<Plug>(coc-implementation)',                                                               {silent = true})
keyset("n", "gr",        '<Plug>(coc-references)',                                                                   {silent = true})

-- Rename all variables.
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Choose action
keyset("x", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true, nowait = true})
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true, nowait = true})

-- Scroll the floating window.
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-N>", 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<Plug>(coc-diagnostic-next)\'', opts)
keyset("v", "<C-N>", 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<Plug>(coc-diagnostic-next)\'', opts)
keyset("i", "<C-N>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : ""', opts)
keyset("n", "<C-P>", 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<Plug>(coc-diagnostic-prev)\'', opts)
keyset("v", "<C-P>", 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<Plug>(coc-diagnostic-prev)\'', opts)
keyset("i", "<C-P>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : ""', opts)

---------------- Add commands ----------------
create_user_command("Format", "call CocAction('format')", {})
create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
create_user_command("OI", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
