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
    local node_root_dir = lspconfig.util.root_pattern("package.json")
    local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

    local opts = {}

    if server_name == "tsserver" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "eslint" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "denols" then
      if is_node_repo then
        return
      end

      opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
      opts.init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true
            }
          }
        }
      }
    end

    opts.on_attach = function(_, bufnr)
      -- 略
    end
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,

}
