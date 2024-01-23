local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("mason failed")
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    print("mason lspconfig failed")
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "asm_lsp",
        "arduino_language_server",
        "clangd",
        "cssls",
        "html",
        "intelephense",
        "pylsp",
        "sqls",
        "tailwindcss",
        "tsserver",
        "gopls",
    },
})
