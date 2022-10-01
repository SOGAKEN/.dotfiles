local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },

  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'nvim_lsp_signature_help'},
    {name = 'path'},
    {name = 'buffer'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
    {name = 'cmdline'},
    {name = 'git'},
  }),
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,
}
