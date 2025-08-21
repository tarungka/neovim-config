return function()
  local cmp = require("cmp")
  
  -- Enhanced search completion (/ and ?)
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline({
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
    }),
    sources = cmp.config.sources({
      { name = "buffer", keyword_length = 3 }
    }),
    formatting = {
      fields = { "abbr" },
      format = function(entry, vim_item)
        vim_item.menu = "[Search]"
        return vim_item
      end,
    },
    window = {
      completion = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      }),
    },
  })
  
  -- Enhanced command completion (:)
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline({
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
    }),
    sources = cmp.config.sources({
      { 
        name = "path",
        option = {
          trailing_slash = true,
          label_trailing_slash = true,
        }
      },
    }, {
      { 
        name = "cmdline",
        keyword_length = 2,
        option = {
          ignore_cmds = { "Man", "!" }
        }
      },
    }),
    formatting = {
      fields = { "abbr", "menu" },
      format = function(entry, vim_item)
        local source_names = {
          path = "[Path]",
          cmdline = "[Cmd]",
        }
        vim_item.menu = source_names[entry.source.name] or "[Unknown]"
        
        -- Add icons for different command types
        if entry.source.name == "cmdline" then
          local cmd = vim_item.abbr:match("^(%S+)")
          if cmd then
            local cmd_icons = {
              ["Telescope"] = "🔭",
              ["Mason"] = "🔨",
              ["Lazy"] = "💤",
              ["checkhealth"] = "🏥",
              ["help"] = "❓",
              ["write"] = "💾",
              ["quit"] = "🚪",
              ["edit"] = "📝",
            }
            local icon = cmd_icons[cmd] or "⚡"
            vim_item.abbr = icon .. " " .. vim_item.abbr
          end
        elseif entry.source.name == "path" then
          vim_item.abbr = "📁 " .. vim_item.abbr
        end
        
        return vim_item
      end,
    },
    window = {
      completion = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        max_height = 10,
        max_width = 60,
      }),
    },
    experimental = {
      ghost_text = true,
    },
  })
end
