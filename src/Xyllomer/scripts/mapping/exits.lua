
xyllomer.CARDINAL_EXITS_LONG = {"north", "south", "east", "west", "northeast", "northwest", "southeast", "southwest", "up", "down","out"}
xyllomer.CARDINAL_EXITS_SHORT = {"n", "s", "e", "w", "ne", "nw", "se", "sw", "u", "d","out"}

xyllomer.CARDINAL_EXITS_SHRINK = {north = "n", south = "s", east = "e", west = "w", northeast = "ne", northwest = "nw", southeast = "se", southwest = "sw", up = "u", down = "d", out = "out"}

function xyllomer.map:isCardinalExit(command)
  local isCardinal = false

  if table.contains(xyllomer.CARDINAL_EXITS_LONG, command) or table.contains(xyllomer.CARDINAL_EXITS_SHORT, command) then
    isCardinal = true
  end

  return isCardinal
end

function xyllomer.map:getShortExit(command)
  if table.contains(xyllomer.CARDINAL_EXITS_SHORT, command) then
    return command
  elseif table.contains(xyllomer.CARDINAL_EXITS_LONG, command) then
    return xyllomer.CARDNAL_EXITS_SHRINK[command]
  end
end

function xyllomer.map:connectExits(room_id,room_data)
  local exits = room_data.Info.exits
  local target_id
  
  for direction, room in pairs(exits) do
    target_id = xyllomer.map:ConvertRoomNumberToID(room)
    if roomExists(target_id) then
      setExit(room_id, target_id, direction)
    else
      local zone_id = getRoomArea(room_id)
      xyllomer.map:createTempRoom(target_id)
      setExit(room_id, target_id, direction)
    end
  end
  
end



function xyllomer.map:connectSpecialExits(room_id,room_data)
  local exits = room_data.Info.special
  local target_id
  
  for direction, room in pairs(exits) do
    target_id = xyllomer.map:ConvertRoomNumberToID(room)
    if roomExists(target_id) then
      addSpecialExit(room_id, target_id, direction)
    else
      local zone_id = getRoomArea(room_id)
      xyllomer.map:createTempRoom(target_id)
      addSpecialExit(room_id, target_id, direction)
    end
  end  
end


