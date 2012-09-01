xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {} 

xyllomer_package_version = "0.4 alpha"
xyllomer_package_date = "2012/08/31"

xyllomer_base_path = getMudletHomeDir().."/Xyllomer"

xyllomer_gfx_path = xyllomer_base_path.."/gfx"
xyllomer_scripts_path = xyllomer_base_path.."/scripts"
xyllomer_gui_path = xyllomer_scripts_path.."/gui"
xyllomer_mapping_path = xyllomer_scripts_path.."/mapping"
xyllomer_profile_path = getMudletHomeDir()

-- disable debug infos by default
xyllomer_Debug = false
xyllomer_Develop = false

-- Autosave Maps all 5 minutes
xyllomer_MapAutosave_Interval = 300

-- Automatically create mapper window
xyllomer_AutoCreate_Mapper = true

-- determine the size of your screen
WindowWidth=0;
WindowHeight=0;
WindowWidth, WindowHeight = getMainWindowSize();

dofile(xyllomer_scripts_path .."/logger.lua")

xyllomer.log:info("Xyllomer Mudlet Package V"..xyllomer_package_version.." initializing")

if string.char(getMudletHomeDir():byte()) == "/" then sep = "/" else sep = "\\" end

-- ignore this stuff
map_height = 0
map_width = 0
compass_south_point = 0
distance_from_top = 0

-- set the values to 'false' if you want to disable any of them
show_map = true
show_compass = true
show_gauges = true

-- set the following to 'false' if you want the map to be on the left side
left_map = false

afg_font_size = 5

compass_type = "nexus-compass"

if ( xyllomer:FileExists( xyllomer_profile_path .. "/xyllomer_local.lua" ) ) then
	xyllomer.log:info("Including existing local settings")
	xyllomer:LoadScript( xyllomer_profile_path .. "/xyllomer_local.lua" )	
end

xyllomer.log:info("Starting")
xyllomer:LoadScript( xyllomer_scripts_path .. "/startup.lua"  )
xyllomer.log:info("Startup completed")
