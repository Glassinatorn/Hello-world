MODKEY	    = "Mod4"
TERMINAL    = "st"
BROWSER	    = "qutebrowser"
EDITOR	    = os.getenv("EDITOR") or "vi"
EDITOR_CMD  = TERMINAL .. " -e " .. EDITOR

return {
    MODKEY	= MODKEY,
    TERMINAL	= TERMINAL,
    BROWSER	= BROWSER,
    EDITOR	= EDITOR,
    EDITOR_CMD	= EDITOR_CMD,
}
