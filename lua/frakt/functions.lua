vim.keymap.set("n", "yyp", function()
	local col = vim.fn.virtcol(".")
	vim.cmd("normal! yyp")
	vim.fn.cursor(vim.fn.line("."), col)
end, { desc = "yyp but stay in same column" })

-- delete trailing spaces on saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})
