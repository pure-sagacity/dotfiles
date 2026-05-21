return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {}, -- This clears the auto-detected schemas (like K8s)
              completion = false, -- This turns off the completion for YAML
            },
          },
        },
      },
    },
  },
}
