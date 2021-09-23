-- shortening api call
local g = vim.g

g.coq_settings = {
    auto_start = true,
    keymap = {
	jump_to_mark = "<tab>" 
    },
    display = {
	-- ghost_text = {
	--     enabled = true,
	--     context = {" (  ", "  )  "},
	--     highlight_group = "Comment"
	-- },
	-- pum = {
	--     fast_close = true,

	--     y_max_len = 16,
	--     y_ratio = 0.3,

	--     x_max_len = 66,
	--     x_truncate_len = 12,

	--     ellipsis = {
	-- 	kind_context = {" [", "] "},
	-- 	source_context = {" '", "' "}
	--     }
	-- },
	preview = {
	    x_max_len = 88,
	    resolve_timeout = 0.09,
	    border = "double",

	    positions = {
		north = 1,
		south = 2,
		west = 3
	    }
	}
    }
    -- clients = {
    --     snippets = {
    --         enabled = true,
    --         short_name = "snippet",
    --         sources = {"UltiSnips"},
    --         tie_breaker = 5,
    --     }
    -- },
}
