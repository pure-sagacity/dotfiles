return {
  -- Catppuccin theme with transparency
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- Choose "latte", "frappe", "macchiato", or "mocha"
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.overlay0 },
        }
      end,
    },
  },

  -- Override LazyVim's default colorscheme
  --{ "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
