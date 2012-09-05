xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.map = xyllomer.map or {}

function xyllomer_onVitals()
    local h,m,f
    
    xyllomer.log:debug("got Vitals");
    
    h = gmcp.Char.Vitals.hp
    m = gmcp.Char.Vitals.mana
    f = gmcp.Char.Vitals.fatigue
    b = gmcp.Char.Vitals.bleeding
    if ( h < 1 ) then h = 1 end
    if ( m < 1 ) then m = 1 end
    if ( b < 1 ) then b = 1 end
    if ( f > 99 ) then f = 99 end
    
    resizeWindow("healthMax",55/100*h,10)
    resizeWindow("manaMax",55/100*m,10)
    resizeWindow("enduranceMax",55/100*(100-f),10)
    resizeWindow("willpowerMax",55/100*b,10)
end

function xyllomer_onExits()
    xyllomer.log:debug("got Exits");
    
    direction_north = 0
direction_south = 0
direction_northwest = 0
direction_northeast = 0
direction_east = 0
direction_west = 0
direction_southeast = 0
direction_southwest = 0
direction_in = 0
direction_down = 0
direction_up = 0
direction_out = 0

    if ( gmcp.Room.Info.exits["n"] ) then direction_north=1;showWindow("north");end
    if ( gmcp.Room.Info.exits["e"] ) then direction_east=1;showWindow("east");end
    if ( gmcp.Room.Info.exits["s"] ) then direction_south=1;showWindow("south");end
    if ( gmcp.Room.Info.exits["w"] ) then direction_west=1;showWindow("west");end
    if ( gmcp.Room.Info.exits["nw"] ) then direction_northwest=1;showWindow("northwest");end
    if ( gmcp.Room.Info.exits["ne"] ) then direction_northeast=1;showWindow("northeast");end
    if ( gmcp.Room.Info.exits["sw"] ) then direction_southwest=1;showWindow("southwest");end
    if ( gmcp.Room.Info.exits["se"] ) then direction_southeast=1;showWindow("southeast");end
    if ( gmcp.Room.Info.exits["in"] ) then direction_north=1;showWindow("in");end
    if ( gmcp.Room.Info.exits["out"] ) then direction_east=1;showWindow("out");end
    if ( gmcp.Room.Info.exits["up"] ) then direction_south=1;showWindow("up");end
    if ( gmcp.Room.Info.exits["down"] ) then direction_west=1;showWindow("down");end
    
if direction_north == 0 then
	hideWindow( "north" )
end

if direction_south == 0 then
	hideWindow( "south" )
end

if direction_west == 0 then
	hideWindow( "west" )
end

if direction_east == 0 then
	hideWindow( "east" )
end

if direction_south == 0 then
	hideWindow( "south" )
end

if direction_northeast == 0 then
	hideWindow( "northeast" )
end

if direction_northwest == 0 then
	hideWindow( "northwest" )
end

if direction_southeast == 0 then
	hideWindow( "southeast" )
end

if direction_southwest == 0 then
	hideWindow( "southwest" )
end

if direction_up == 0 then
	hideWindow( "up" )
end

if direction_down == 0 then
	hideWindow( "down" )
end

if direction_in == 0 then
	hideWindow( "in" )
end

if direction_out == 0 then
	hideWindow( "out" )
end

--deleteLine()
end

function xyllomer_onSysDataSendRequest(event, args)
  xyllomer.command = args
end

registerAnonymousEventHandler("gmcp.Char.Vitals", "xyllomer_onVitals")
registerAnonymousEventHandler("gmcp.Room.Info", "xyllomer_onExits")
registerAnonymousEventHandler("sysDataSendRequest","xyllomer_onSysDataSendRequest")

if ( xyllomer_ui_show_team ) then
    registerAnonymousEventHandler("gmcp.Char.Team","xyllomer_got_teaminfo")
end
