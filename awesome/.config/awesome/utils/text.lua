local function colored_text(text, color)
  if color then
    return string.format([[<span foreground="%s">%s</span>]], color, text)
  end

  return text
end

return {
  colored_text = colored_text,
}
