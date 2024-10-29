-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Disable nvim-cmp for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local cmp = require("cmp")
    -- completely disable
    -- require("cmp").setup.buffer({ enabled = false })

    -- manual complete
    cmp.setup({
      completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.complete(),
      }),
    })
  end,
})
