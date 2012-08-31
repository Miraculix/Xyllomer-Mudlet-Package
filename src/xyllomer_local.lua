----------------------------------------------
--- Xyllomer mudlet UI local settings      ---
----------------------------------------------

-- disable debug infos by default
xyllomer_Debug = false

-- Autosave Maps all 5 minutes. Value given in seconds
xyllomer_MapAutosave_Interval = 300

-- Automatically create mapper window. Set this to false 
-- if you want to create the mapper window yourself e.g. 
-- to be able to detach it
xyllomer_AutoCreate_Mapper = true

-- set the values to 'false' if you want to disable any of them
-- unsupported currently
xyllomer_ui_show_compass = true
xyllomer_ui_show_gauges = true
xyllomer_ui_show_team = true
xyllomer_ui_show_buffs = true
xyllomer_ui_show_chat = true

--- UI settings

-- Distance of the general UI (compass) from top border
xyllomer_ui_compass_top = 0
-- Distance of the general UI (compass) from left border
xyllomer_ui_compass_left = 0

-- Mapper Specific Settings
-- height of the mapper. Default: Half of the windowheight
xyllomer_ui_mapper_height = (WindowHeight / 2) - 10
-- width of the mapper. Default: 400 pixels
xyllomer_ui_mapper_width = 400
-- top position of the mapper
xyllomer_ui_mapper_top = 0
-- Left position of the mapper
-- to e.g. create the mapper on the left side set this to 0
xyllomer_ui_mapper_left = WindowWidth - xyllomer_ui_mapper_width

-- Tabbed chat specific settings 
-- Default: create below mapper
-- height of the chat. Default: all space below mapper
xyllomer_ui_chat_height = WindowHeight - xyllomer_ui_mapper_height - 20
-- width of the chat. Default: as wide as the mapper
xyllomer_ui_chat_width = xyllomer_ui_mapper_width
-- Top Position of the chat. Default: below the mapper
xyllomer_ui_chat_top = xyllomer_ui_mapper_height + 10
-- Left Position of the chat. Default: same as the mapper
xyllomer_ui_chat_left = xyllomer_ui_mapper_left

-- name of the directory wheere the gfx are.
-- To set it e.g. to your own directory
-- xyllomer_gfx_path = getMudletHomeDir().."/mygfx"
xyllomer_gfx_path = getMudletHomeDir().."/Xyllomer/gfx"

-- name of the subdir for compss ui. Valid values for the default ui: "nexus-compass","general-compass"
xyllomer_compass_type = "nexus-compass"



