local capacity = 10

local notifs = {
  data = {},
}

function notifs.add(notif)
  table.insert(notifs.data, 1, notif)

  if #notifs.data > capacity then
    table.remove(notifs.data)
  end
end

function notifs.length()
  return #notifs.data
end

function notifs.remove_all()
  notifs.data = {}
end

function notifs.remove(i)
  table.remove(notifs.data, i)
end

function notifs.get_data()
  return notifs.data
end

return notifs
