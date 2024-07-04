return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
        config = function()
		local ci = require("nvim-treesitter.configs")
		ci.setup({
		  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "java" },
		  sync_install = false,
		  highlight = { enable = true },
		  indent = { enable = true }
		})
	end
}
