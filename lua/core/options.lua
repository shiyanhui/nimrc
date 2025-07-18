-- important
vim.o.compatible = false
vim.o.paste      = false

-- moving around, searching and patterns
vim.o.startofline  = true
vim.o.incsearch    = true
vim.o.magic        = true
vim.o.ignorecase   = true
vim.o.smartcase    = true
vim.o.regexpengine = 1
vim.o.jumpoptions  = "stack"

-- displaying text
vim.o.scrolloff     = 8
vim.o.sidescrolloff = 10
vim.o.fillchars     = "vert: ,fold:·,eob: "
vim.o.number        = true
vim.o.wrap          = true
vim.o.lazyredraw    = false

-- syntax, highlighting and spelling
vim.cmd [[
  syntax on
]]
vim.o.background    = "dark"
vim.o.hlsearch      = true
vim.o.cursorline    = false
vim.o.cursorcolumn  = false
vim.o.termguicolors = true

-- multiple windows
vim.o.laststatus = 3
vim.o.hidden     = true
vim.o.ttyfast    = true
vim.o.splitright = false
vim.o.splitbelow = false
vim.o.winborder  = "rounded"

-- messages and info
vim.o.shortmess = "atIq"
vim.o.showcmd   = true
vim.o.showmode  = true
vim.o.ruler     = true
vim.o.report    = 0

-- selecting text
vim.o.clipboard = "unnamedplus"

-- editing text
vim.o.undolevels    = 1024
vim.o.undofile      = true
vim.o.backspace     = "indent,eol,start"
vim.o.matchpairs    = "(:),{:},[:]"
vim.o.formatoptions = vim.o.formatoptions:gsub("r", "")
vim.o.completeopt   = ""

-- tabs and indenting
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.smarttab    = true
vim.o.softtabstop = 4
vim.o.shiftround  = true
vim.o.expandtab   = true
vim.o.autoindent  = true
vim.o.smartindent = true

-- folding
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "0"
vim.o.foldlevel  = 99

-- reading and writing files
vim.o.write       = true
vim.o.writebackup = false
vim.o.backup      = false
vim.o.autowrite   = false
vim.o.writeany    = false
vim.o.autoread    = true
vim.o.fsync       = true

-- the swap file
vim.o.swapfile   = false
vim.o.updatetime = 300

-- command line editing
vim.o.history    = 1024
vim.o.wildignore = "*.o,*.obj,*.swp,*.pyc,*.bak,*.tmp"
vim.o.wildmenu   = true

-- multi-byte characters
vim.o.encoding  = "utf-8"
vim.o.ambiwidth = "single"

-- various
vim.o.loadplugins = true
vim.o.signcolumn  = "number"

-- terms options
vim.o.ffs        = "unix,dos,mac"
vim.o.visualbell = true
vim.o.scrolljump = 5
