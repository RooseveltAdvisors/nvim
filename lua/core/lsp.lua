local server_definitions = {
	{
		name = "go",
		root_files = { "go.mod" },
		cmd = { "gopls" },
		init_opts = nil,
		file_patterns = "go",
		docs = 'Install command: go install golang.org/x/tools/gopls@latest',
	},
	{	
		name = "HTML",
		root_files = { ".git" },
		cmd = { "vscode-html-language-server", "--stdio" },
		init_options = {
      provideFormatter = true,
      embeddedLanguages = { css = true, javascript = true },
      configurationSection = { 'html', 'css', 'javascript' },
    },
 		file_patterns = {'html', 'templ'},
		docs = 'Install command: npm install -g vscode-languageservers-extracted',
	},
	{
		name = "CSS",
		root_files = { ".git" },
		cmd = { "vscode-css-language-server", "--stdio" },
		init_opts = {
			provideFormatter = true,
		},
		file_patterns = {'css', 'scss', 'sass', 'less'},
		docs = 'Install command: npm install -g vscode-languageservers-extracted',
	},
	{
		name = "HTMX",
		root_files = { ".git" },
		cmd = { "htmx-lsp" },
		init_opts = {
			single_file_supported = true,
		},
		file_patterns = { -- filetypes copied and adjusted from tailwindcss-intellisense
      -- html
      'aspnetcorerazor',
      'astro',
      'astro-markdown',
      'blade',
      'clojure',
      'django-html',
      'htmldjango',
      'edge',
      'eelixir', -- vim ft
      'elixir',
      'ejs',
      'erb',
      'eruby', -- vim ft
      'gohtml',
      'gohtmltmpl',
      'haml',
      'handlebars',
      'hbs',
      'html',
      'htmlangular',
      'html-eex',
      'heex',
      'jade',
      'leaf',
      'liquid',
      'markdown',
      'mdx',
      'mustache',
      'njk',
      'nunjucks',
      'php',
      'razor',
      'slim',
      'twig',
      -- js
      'javascript',
      'javascriptreact',
      'reason',
      'rescript',
      'typescript',
      'typescriptreact',
      -- mixed
      'vue',
      'svelte',
      'templ',
    },
		docs = 'Install command: cargo install htmx-lsp',
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


for _, server in ipairs(server_definitions) do
	local function start_server_callback()
		setup_server(server.name, server.root_files, server.cmd, server.init_opts)
	end
	
	vim.api.nvim_create_autocmd('FileType', {
		pattern = server.file_patterns,
		desc = 'Start' .. server.name .. ' LSP',
		callback = start_server_callback,
	})
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append('c')

local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to next item in completion menu
    return '<Down>'
  end

  local c = vim.fn.col('.') - 1
  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')

  if is_whitespace then
    -- insert tab
    return '<Tab>'
  end

  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'

  if lsp_completion then
    -- trigger lsp code completion
    return '<C-x><C-o>'
  end

  -- suggest words in current buffer
  return '<C-x><C-n>'
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return '<Up>'
  end

  -- insert tab
  return '<Tab>'
end

vim.keymap.set('i', '<Tab>', tab_complete, {expr = true})
vim.keymap.set('i', '<S-Tab>', tab_prev, {expr = true})
