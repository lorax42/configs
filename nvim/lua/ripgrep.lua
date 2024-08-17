local is_installed = vim.fn.executable('rg') == 1

if not is_installed then
  print('ripgrep is not installed. Installing now...')
  vim.fn.system('sudo apt install ripgrep') -- replace with appropriate installation command for your Linux distribution
  print('ripgrep installation complete.')
end

