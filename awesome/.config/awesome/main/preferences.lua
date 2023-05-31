local M = {}

M.terminal = "alacritty"
M.editor = os.getenv("EDITOR") or "nvim"
M.editor_cmd = M.terminal .. "-e" .. M.editor
M.modkey = "Mod4"
M.files = "nemo"
M.browser = "brave"

return M
