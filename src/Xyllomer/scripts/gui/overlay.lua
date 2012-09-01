xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}



function xyllomer.gui:create_background()
-- gui
setBorderLeft(200);
setBorderTop(38);
setBorderBottom(0);
createLabel("heading", 0,0,240,34,1)
setBackgroundImage("heading", xyllomer_gfx_path .. sep .. "heading.png" );
setBackgroundColor("heading", 0,0,0,0);
moveWindow("heading",0,0)

local topFillerName = "topFiller";
local startPos = 240;
for i = 1,8 do
	topFillerName = topFillerName .. i
	createLabel(topFillerName, 0,0,264,34,1)
	moveWindow(topFillerName, startPos,0)
	setBackgroundImage( topFillerName, xyllomer_gfx_path ..  sep .. "top_filler.png" );
	setBackgroundColor( topFillerName, 0,0,0,0);
	moveWindow( topFillerName,startPos,0)
	startPos = startPos + 264
end

if ( xyllomer_ui_show_compass ) then
    createLabel( "left-side", 0,0,135,465,1 )
    moveWindow("left-side",  0,xyllomer_ui_compass_top+34)
    setBackgroundImage( "left-side", xyllomer_gfx_path ..  sep .. "left-new.png" );
    setBackgroundColor( "left-side", 0, 0, 0, 0 );
end

end