xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}


-- determine the size of your screen
WindowWidth=0;
WindowHeight=0;
WindowWidth, WindowHeight = getMainWindowSize();

if show_map then 

line_height = 25+1 

end

xyllomer:LoadScript( xyllomer_gui_path.."/gauges.lua" )
xyllomer:LoadScript( xyllomer_gui_path.."/overlay.lua" )
xyllomer:LoadScript( xyllomer_gui_path.."/compass.lua" )

xyllomer.gui:create_background()

if show_gauges then
    xyllomer.gui:create_gauges()
end

if ( show_compass ) then
    xyllomer.gui:create_compass()
end
