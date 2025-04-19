return {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.toml" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
				bindingModeHints = {
					enable = true,
				},
				closureReturnTypeHints = {
					enable = true,
				},
				typeHints = {
					enable = true,
				},
				parameterHints = {
					enable = true,
				},
			},
		},
	},
}
