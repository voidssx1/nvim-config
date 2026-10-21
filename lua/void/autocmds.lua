local group = vim.api.nvim_create_augroup("void_config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function() vim.highlight.on_yank() end,
  desc = "Highlight yanked text",
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "c", "cpp", "go", "python", "rust", "lua" },
  callback = function(event)
    vim.bo[event.buf].formatoptions = vim.bo[event.buf].formatoptions:gsub("[cro]", "")
  end,
  desc = "Avoid automatic comment continuation",
})
