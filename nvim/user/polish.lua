local function augroup(name)
  return vim.api.nvim_create_augroup("chris_" .. name, { clear = true })
end

vim.on_key(function() end, vim.api.nvim_create_namespace "auto_hlsearch")

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})
