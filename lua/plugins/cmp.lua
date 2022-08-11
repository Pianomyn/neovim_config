

vim.opt.completeopt = "menu,menuone,noselect"
local cmp = require("cmp")
local luasnip = require("luasnip")


cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = {
    ["<C-k"] = cmp.mapping.select_prev_item(),
    ["<C-j"] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
	      elseif luasnip.expandable() then
                luasnip.expand()
            elseif cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
	    	fallback()
            end
          end, {"i", "s"}),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
	     elseif luasnip.jumpable(-1) then
	    	luasnip.jump(-1)
            else
              fallback()
            end
          end,{"i", "s"}),
	  ["<C-y>"] = cmp.mapping(cmp.mapping.complete({
        reason = cmp.ContextReason.Auto,
      }), {"i", "c"}),
        ["<CR>"] = cmp.mapping.confirm ({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        {name = "nvim_lua"},
    },
    confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  })
