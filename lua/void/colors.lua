vim.cmd.colorscheme("oxocarbon")

local highlights = {
  Normal = { bg = "#080808" },
  NormalNC = { bg = "#080808" },
  NormalFloat = { bg = "#0c0c0c" },
  FloatBorder = { fg = "#303030", bg = "#0c0c0c" },
  FloatTitle = { bg = "#0c0c0c" },
  Pmenu = { bg = "#0c0c0c" },
  PmenuSbar = { bg = "#151515" },
  PmenuThumb = { bg = "#444444" },
  CursorLine = { bg = "#111111" },
  CursorColumn = { bg = "#111111" },
  ColorColumn = { bg = "#111111" },
  LineNr = { bg = "#080808" },
  SignColumn = { bg = "#080808" },
  FoldColumn = { bg = "#080808" },
  EndOfBuffer = { fg = "#151515", bg = "#080808" },
  StatusLine = { bg = "#080808" },
  StatusLineNC = { bg = "#0c0c0c" },
  WinSeparator = { fg = "#242424", bg = "#080808" },
  VertSplit = { fg = "#242424", bg = "#080808" },
  TabLine = { bg = "#0c0c0c" },
  TabLineFill = { bg = "#080808" },
  TabLineSel = { bg = "#151515" },
}

for group, style in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, style)
end
