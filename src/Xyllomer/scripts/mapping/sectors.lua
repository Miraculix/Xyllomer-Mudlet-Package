

function xyllomer.map:registerEnvColor(envid, r,g,b,a)
    if ( envid == nil ) then
        return;
    end     
    setCustomEnvColor(envid, r,g,b, 255 );   
end



function xyllomer.map:setCustomColors()

  xyllomer.log:debug("Setting color environment")

  -- Must remap mud-specified IDs to be in non-ANSI ranges (0-15),
  -- otherwise colors won't function correctly
  for k,v in pairs(gmcp.Mud.Terrains) do
    xyllomer.map.terrain[v] = k+16
  end

  -- display(xyllomer.map.terrain)

  -- Roads --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["road"], unpack(color_table.DarkGoldenrod))  
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["bridge"], unpack(color_table.SaddleBrown))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["crossing"], unpack(color_table.burlywood))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["smallroad"], unpack(color_table.DarkGoldenrod))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["trail"], unpack(color_table.tan))

  -- Misc --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["inside"], unpack(color_table.light_gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["rown"], unpack(color_table.LightCoral))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["unused"], unpack(color_table.slate_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["Mudschool"], unpack(color_table.maroon))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["areaexit"], unpack(color_table.dim_gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["castle"], unpack(color_table.plum))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["pillar"], unpack(color_table.light_pink))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["temple"], unpack(color_table.medium_purple))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["shop"], unpack(color_table.orange))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["clanexit"], unpack(color_table.red))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["chessblack"], unpack(color_table.dim_gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["chesswhite"], unpack(color_table.white))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["lottery"], unpack(color_table.yellow_green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["alley"], unpack(color_table.yellow))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["harbour"], unpack(color_table.linen))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["electric"], unpack(color_table.DodgerBlue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["well"], unpack(color_table.DarkSlateBlue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["bloodyhall"], unpack(color_table.maroon))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["bloodyroom"], unpack(color_table.firebrick))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["palace_room"], unpack(color_table.MediumOrchid))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ship"], unpack(color_table.SaddleBrown))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hut"], unpack(color_table.LightGoldenrod))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["redcarpet"], unpack(color_table.red))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["city_underground"], unpack(color_table.DarkSlateGray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["cabin"], unpack(color_table.LightGoldenrod))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hallway"], unpack(color_table.slate_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["stairs"], unpack(color_table.dim_gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["aylorcity"], unpack(color_table.magenta))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ruins"], unpack(color_table.aquamarine))

  xyllomer.map:registerEnvColor(xyllomer.map.terrain["graveyard"], unpack(color_table.LightGrey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["crypt"], unpack(color_table.LightSlateGrey))

  -- Weather/Environment --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["mist"], unpack(color_table.alice_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["snow"], unpack(color_table.snow))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dark"], unpack(color_table.dark_slate_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["air"], unpack(color_table.mint_cream))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["moon"], unpack(color_table.slate_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["tornado"], unpack(color_table.light_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dustdevil"], unpack(color_table.DarkKhaki))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["wind1"], unpack(color_table.white_smoke))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["wind2"], unpack(color_table.alice_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["lightning"], unpack(color_table.steel_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["rain"], unpack(color_table.cyan))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["sun"], unpack(color_table.gold))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["cloud1"], unpack(color_table.snow))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["cloud2"], unpack(color_table.light_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["cloud3"], unpack(color_table.gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["rainbow"], unpack(color_table.DeepPink))

  -- Outdoors --

  xyllomer.map:registerEnvColor(xyllomer.map.terrain["plain"], unpack(color_table.papaya_whip))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["field"], unpack(color_table.yellow_green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["meadow"], unpack(color_table.LawnGreen))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["field3"], unpack(color_table.yellow_green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["field4"], unpack(color_table.green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dead_field"], unpack(color_table.dark_sea_green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ashen_field"], unpack(color_table.bisque))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["forest"], unpack(color_table.ForestGreen))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dead_forest"], unpack(color_table.OliveDrab))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hills"], unpack(color_table.MediumSpringGreen))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["mountain"], unpack(color_table.RosyBrown))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["mountain_cyan"], unpack(color_table.thistle))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["desert"], unpack(color_table.moccasin))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["quicksand"], unpack(color_table.sandy_brown))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["underground"], unpack(color_table.DarkSlateGray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["volcano"], unpack(color_table.firebrick))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["cave"], unpack(color_table.dark_orange))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["fiery_cave"], unpack(color_table.maroon))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dungeon"], unpack(color_table.purple))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["beach"], unpack(color_table.LightGoldenrod ))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["shore"], unpack(color_table.pale_goldenrod))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["jungle"], unpack(color_table.green))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["dead_jungle"], unpack(color_table.OliveDrab))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["swamp"], unpack(color_table.OliveDrab))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["rocks"], unpack(color_table.light_grey))

  xyllomer.map:registerEnvColor(xyllomer.map.terrain["arctic"], unpack(color_table.LightCyan))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["insideice"], unpack(color_table.light_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["icemount"], unpack(color_table.turquoise))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["icehills"], unpack(color_table.pale_turquoise))

  xyllomer.map:registerEnvColor(xyllomer.map.terrain["flowers1"], unpack(color_table.DarkOrchid))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["flowers2"], unpack(color_table.MediumPurple))

  -- Water --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["waterswim"], unpack(color_table.cornflower_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["waternoswim"], unpack(color_table.medium_slate_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ocean"], unpack(color_table.deep_sky_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ocean2"], unpack(color_table.dodger_blue ))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ocean3"], unpack(color_table.medium_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["ocean4"], unpack(color_table.midnight_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["underwater"], unpack(color_table.NavyBlue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["river"], unpack(color_table.medium_aquamarine))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["fountain"], unpack(color_table.cornflower_blue))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["chaos_sea"], unpack(color_table.purple))

  -- Library --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["archive"], unpack(color_table.OldLace))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["bookshelves"], unpack(color_table.DarkKhaki))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["bookshelves_ns"], unpack(color_table.DarkKhaki))

  -- Hell --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hellinside"], unpack(color_table.maroon))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hellhall"], unpack(color_table.violet_red))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hellfountain"], unpack(color_table.firebrick))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hell1"], unpack(color_table.red))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hell2"], unpack(color_table.tomato))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hell3"], unpack(color_table.OrangeRed))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["hell4"], unpack(color_table.coral))
 
  -- Space --
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["space1"], unpack(color_table.light_grey))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["space2"], unpack(color_table.gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["space3"], unpack(color_table.dim_gray))
  xyllomer.map:registerEnvColor(xyllomer.map.terrain["space4"], unpack(color_table.dark_slate_grey))
   xyllomer.log:debug("Setting color environment: Finished")
end
