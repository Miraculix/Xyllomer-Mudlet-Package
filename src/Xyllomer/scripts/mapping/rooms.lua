
function xyllomer.map:createTempRoom(room_id)
  local found_zone, zone_id = xyllomer.map:isKnownZone("fake_zone")
  addRoom(room_id)
  setRoomName(room_id, "Unexplored Room")
  setRoomArea(room_id, zone_id)  
  setRoomEnv(room_id, 999)
end

function xyllomer.map:createUnmappedRoom(room_id)
  if ( roomExists(room_id) ) then
    return
  end
  local found_zone, zone_id = xyllomer.map:isKnownZone("fake_zone")
  addRoom(room_id)
  setRoomName(room_id, "Unmapped Room")
  setRoomArea(room_id, zone_id)  
  setRoomEnv(room_id, 999)
end

function  xyllomer.map:UpdateRoomData( room_id )
    setRoomUserData(room_id, "timestamp", gmcp.Room.Info.timestamp);
    setRoomUserData(room_id, "subzone", gmcp.Room.Info.subzone or "");
    setRoomUserData(room_id, "id", gmcp.Room.Info.id);
    setRoomCoordinates(room_id, gmcp.Room.Info.coord.x, gmcp.Room.Info.coord.y, gmcp.Room.Info.coord.z);    
end

-- move a room to the according area. E.g. from fake-zone
function  xyllomer.map:moveRoom( room_id )
  local found_zone, zone_id = xyllomer.map:isKnownZone(gmcp.Room.Info.zone)
  local room_name = gmcp.Room.Info.name
  
  xyllomer.log:debug("Moving room "..room_id.." to zone "..zone_id);
  
  if not found_zone then
    xyllomer.log:error("Unknown zone! Can't create room in an unknown zone")
    return
  end
  
  setRoomName(room_id, room_name);
  setRoomArea(room_id, zone_id);
  xyllomer.map:UpdateRoomData(room_id);       
  
  local terrain_id = xyllomer.map.terrain[gmcp.Room.Info.terrain] 

  if terrain_id then
    setRoomEnv(room_id, terrain_id)
  else
    setRoomEnv(room_id ,xyllomer.map.terrain["inside"]);
  end
  xyllomer.log:debug("env set");
  xyllomer.map.current_room = room_id
  xyllomer.map:connectExits(room_id,gmcp.Room)
  xyllomer.map:connectSpecialExits(room_id)
  xyllomer.log:debug("done moving");
end

function xyllomer.map:createRoom(room_id) 
  local isCreated = false
  local found_zone, zone_id = xyllomer.map:isKnownZone(gmcp.Room.Info.zone)
  local room_name = gmcp.Room.Info.name

  if not found_zone then
    xyllomer.log:error("Unknown zone! Can't create room in an unknown zone")
    return
  end

  xyllomer.log:debug("Attempting to create room for "..room_id)
  if room_id == -1 then
    xyllomer.log:error("Unable to create room - no room id given by mud")
    return
  end

  isCreated = addRoom(room_id)
  setRoomName(room_id, room_name)
  setRoomArea(room_id, zone_id)
  
  xyllomer.map:UpdateRoomData(room_id);     
  
  local terrain_id = xyllomer.map.terrain[gmcp.Room.Info.terrain]
  if terrain_id then
    setRoomEnv(room_id, terrain_id)
  end

  -- If there is no prior room, then this is the first room of the map
  if not xyllomer.map.prior_room then    
    xyllomer.map.prior_room = room_id
    xyllomer.log:debug("Created first map room for id "..room_id)
  else
    xyllomer.map.prior_room = xyllomer.map.current_room
    xyllomer.log:debug("Attempting to find coords for new room")
   
    local rooms_at_location = getRoomsByPosition(zone_id, gmcp.Room.Info.coord.x, gmcp.Room.Info.coord.y, gmcp.Room.Info.coord.z)
    if table.size(rooms_at_location) > 1 then 
      xyllomer.log:debug("Found colliding rooms... Map clutch!")
      sendGMCP("Client.RoomClutch \"".. gmcp.Room.Info.id.."\"");
    end        
  end

  xyllomer.map.current_room = room_id
  xyllomer.map:connectExits(room_id,gmcp.Room)
  -- xyllomer.map:connectSpecialExits(room_id)
     
  if not isCreated then
    xyllomer.log:error("Failed to create new room!")
  else
    xyllomer.log:debug("Created new room")
  end
end

 
function xyllomer.map:ConvertRoomNumberToID(room_num)
    return room_num;
    
end
