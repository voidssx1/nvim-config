return {
  {
    "karb94/neoscroll.nvim",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,
      easing = "sine",
    },
    config = function(_, opts)
      local neoscroll = require("neoscroll")
      neoscroll.setup(opts)

      vim.keymap.set({ "n", "x" }, "<ScrollWheelDown>", function()
        neoscroll.scroll(3, { move_cursor = false, duration = 150, easing = "sine" })
      end, { desc = "Smooth scroll down" })
      vim.keymap.set({ "n", "x" }, "<ScrollWheelUp>", function()
        neoscroll.scroll(-3, { move_cursor = false, duration = 150, easing = "sine" })
      end, { desc = "Smooth scroll up" })

      vim.keymap.set({ "n", "x" }, "<C-d>", function()
        neoscroll.ctrl_d({ duration = 400, easing = "sine" })
      end, { desc = "Smooth scroll down half page" })
      vim.keymap.set({ "n", "x" }, "<C-u>", function()
        neoscroll.ctrl_u({ duration = 400, easing = "sine" })
      end, { desc = "Smooth scroll up half page" })
      vim.keymap.set({ "n", "x" }, "<C-f>", function()
        neoscroll.ctrl_f({ duration = 550, easing = "sine" })
      end, { desc = "Smooth scroll down full page" })
      vim.keymap.set({ "n", "x" }, "<C-b>", function()
        neoscroll.ctrl_b({ duration = 550, easing = "sine" })
      end, { desc = "Smooth scroll up full page" })
    end,
  },
}
