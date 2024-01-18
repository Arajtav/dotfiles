local status, lualine = pcall(require, "lualine")
if not status then
    print("lualine failed")
    return
end

lualine.setup()
