local server_definitions = {
	{
		name = "gopls",
		root_files = { "go.mod" },
		cmd = { "gopls" },
		init_opts = nil,
		file_patterns = "go", 
	},
}

local function setup_server(name, root_files, cmd, init_opts) 
	local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
	local root_dir = vim.fs.dirname(paths[1])

	if root_dir == nil then
		print("Could not find root directory for " .. name)
		return
	end

	vim.lsp.start({
		name = name,
		cmd = cmd,
		root_dir = root_dir,
		init_options = init_opts,
	})
end

print('Setting up LSP servers')

for _, server in ipairs(server_definitions) do
	local function start_server_callback()
		print("Starting " .. server.name .. " LSP")
		setup_server(server.name, server.root_files, server.cmd, server.init_opts)
	end
	
	print("Setting up " .. server.name .. " LSP autocommand")
	vim.api.nvim_create_autocmd('FileType', {
		pattern = server.file_patterns,
		desc = 'Start' .. server.name .. ' LSP',
		callback = start_server_callback,
	})
end
