MODKEY      = "Mod4"
TERMINAL    = "st"
BROWSER	    = "qutebrowser"
EDITOR      = os.getenv("EDITOR") or "vi"
EDITOR_CMD  = TERMINAL .. " -e " .. EDITOR
SETUP_CMD   = "$HOME/.local/bin/own/fix.sh"
SETUP       = TERMINAL .. " -e " .. SETUP_CMD
NR_OF_TAGS  = 9

return {
    MODKEY      = MODKEY,
    TERMINAL    = TERMINAL,
    BROWSER     = BROWSER,
    EDITOR      = EDITOR,
    EDITOR_CMD  = EDITOR_CMD,
    SETUP       = SETUP,
    NR_OF_TAGS  = NR_OF_TAGS
}
