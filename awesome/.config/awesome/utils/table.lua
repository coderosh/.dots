local function is_empty(t)
  local next = next
  if next(t) then
    return false
  else
    return true
  end
end

return {
  is_empty = is_empty,
}
