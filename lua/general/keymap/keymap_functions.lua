local M = {}

function M.switch_to_buffer_by_number()
  local buffer_number = vim.fn.input('Enter buffer number: ')
  local bufnr = tonumber(buffer_number)

  if bufnr and vim.fn.bufexists(bufnr) == 1 then
    vim.cmd('buffer ' .. bufnr)
  else
    print('Buffer number ' .. buffer_number .. ' does not exist.')
  end
end

function M.delete_buffer_by_number()
	local buffer_number = vim.fn.input("Buffer Number to Delete: ")

	buffer_number = tonumber(buffer_number)

	if buffer_number then
		local bufnr = vim.fn.bufnr(buffer_number)

		if bufnr ~= -1 then
			if bufnr == vim.api.nvim_get_current_buf() then
				vim.cmd("bnext")
			end
			vim.api.nvim_buf_delete(bufnr, { force = true })
			print("Deleted buffer " .. buffer_number)
		else
			print("Buffer " .. buffer_number .. " does not exist")
		end
	else
		print("Invalid buffer number")
	end
end

return M
