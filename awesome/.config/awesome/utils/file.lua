-- https://www.reddit.com/r/lua/comments/xpqabs/comment/iq5i66s/?utm_source=share&utm_medium=web2x&context=3
local function ls(dir, fn)
  local tab = {}
  fn = fn or function(d)
    return d
  end

  for file in io.popen("ls -pa " .. dir .. " | grep -v /"):lines() do table.insert(tab, fn(file)) end
  return tab
end


return {
  ls = ls
}
