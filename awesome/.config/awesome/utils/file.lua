-- https://www.reddit.com/r/lua/comments/xpqabs/comment/iq5i66s/?utm_source=share&utm_medium=web2x&context=3
--
local function ls(dir, fn)
  fn = fn or function(d) return d end

  local tab = {}
  local handle = io.popen("ls -pa " .. dir .. " | grep -v /")
  for file in handle:lines() do
    tab[#tab + 1] = fn(file)
  end
  handle:close()

  return tab
end



return {
  ls = ls
}
