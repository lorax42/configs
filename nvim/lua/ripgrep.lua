local is_installed = vim.fn.executable('rg') == 1

if not is_installed then
  vim.notify('ripgrep is not installed!', 'error')
end

