-- Parse gmcp.room data from the mud

function xyllomer.map:parseGmcpRoom()
  local zone_name = gmcp.Room.Info.zone
  local room_id
  
  -- Zone Handling
  if xyllomer.map.current_zone ~= zone_name then
    xyllomer.log:debug("Entered different zone")
    xyllomer.map:setZone(zone_name)
  end
  -- xyllomer.log:debug("M0");
  -- Unmapped Room!
  if ( gmcp.Room.Info.num == 0x7fffffff ) then
     xyllomer.log:debug("entering unmapped room...ignoring.");
     centerview(xyllomer.map.unmapped_room_id);
     return;
  end
  if ( gmcp.Room.Info.num == nil ) then
     xyllomer.log:debug("entering unmapped room...ignoring.");
     centerview(xyllomer.map.unmapped_room_id);
     return;
  end
  --xyllomer.log:debug("M1");
  room_id = xyllomer.map:ConvertRoomNumberToID(gmcp.Room.Info.num)
 
  -- Room Handling
  xyllomer.map.seen_room = room_id
  xyllomer.map.prior_room = xyllomer.map.current_room
  --xyllomer.log:debug("M2");
  if room_id == -1 then
    -- Eventually needs to work to map "nomap" areas...
    xyllomer.log:debug("Can't find room based on mud id - none given")
    return;
  end
  
  if roomExists(room_id) then
    --xyllomer.log:debug("M3");
    if ( getRoomUserData(room_id,"timestamp") < gmcp.Room.Info.timestamp ) then  
       xyllomer.log:debug("Mud signals remap for existing room! "..gmcp.Room.Info.timestamp.." vs. "..getRoomUserData(room_id,"timestamp"))
       deleteRoom(room_id);
       --xyllomer.log:debug("M3a");
       room_id = xyllomer.map:ConvertRoomNumberToID(gmcp.Room.Info.num)
       --xyllomer.log:debug("M3b");
       xyllomer.map:createRoom(room_id)
       --xyllomer.log:debug("M3c");
       xyllomer.log:debug("Remapped!")
    elseif getRoomEnv(room_id) == 999 then
        xyllomer.log:debug("Existing room is a temp room - moving")     
        xyllomer.map:moveRoom(room_id )
      else
        xyllomer.log:debug("Found existing room - moving there")            
        -- xyllomer.map:connectSpecialExits(room_id,gmcp.Room);      
      end    
  else
    xyllomer.log:debug("New room seen - creating...")
    xyllomer.map:createRoom(room_id)
  end
  -- xyllomer.log:debug("M4");
  -- xyllomer.map:connectSpecialExits(room_id,gmcp.Room);
  xyllomer.map:connectExits(room_id,gmcp.Room);
  xyllomer.map.current_room = room_id
  xyllomer.map.prior_room_data = table.copy(gmcp.Room)
  xyllomer.map.prior_zone_name = zone_name
  centerview(xyllomer.map.current_room)
  
  local x,y,z = getRoomCoordinates(room_id);
  xyllomer.log:debug("Coord: ( "..x.." , "..y.." , " ..z.." )"); 
   if ( getRoomUserData(room_id,"timestamp") ~= gmcp.Room.Info.timestamp ) then  
    xyllomer.log:debug("Userdata MISMATCH "..gmcp.Room.Info.timestamp.." vs. "..getRoomUserData(room_id,"timestamp"))
   end
end

function table.copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end
