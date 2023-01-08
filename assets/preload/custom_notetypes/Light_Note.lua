local TimeTemp = 0;
local timess = 0;
local timeall = 0;
local timeres = false;

local timetiming = 0;
local timelighttemp = 0;
local lightLimit = 30;

local lightmode = false;

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Light_Note' then --Check if the note on the chart is a Bullet Note
			--setPropertyFromGroup('unspawnNotes', i, 'texture', 'Note'); --Change texture
            --setPropertyFromGroup('unspawnNotes', i, "colorSwap.brightness", 20)
            setPropertyFromGroup('unspawnNotes', i, "colorSwap.saturation", -10)
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 20);
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -10);

			--[[if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end]]
		end
	end
    if getPropertyFromClass('Conductor', 'songPosition')/1000 < 0 then
        timeall = 0;
    else
        timeall = getPropertyFromClass('Conductor', 'songPosition')/1000;
    end
end

function onSongStart()
    lightmode = true;
end
function onUpdate()
    if lightmode then
        --debugPrint(getPropertyFromClass('Conductor', 'songPosition'))
    if timeres == true then
        --timeall = os.clock();
        if getPropertyFromClass('Conductor', 'songPosition')/1000 < 0 then
            timeall = 0;
        else
            timeall = getPropertyFromClass('Conductor', 'songPosition')/1000;
        end
        timeres = false;
    end
    if getPropertyFromClass('Conductor', 'songPosition')/1000 < 0 then
        timeall = 0;
    else
        TimeTemp = getPropertyFromClass('Conductor', 'songPosition')/1000;
    end
    --TimeTemp = os.clock();
    timess = TimeTemp-timeall;
    timeall = TimeTemp;
    --debugPrint(timelighttemp..'|'..timeall..'|'..lightLimit);
    
    timelighttemp = timelighttemp+timess

    for i = 0,3 do
        if (lightLimit-timelighttemp) < 0 then
            setPropertyFromGroup('playerStrums',i,'alpha', 0.2)
        else
            setPropertyFromGroup('playerStrums',i,'alpha', ((lightLimit-timelighttemp)/lightLimit)+0.2)
        end
    end

    noteCount = getProperty('notes.length');
    for i = 0, noteCount-1 do
        noteType = getPropertyFromGroup('notes', i, 'noteType');
        if noteType == 'Light_Note' then
            setPropertyFromGroup('notes',i,'alpha', 1)
        else
            --setPropertyFromGroup('notes',i,'alpha', ((lightLimit-timelighttemp)/lightLimit)+0.2)
        end
    end
    --debugPrint(lightLimit-timelighttemp)
    end
end

function onPause()
    timeres = true
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Light_Note' then
        if getPropertyFromClass('Conductor', 'songPosition')/1000 < 0 then
            timeall = 0;
        else
            timeall = getPropertyFromClass('Conductor', 'songPosition')/1000;
        end
		--timeall = os.clock();
        timelighttemp = 0;
        playSound('recover')
    end
end

