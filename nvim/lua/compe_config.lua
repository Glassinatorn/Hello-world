vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  --min_length = 1;
  preselect = 'always';
  documentation = true;

  source = {
    path = true;
    --buffer = true;
    calc = true;
    nvim_lsp = true;
    --pell = true;
    ultisnips = true;
    --moji = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
