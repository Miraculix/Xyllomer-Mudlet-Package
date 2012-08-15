function doSpeedWalk()

  if #speedWalkPath == 0 then
    xyllomer.log:error("No speedwalk path found!")
  end
  xyllomer.log:debug("speedwalk");
  local exits = xyllomer.map:getAllExits(xyllomer.map.current_room)
  local path = {}

  for i, room_id in pairs(speedWalkPath) do
    for j, exit in pairs(exits) do
      if tonumber(room_id) == exit then
        table.insert(path, j)
        break
      end
    end
    exits = xyllomer.map:getAllExits(room_id)
  end
  --xyllomer.log:debug(path);
  while path[1] do 
    send(table.remove(path, 1))
  end
end

function xyllomer.map:getAllExits(room_id)
  local exits = getRoomExits(room_id)
  local sexits = getSpecialExitsSwap(room_id)
  return xyllomer.map:concatTables(exits, sexits)
end

function xyllomer.map:concatTables(table1, table2)
  local output = {}
  for i,v in pairs(table1) do
    output[i] = v
  end
  for i,v in pairs(table2) do
    output[i] = v
  end
  return output
end
