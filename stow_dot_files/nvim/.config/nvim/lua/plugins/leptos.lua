if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

require("lspconfig").rust_analyzer.setup {
  -- Other Configs ...
  settings = {
    ["rust-analyzer"] = {
      -- Other Settings ...
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            -- "component",
            "server",
          },
        },
      },
    },
  },
}
