local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    print("nvim tree failed")
    return
end

vim.g.loaded =1
vim.g.netrwPlugin = 1

nvimtree.setup()
