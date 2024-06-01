-- Manually set snippet tab keymap due to copilot conflict
-- When presented with both, snippet always wins
return {
  {
    "L3MON4D3/LuaSnip",
    -- Disable default <Tab> keybindings
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",

    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.jump(1)
        else
          -- Let copilot handle the rest
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<S-CR>"] = nil

      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
}
