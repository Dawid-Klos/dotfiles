-- Keymaps are automatically loaded on the VeryLazy event

-- awesome keymaps from theprimeagen btw
-- credits: theprimeagen

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the highlighted text down", remap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the highlighted text up", remap = true })

map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in the middle", remap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in the middle", remap = true })

map("n", "n", "nzzzv", { desc = "Jump to the next line below", remap = true })
map("n", "J", "mzJ`z", { desc = "Append current line at the end of above line", remap = true })
map("n", "N", "Nzzzv", { desc = "Jump to the next line above", remap = true })

-- greatest remap ever
map("x", "<leader>p", [["_dP]], { desc = "Paste yanked text and keep yank", remap = true })

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into os clipboard", remap = true })
map("n", "<leader>Y", [["+Y]], { desc = "Yank into vim clipboard", remap = true })

map(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Edit current word across file", remap = true }
)
