xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}

xyllomer:LoadScript( xyllomer_gui_path.."/gauges.lua" )
xyllomer:LoadScript( xyllomer_gui_path.."/overlay.lua" )
xyllomer:LoadScript( xyllomer_gui_path.."/compass.lua" )
xyllomer:LoadScript( xyllomer_gui_path.."/teamgauges.lua" )

if xyllomer_ui_show_background then
    xyllomer.gui:create_background()
end

if xyllomer_ui_show_gauges then
    xyllomer.gui:create_gauges()
end

if ( xyllomer_ui_show_compass ) then
    xyllomer.gui:create_compass()
end

if (xyllomer_ui_show_team ) then
    xyllomer.gui:CreateTeamGauges();
end
