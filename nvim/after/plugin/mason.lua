require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "rust_analyzer",
    "clangd","pyright","cmake", "taplo", "yamlls","bashls"},
}
