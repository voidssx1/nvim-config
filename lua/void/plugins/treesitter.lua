return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      if vim.fn.executable("tree-sitter") ~= 1 then
        local candidates = vim.fn.glob("/nix/store/*-tree-sitter-*/bin/tree-sitter", false, true)
        for _, executable in ipairs(candidates) do
          if vim.fn.executable(executable) == 1 then
            vim.env.PATH = vim.fs.dirname(executable) .. ":" .. vim.env.PATH
            break
          end
        end
      end

      if vim.fn.executable("tree-sitter") == 1 then
        ts.install({
          "bash", "c", "cpp", "go", "json", "lua", "markdown",
          "markdown_inline", "python", "rust", "toml", "vim", "vimdoc", "yaml",
        })
      else
        vim.notify("tree-sitter-cli is not on PATH; Tree-sitter parsers were not installed", vim.log.levels.WARN)
      end
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
          local language = vim.treesitter.language.get_lang(event.match)
          if language then pcall(vim.treesitter.start, event.buf, language) end
        end,
        desc = "Enable Tree-sitter highlighting",
      })
    end,
  },
}
