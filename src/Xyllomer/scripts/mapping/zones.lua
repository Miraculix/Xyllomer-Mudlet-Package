-- Handles all zone related functions

function xyllomer.map:createFakeZone()

  if not xyllomer.map:isKnownZone("fake_zone") then
    xyllomer.map:createZone("fake_zone")
  end
  xyllomer.log:debug("Created fake zone for storing unmapped exits")
end

function xyllomer.map:resetZone(zone_name)
  local zone_found, zone_id = xyllomer.map:isKnownZone(zone_name)

  if not zone_found then
    xyllomer.log:error("Zone not found - can't reset")
  else
    local rooms = getAreaRooms(zone_id)

    if not rooms then
      xyllomer.log:info("No rooms to remove in "..zone_name)
      return
    end

    for room_name, room_id in pairs(rooms) do
      deleteRoom(room_id)
    end
    xyllomer.log:info("Removed all rooms from zone "..zone_name)
  end
end

function xyllomer.map:isKnownZone(zone_name)
  local zones = getAreaTable()
  local zone_found = false
  local found_zone_id = nil
  
  for known_zone_name, zone_id in pairs(zones) do
    if known_zone_name == zone_name then
      zone_found = true
      found_zone_id = zone_id
      --xyllomer.log:debug("Found zone as id "..zone_id)
      break
    end
  end

  
  return zone_found, found_zone_id

end
 
function xyllomer.map:createZone(new_zone_name)
  local new_zone_id = nil

  if not xyllomer.map:isKnownZone(new_zone_name) then
    new_zone_id = addAreaName(new_zone_name)
    xyllomer.log:debug("New zone "..new_zone_name.." created with id: "..new_zone_id)
  else
    xyllomer.log:debug("Zone already exists, not creating new zone")
  end

  return new_zone_id
end

function xyllomer.map:getZoneId(zone_name)
  local found, zone_id = xyllomer.map:isKnownZone(zone_name)
  if not found then
    zone_id = xyllomer.map:createZone(zone_name)
  end

  return zone_id
end

function xyllomer.map:setZone(zone_name)
  
  -- Set this zone as the active zone
  local zone_id = xyllomer.map:getZoneId(zone_name)
  if zone_id then
    xyllomer.map.current_zone = zone_name
  else
    xyllomer.map:error("Failed to set zone!")
  end
  xyllomer.log:debug("Current zone is now: "..xyllomer.map.current_zone)

end


