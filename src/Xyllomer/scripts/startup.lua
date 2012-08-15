xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}


xyllomer.log:info("Loading GUI")
xyllomer:LoadScript( xyllomer_scripts_path .. "/gui.lua" )
xyllomer.log:info("Loading Mapping")
xyllomer:LoadScript( xyllomer_scripts_path .. "/mapping.lua" )
xyllomer.log:debug("Attaching Events")
xyllomer:LoadScript( xyllomer_scripts_path .. "/events.lua" );
xyllomer.log:debug("Attaching Triggers")
xyllomer:LoadScript( xyllomer_scripts_path .. "/triggers.lua" );


