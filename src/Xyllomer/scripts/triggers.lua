xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}

if ( not xyllomer_triggers_set ) then
    xyllomer.log:info("Setting triggers");
    xyllomer_triggers_set = true

    if ( xyllomer_Debug ) then
        tempAlias( "^xyllua (.*)$" , [[ local f,e = loadstring("return "..matches[2])
        if not f then
	        f,e = assert(loadstring(matches[2]))
        end
        local r = f()
        if r ~= nil then display(r) end
        ]] );
    end

tempAlias( "^xyldebug$" , [[ 
    if ( xyllomer_Debug ) then
        xyllomer_Debug = false;
        xyllomer.log:info("Debugging disabled.");
    else
        xyllomer_Debug = false;
        xyllomer.log:info("Debugging enabled.");
    end 
       
]] );

tempAlias( "^xylreload$" , [[ 
    dofile(getMudletHomeDir().."/Xyllomer/scripts/globals.lua" )
]] );

tempAlias( "^xylremap$" , [[ 
    room_id = xyllomer.map:ConvertRoomNumberToID(gmcp.Room.Info.num)
    if roomExists(room_id) then
       deleteRoom(room_id);
       room_id = xyllomer.map:ConvertRoomNumberToID(gmcp.Room.Info.num)
       xyllomer.map:createRoom(room_id)
       xyllomer.log:info("Remapped!")
       centerview(room_id);
    end
]] );

tempAlias( "^xylversion$" , [[ 
    xyllomer.log:info("Xyllomer Mudlet Package V"..xyllomer_package_version.." ("..xyllomer_package_date..")")
    xyllomer.log:debug("Debugging enabled");
]] );


end
