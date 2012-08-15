function xyllomer:FileExists(fname)     
   local f=io.open(fname,"r") 
   if f~=nil then io.close(f) return true else return false end 
end 

function xyllomer:basename(path)
	local i = string.len(path)

	while string.sub(path, i, i) == "/" and i > 0 do
		path = string.sub(path, 1, i - 1)
		i = i - 1
	end
	while i > 0 do
		if string.sub(path, i, i) == "/" then
			break
		end
		i = i - 1
	end
	if i > 0 then
		path = string.sub(path, i + 1, -1)
	end
	if path == "" then
		path = "/"
	end

	return path
end



function xyllomer:LoadScript(name,chatty)
    if ( not xyllomer:FileExists( name ) ) then
      if ( (chatty == nil ) or ( chatty == 1 ) or ( xyllomer_Debug )  ) then
         xyllomer.log:error("Script '" .. xyllomer:basename(name) .. "' not found!");
         xyllomer.log:debug(name);
      end        
        return
    end
    xyllomer.log:debug("Loading '" .. xyllomer:basename(name) .. "'");
    dofile(name)
end



function xyllomer.log:debug(msg)
  if xyllomer_Debug then
    cecho("<dark_slate_grey>[<white>::<dark_orchid>(debug):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
  end
end

function xyllomer.log:info(msg)
  cecho("<dark_slate_grey>[<white>::<light_slate_grey>(info):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
end

function xyllomer.log:error(msg)
  cecho("<dark_slate_grey>[<white>::<firebrick>(error):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
end
