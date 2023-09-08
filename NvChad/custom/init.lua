local opt = vim.opt

-- Use relative number with normal number
opt.number = true
opt.relativenumber = true

-- Set color to column 80
opt.colorcolumn = "80"

-- When go down always have several lines visible from the bottom unless
-- you are at the end of the file of course...
opt.scrolloff = 5
