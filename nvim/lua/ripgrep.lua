local is_installed = vim.fn.executable('rg') == 1

if not is_installed then
  print('ripgrep is not installed!')
end

