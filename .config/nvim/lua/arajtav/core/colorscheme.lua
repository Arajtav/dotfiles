local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not status then
    print("colorscheme setup failed")
    return
end

vim.cmd.hi('Normal guibg=NONE ctermbg=NONE')
-- vim.cmd.hi('SignColumn guibg=NONE ctermbg=NONE')
vim.cmd.hi('VertSplit guibg=NONE ctermbg=NONE')
vim.cmd.hi('StatusLine guibg=NONE ctermbg=NONE')
vim.cmd.hi('StatusLineNC guibg=NONE ctermbg=NONE')
vim.cmd.hi('StatusLineTerm guibg=NONE ctermbg=NONE')
vim.cmd.hi('StatusLineTermNC guibg=NONE ctermbg=NONE')
vim.cmd.hi('NormalNC guibg=NONE ctermbg=NONE')
