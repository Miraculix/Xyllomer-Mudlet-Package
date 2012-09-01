xyllomer = xyllomer or {}
xyllomer.log = xyllomer.log or {}
xyllomer.gui = xyllomer.gui or {}

function xyllomer.gui:create_gauges()
-- gauges
local offset = 34+xyllomer_ui_compass_top+348-90

createLabel("xpMax",0,0,0,0,1);
setBackgroundColor("xpMax",32,124,215,255)
createLabel("xpBar",0,0,0,0,1);
setBackgroundColor("xpBar",32,124,215,100)
moveWindow("xpBar", 22,offset)
resizeWindow("xpBar",55,10)
moveWindow("xpMax", 22,offset)
resizeWindow("xpMax",55,10)

createLabel("healthMax",0,0,0,0,1);
setBackgroundColor("healthMax",221,0,51,255)
createLabel("healthBar",0,0,0,0,1);
setBackgroundColor("healthBar",221,0,51,100)
moveWindow("healthBar", 22,offset+25)
resizeWindow("healthBar",55,10)
moveWindow("healthMax", 22,offset+25)
resizeWindow("healthMax",55,10)

createLabel("manaMax",0,0,0,0,1);
setBackgroundColor("manaMax",0,204,255,255)
createLabel("manaBar",0,0,0,0,1);
setBackgroundColor("manaBar",0,204,255,100)
moveWindow("manaBar", 22,offset+40)
resizeWindow("manaBar",55,10)
moveWindow("manaMax", 22,offset+40)
resizeWindow("manaMax",55,10)

createLabel("enduranceBar",0,0,0,0,1);
createLabel("enduranceMax",0,0,0,0,1);
setBackgroundColor("enduranceMax",255,204,51,255)
setBackgroundColor("enduranceBar",255,204,51,100)
resizeWindow("enduranceBar",55,10)
resizeWindow("enduranceMax",55,10)
moveWindow("enduranceBar", 22,offset+55)
moveWindow("enduranceMax", 22,offset+55)


createLabel("willpowerMax",0,0,0,0,1);
createLabel("willpowerBar",0,0,0,0,1);
setBackgroundColor("willpowerMax",153,102,204,255)
setBackgroundColor("willpowerBar",153,102,204,100)
moveWindow("willpowerBar", 22,offset+70)
resizeWindow("willpowerBar",55,10)
moveWindow("willpowerMax", 22,offset+70)
resizeWindow("willpowerMax",55,10)
end

