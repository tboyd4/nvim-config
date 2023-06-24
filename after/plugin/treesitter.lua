require'nvim-treesitter.configs'.setup {
	-- parsers to ensure installed
	ensure_isntalled = { "c", "lua", "vim", "vimdoc", "query" },

	-- install parsers synchronously
	sync_install = false,

	-- automatically install missing parsers when entering buffer
	auto_install = true,

	-- list of parsers to ignore installing
	ignore_install = { },

	-- highlight settings
	highlight = {
		enable = true,

		-- certain languages we can disable highlighting
		disable = {},

		-- we can disable highlighting in large files to keep things speedy
		disable = function(lang, buf)
			local max_filesize = 100 * 1024
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- look this up if it ever becomes relevant
		additional_vim_regex_highlighting = false,
	},
}
