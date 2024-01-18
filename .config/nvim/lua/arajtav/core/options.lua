local opt = vim.opt

opt.number = true
opt.hlsearch = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

opt.autoread = true
opt.cdhome = true
opt.spell = true
opt.spelllang = { 'en_us' }
opt.title = true

opt.clipboard:append("unnamedplus")

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'
opt.relativenumber = true

opt.updatetime = 200
opt.timeoutlen = 250

opt.termguicolors = true

opt.wrap = false
opt.cursorline = true

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = false

opt.iskeyword:append("-")
