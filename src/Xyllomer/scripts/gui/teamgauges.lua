xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}


function xyllomer.gui:CreateTeamGauge(name,num)
    local offset = 34+xyllomer_ui_compass_top+380 + (num * 15 );
    local lblSize = 100
    local lblLeft = 5
    
    createLabel(name .. "Max",0,0,0,0,1);
    createLabel(name .. "Bar",0,0,0,0,1);
    createLabel(name .. "Lbl",0,0,0,0,1);

    setBackgroundColor(name .. "Max",221,0,51,255)
    setBackgroundColor(name .. "Bar",221,0,51,100)
    setBackgroundColor(name .. "Lbl",0,0,0,0)
   
    moveWindow(name .. "Lbl", lblLeft , offset);
    resizeWindow(name .. "Lbl", lblSize , 10);
    
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

function xyllomer.gui:UpdateTeamGauge( name , player , health , leader , backrow, missing )

    local tcolor = "yellow";
    local tname = "%s";
    local tleader = "&nbsp;&nbsp;";

    if ( backrow == 1 ) then
        tcolor = "#9ACD32";
    end

    if ( missing == 1 ) then
        tname = "<s>%s</s>";
        tcolor = "#696969";
        health = 0;
    end

    if ( leader == 1) then
        tleader = "*&nbsp;";
    end

    if ( health == 0 and  missing ~= 1) then
        tcolor = "#696969";
        health = 0;
    end
    local fmtString = "<font color=" .. tcolor .. ">%s".. tname .. "</font>";

    resizeWindow(name .. "Max",55/100*health,10);
    echo(name .. "Lbl",string.format( fmtString , tleader, player ) );

end

function xyllomer.gui:CreateTeamGauges()
    createLabel("TeamWnd", 55 ,34+xyllomer_ui_compass_top+380 ,100,10,1);
    echo("TeamWnd","<font color=gray><B>T E A M</B></font>"); 

    for i = 0,9,1 do
        xyllomer.gui:CreateTeamGauge( "T" .. i , i+1 ); 
        if ( not xyllomer_Develop ) then 
            xyllomer.gui:HideTeamGauge( "T" .. i );
        end   
    end
    if ( xyllomer_Develop ) then 
        for i = 0,9,1 do    
            if ( i == 3 ) then 
                xyllomer.gui:UpdateTeamGauge( "T" .. i, "Leader " .. i+1, (i)*10 ,1, 0, 0 );
            elseif ( i > 5  and i ~= 8 ) then
                xyllomer.gui:UpdateTeamGauge( "T" .. i, "Back " .. i+1, (i)*10 ,0, 1, 0 );
            elseif ( i == 8 ) then
                xyllomer.gui:UpdateTeamGauge( "T" .. i, "Missing " .. i+1, (i)*10 ,0, 0, 1 );
            elseif ( i == 0 ) then
                xyllomer.gui:UpdateTeamGauge( "T" .. i, "Dead " .. i+1, (i)*10 ,0, 0, 0 );
            else
                xyllomer.gui:UpdateTeamGauge( "T" .. i, "Front " .. i+1, (i)*10 ,0, 0, 0 );
            end         
        end
    end
end
