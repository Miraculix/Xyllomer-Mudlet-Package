xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}


function xyllomer.gui:CreateTeamGauge(name,num)
    local offset = 34+xyllomer_ui_compass_top+380 + (num * 20 );
    local lblSize = 100
    local lblLeft = 5
    
    createLabel(name .. "Max",0,0,0,0,1);
    createLabel(name .. "Bar",0,0,0,0,1);
    createLabel(name .. "Lbl",0,0,0,0,1);

    setBackgroundColor(name .. "Max",221,0,51,255)
    setBackgroundColor(name .. "Bar",221,0,51,100)
    setBackgroundColor(name .. "Lbl",0,0,0,0)
   
    moveWindow(name .. "Lbl", lblLeft , offset);
    resizeWindow(name .. "Lbl", lblSize , 15);
    
    moveWindow(name .. "Bar", lblLeft + lblSize + 10 ,offset)
    resizeWindow(name .. "Bar",55,10)
    
    moveWindow(name .. "Max", lblLeft + lblSize + 10 ,offset)
    resizeWindow(name .. "Max",55,10)  
end

function xyllomer.gui:HideTeamGauge(name)
    hideWindow( name .. "Max" );
    hideWindow( name .. "Bar" );
    hideWindow( name .. "Lbl" );
end

function xyllomer.gui:ShowTeamGauge(name)
    showWindow( name .. "Max" );
    showWindow( name .. "Bar" );
    showWindow( name .. "Lbl" );
end

function xyllomer.gui:UpdateTeamGauge(name, member )

    local tcolor = "yellow";
    local tname = "%s";
    local tleader = "&nbsp;&nbsp;";

    if ( member.pos == "1" ) then
        tcolor = "#9ACD32";
    end

    if ( member.hp == "0" ) then
        tcolor = "#696969";        
    end
    
    if ( member.hp == "-1" ) then
        tname = "<s>%s</s>";
        tcolor = "#696969";
        member.hp = 0;
    end

    if ( member.leader == "1") then
        tleader = "*&nbsp;";
    end

    
    local fmtString = "<font color=" .. tcolor .. ">%s".. tname .. "</font>";

    resizeWindow(name .. "Max",55/100*member.hp,10);
    echo(name .. "Lbl",string.format( fmtString , tleader, member.name ) );
    xyllomer.gui:ShowTeamGauge(name);
end

function xyllomer.gui:CreateTeamGauges()
    createLabel("TeamWnd", 55 ,34+xyllomer_ui_compass_top+380 ,100,10,1);
    echo("TeamWnd","<font color=gray><B>T E A M</B></font>"); 

    for i = 0,9,1 do
        xyllomer.gui:CreateTeamGauge( "T" .. i , i+1 );         
        xyllomer.gui:HideTeamGauge( "T" .. i );
    end   
    
    
end

function xyllomer_got_teaminfo()
    for i = 0,table.getn(gmcp.Char.Team),1 do
        xyllomer.gui:UpdateTeamGauge( "T" .. i, gmcp.Char.Team[i+1]);
    end
    for i = table.getn(gmcp.Char.Team)+1,9,1 do
          xyllomer.gui:HideTeamGauge("T" .. i);
    end

end
