xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.map = xyllomer.map or {}
lfs = lfs or {}

--  sendGMCP("rawcolor on")
--  sendGMCP("request sectors")
  
  xyllomer:LoadScript(xyllomer_mapping_path .. "/gmcp_room.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/exits.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/rooms.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/zones.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/continents.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/sectors.lua")
  xyllomer:LoadScript(xyllomer_mapping_path .. "/speedwalk.lua")

  xyllomer.map.current_zone = nil
  xyllomer.map.current_room = nil
  xyllomer.map.prior_room = nil
  xyllomer.map.prior_room_data = {}
  xyllomer.map.seen_room = nil
  xyllomer.map.mapdir = getMudletHomeDir().."/xyllomer_map"
    
  lfs.mkdir( xyllomer.map.mapdir );
  
  if not xyllomer.map.terrain then
     xyllomer.map.terrain = {}
  end
  xyllomer.map:registerEnvColor(999, unpack(color_table.blue))
  
  xyllomer.map:createFakeZone()
  
  xyllomer.map.unmapped_room_id = xyllomer.map:ConvertRoomNumberToID(2147483647);
  xyllomer.map:createUnmappedRoom(xyllomer.map.unmapped_room_id);
    
  
  function xyllomer_onRoom()
    xyllomer.log:debug("Got roominfo");
    xyllomer.map:parseGmcpRoom()
  end
  
  function xyllomer_onTerrain()
    xyllomer.map:setCustomColors();
    -- we don't need them anymore
    gmcp.Mud.Terrains = nil; 
  end
    
  function xyllomer_SaveTimer()
    saveMap(xyllomer.map.mapdir .. "/xyllomer_map.dat");
    xyllomer.log:info("Map autosave.");
    tempTimer(xyllomer_MapAutosave_Interval,function() xyllomer_SaveTimer(); end );
  end

  xyllomer.log:debug("Register events");
  
  registerAnonymousEventHandler("gmcp.Room.Info", "xyllomer_onRoom")
  registerAnonymousEventHandler("gmcp.Mud.Terrains", "xyllomer_onTerrain")
  
  if (  xyllomer.map.timer_id ~= nil ) then
    killTimer( xyllomer.map.timer_id )
  end
  
  if ( xyllomer_MapAutosave_Interval > 0) then
    xyllomer.map.timer_id = tempTimer(xyllomer_MapAutosave_Interval , function() xyllomer_SaveTimer(); end );
  end
  
  if ( xyllomer_AutoCreate_Mapper ) then
    createMapper( WindowWidth - 400 , 0 , 400 , (WindowHeight / 2) - 10 );
    setBorderRight(400);
  end
  
  if ( xyllomer:FileExists(xyllomer.map.mapdir .. "/xyllomer_map.dat") ) then
	xyllomer.log:info("Loading previously saved map")
	loadMap(xyllomer.map.mapdir .. "/xyllomer_map.dat");
  end