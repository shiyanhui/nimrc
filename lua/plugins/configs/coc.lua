local common = require("core.common")

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

vim.g.coc_global_extensions = {"coc-json"}

---------------- Keymaps ----------------
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>",     'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>",   [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],                                         opts)
vim.keymap.set("i", "<c-space>", 'coc#refresh()',                                                                            {silent = true, expr = true})
vim.keymap.set("n", "K",         '<CMD>lua _G.show_document()<CR>',                                                          {silent = true})

-- GoTo code navigation
local group = vim.api.nvim_create_augroup("NonSwiftKeymap", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "swift" then
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
    end
  end,
  group = group,
})
-- vim.keymap.set("n", "gd", "<Plug>(coc-definition)",      {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)",  {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)",      {silent = true})

-- Rename all variables.
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Choose action
vim.keymap.set("x", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true, nowait = true})
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true, nowait = true})

-- Scroll the floating window.
local opts = {silent = true, nowait = true, expr = true}
vim.api.nvim_set_keymap("n", "<C-N>", 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<Plug>(coc-diagnostic-next)\'', opts)
vim.api.nvim_set_keymap("v", "<C-N>", 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<Plug>(coc-diagnostic-next)\'', opts)
vim.api.nvim_set_keymap("i", "<C-N>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : ""', opts)
vim.api.nvim_set_keymap("n", "<C-P>", 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<Plug>(coc-diagnostic-prev)\'', opts)
vim.api.nvim_set_keymap("v", "<C-P>", 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<Plug>(coc-diagnostic-prev)\'', opts)
vim.api.nvim_set_keymap("i", "<C-P>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : ""', opts)

---------------- Add commands ----------------
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
vim.api.nvim_create_user_command("OI", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
