xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}

function xyllomer.gui:create_compass()
-- compass

local compass_south_point = xyllomer_ui_compass_top +10
string = xyllomer_gfx_path .. sep .. compass_type

--          ##########################

createLabel("compass-background",0,0,87,86,1)
setBackgroundImage("compass-background", string ..  sep .. "compass.png")
moveWindow("compass-background",xyllomer_ui_compass_left + 4,34+compass_south_point+54)
setBackgroundColor("compass-background",0,0,0,0)

createLabel("north",0,0,12,20,1)
setBackgroundImage("north", string ..  sep .. "n.png");
setBackgroundColor("north", 0,0,0,0);
setLabelClickCallback("north", "xyllomer_walk", "north" )
moveWindow("north",xyllomer_ui_compass_left + 42,compass_south_point+95)

createLabel("south",0,0,12,19,1);
setBackgroundImage("south",string ..  sep .. "s.png" );
setBackgroundColor("south", 0,0,0,0);
setLabelClickCallback("south", "xyllomer_walk", "south" )
moveWindow("south",xyllomer_ui_compass_left + 42,compass_south_point+150)

createLabel("up",0,0,8,12,1);
setBackgroundImage("up",string ..  sep .. "up.png" );
setBackgroundColor("up", 0,0,0,0);
setLabelClickCallback("up", "xyllomer_walk", "up" )
moveWindow("up",xyllomer_ui_compass_left + 102,compass_south_point+98)

createLabel("down",0,0,8,10,1);
setBackgroundImage("down",string ..  sep .. "down.png" );
setBackgroundColor("down", 0,0,0,0);
setLabelClickCallback("down", "xyllomer_walk", "down" )
moveWindow("down",xyllomer_ui_compass_left + 102,compass_south_point+147)


createLabel("west",0,0,19,12,1);
setBackgroundImage("west",string ..  sep .. "w.png" );
setBackgroundColor("west", 0,0,0,0);
setLabelClickCallback("west", "xyllomer_walk", "west" )
moveWindow("west",xyllomer_ui_compass_left + 10,compass_south_point+126)

createLabel("east",0,0,19,12,1);
setBackgroundImage("east",string ..  sep .. "e.png" );
setBackgroundColor("east", 0,0,0,0);
setLabelClickCallback("east", "xyllomer_walk", "east" )
moveWindow("east",xyllomer_ui_compass_left + 65,compass_south_point+128)

createLabel("updown",0,0,29,31,1);
setBackgroundImage("updown",string ..  sep .. "up_down_off.png" );
setBackgroundColor("updown", 0,0,0,0);
moveWindow("updown",xyllomer_ui_compass_left + 94,compass_south_point+113)

createLabel("door",0,0,27,26,1);
setBackgroundImage("door",string ..  sep .. "door_off.png" );
setBackgroundColor("door", 0,0,0,0);
moveWindow("door",xyllomer_ui_compass_left + 34,compass_south_point+178)


createLabel("northeast",0,0,15,16,1);
setBackgroundImage("northeast",string ..  sep .. "ne.png" );
setBackgroundColor("northeast", 0,0,0,0);
setLabelClickCallback("northeast", "xyllomer_walk", "northeast" )
moveWindow("northeast",xyllomer_ui_compass_left + 60,compass_south_point+108)

createLabel("northwest",0,0,13,15,1);
setBackgroundImage("northwest",string ..  sep .. "nw.png" );
setBackgroundColor("northwest", 0,0,0,0);
setLabelClickCallback("northwest", "xyllomer_walk", "northwest" )
moveWindow("northwest",xyllomer_ui_compass_left + 22,compass_south_point+108)

createLabel("southwest",0,0,14,14,1);
setBackgroundImage("southwest",string ..  sep .. "sw.png" );
setBackgroundColor("southwest", 0,0,0,0);
setLabelClickCallback("southwest", "xyllomer_walk", "southwest" )
moveWindow("southwest",xyllomer_ui_compass_left + 24,compass_south_point+143)

createLabel("southeast",0,0,16,15,1);
setBackgroundImage("southeast",string ..  sep .. "se.png" );
setBackgroundColor("southeast", 0,0,0,0);
setLabelClickCallback("southeast", "xyllomer_walk", "southeast" )
moveWindow("southeast",xyllomer_ui_compass_left + 59,compass_south_point+142)

createLabel("out",0,0,16,15,1);
setBackgroundImage("out",string ..  sep .. "out.gif" );
setBackgroundColor("out", 0,0,0,0);
setLabelClickCallback("out", "xyllomer_walk", "out" )
moveWindow("out",xyllomer_ui_compass_left + 20,compass_south_point+183)

createLabel("in",0,0,16,15,1);
setBackgroundImage("in",string ..  sep .. "in.gif" );
setBackgroundColor("in", 0,0,0,0);
setLabelClickCallback("in", "xyllomer_walk", "in" )
moveWindow("in",xyllomer_ui_compass_left + 65,compass_south_point+183)
end

function xyllomer_walk(where)
	if not waitForWalkPrompt then
		DoAutoWalk = true;
		send(where, false)				
	end
end
