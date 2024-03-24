local capacity = 10

local notifs = {
  data = {},
}

function notifs.add(notif)
  table.insert(notifs.data, notif)

  if #notifs.data > capacity then
    table.remove(notifs.data, 1)
  end
end

function notifs.length()
  return #notifs.data
end

function notifs.remove_all()
  notifs.data = {}
end

return notifs
