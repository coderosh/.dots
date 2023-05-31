local function colored_text(icon, fg)
  return string.format([[<span foreground="%s">%s</span>]], fg, icon)
end

return {
  colored_text = colored_text,
}
