require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"html",
		"quick_lint_js",
		"solargraph",
	},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup { capabilities = capabilities }

require("lspconfig").solargraph.setup {
	capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = function(fname)
    return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
  end,
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
}

