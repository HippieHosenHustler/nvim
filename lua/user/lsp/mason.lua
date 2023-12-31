local servers = {
	"lua_ls",
	"jsonls",
    "html",
    "eslint",
    "rust_analyzer",
    "apex_ls",
}
local apex_jar_path = "/Users/edwinscharfe/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar"
require'lspconfig'.apex_ls.setup {
  apex_jar_path = apex_jar_path,
  apex_enable_semantic_errors = true,
  apex_enable_completion_statistics = true,
  filetypes = {'apex'}
}
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local apex_jar_path = "/Users/edwinscharfe/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar" 
require'lspconfig'.html.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.apex_ls.setup {
  apex_jar_path = apex_jar_path,
  apex_enable_semantic_errors = true,
  apex_enable_completion_statistics = true,
  filetypes = {'apex'}
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
