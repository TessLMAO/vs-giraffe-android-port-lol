local DHP = 0;
local DHPColor = 'AAAAAA';
local DHPscale = {x=1,y=0}
local sprite_p1 = "healthbar_p1"
local safehealth = true;

local width = 593
local height = 11

function onCreate()
    DHP = 0;

    bar_origin_x = getProperty("healthBar.x")
	bar_origin_y = getProperty("healthBar.y")

    makeLuaSprite(sprite_p1, "",getProperty("healthBar.x"),getProperty("healthBar.y"))
	makeGraphic(sprite_p1,getProperty("healthBar.width"),getProperty("healthBar.height"),DHPColor)
	addLuaSprite(sprite_p1, false)
	setObjectCamera(sprite_p1, "hud")
	setObjectOrder(sprite_p1, 2)
	setProperty(sprite_p1 .. ".origin.x", getProperty("healthBar.width"))
    debugPrint(getProperty("healthBar.width")+getProperty("healthBar.x"))
    setProperty(sprite_p1 .. ".scale.x",DHP)
    setObjectOrder(sprite_p1, getObjectOrder('healthBar'))
end

function onUpdatePost()
    --setProperty(sprite_p1 .. ".scale.x",math.random(0.0,1.5))
    local health = getProperty('health');
    --debugPrint(health..'|'..DHP*2)
    if health < DHP*2 then
        --debugPrint('nnnnn')
        setProperty('health', 0)
    end
end

function onEvent(n, v1, v2)
    if n == 'Celebi-HPsys' then
        DHP = v1/2;
        doTweenX('celebi-tween',sprite_p1 .. ".scale", DHP, 1, 'quartOut')
    end
end