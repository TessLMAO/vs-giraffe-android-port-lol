local NoteSys = false;
local Strumposx = {0,0,0,0}
local Strumposy = {0,0,0,0}
local Strumposopx = {0,0,0,0}
local Strumposopy = {0,0,0,0}

function onCreate()
    math.randomseed(os.time())
end

function onBeatHit()
    --triggerEvent('MissingNo-RandomNote')

end

function onUpdatePost()
    --triggerEvent('MissingNo-RandomNote')
    if NoteSys then
        noteCount = getProperty('notes.length');
        for i = 0, noteCount-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') then
                nd = getPropertyFromGroup('notes', i, 'noteData');
                isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
                if Strumposy[nd+1] > 360 then
                    setPropertyFromGroup('notes', i, 'y',(Strumposy[nd+1] + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                    if isSustainNote then
                        if downscroll then
                            setPropertyFromGroup('notes', i, 'angle',0)
                            if string.find(getPropertyFromGroup('notes', i, 'animation.curAnim.name'):lower(), 'end') then
                                setPropertyFromGroup('notes', i, 'y',(Strumposy[nd+1] + 60 + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                            end
                        else
                            setPropertyFromGroup('notes', i, 'angle',180)
                            if string.find(getPropertyFromGroup('notes', i, 'animation.curAnim.name'):lower(), 'end') then
                                setPropertyFromGroup('notes', i, 'y',(Strumposy[nd+1] + 60 + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                            end
                        end
                    end
                else
                    setPropertyFromGroup('notes', i, 'y',(Strumposy[nd+1] - 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                    if isSustainNote then
                        if downscroll then
                            setPropertyFromGroup('notes', i, 'angle',180)
                        else
                            setPropertyFromGroup('notes', i, 'angle',0)
                        end
                    end
                end
            end
        end
    end
    --debugPrint(os.time())

    --setPropertyFromGroup('notes', i, 'y',(8000 + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
end

function onEvent(n, v1, v2)
    if n == 'MissingNo-RandomNote' then
        if v1 == 'Reset' then
            Strumposx[1] = defaultPlayerStrumX0
            Strumposy[1] = defaultPlayerStrumY0
            Strumposx[2] = defaultPlayerStrumX1
            Strumposy[2] = defaultPlayerStrumY1
            Strumposx[3] = defaultPlayerStrumX2
            Strumposy[3] = defaultPlayerStrumY2
            Strumposx[4] = defaultPlayerStrumX3
            Strumposy[4] = defaultPlayerStrumY3

            Strumposopx[1] = defaultOpponentStrumX0
            Strumposopy[1] = defaultOpponentStrumY0
            Strumposopx[2] = defaultOpponentStrumX1
            Strumposopy[2] = defaultOpponentStrumY1
            Strumposopx[3] = defaultOpponentStrumX2
            Strumposopy[3] = defaultOpponentStrumY2
            Strumposopx[4] = defaultOpponentStrumX3
            Strumposopy[4] = defaultOpponentStrumY3
            for i = 0,3 do
                setPropertyFromGroup('playerStrums',i,'x',Strumposx[i+1])
                setPropertyFromGroup('playerStrums',i,'y',Strumposy[i+1])
                setPropertyFromGroup('opponentStrums',i,'x',Strumposopx[i+1])
                setPropertyFromGroup('opponentStrums',i,'y',Strumposopy[i+1])
            end
            noteCount = getProperty('notes.length');
            for i = 0, noteCount-1 do
                if getPropertyFromGroup('notes', i, 'mustPress') then
                nd = getPropertyFromGroup('notes', i, 'noteData');
                isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
                    --setPropertyFromGroup('notes', i, 'y',(Strumposy[nd+1] - 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                    if isSustainNote then
                        if downscroll then
                            setPropertyFromGroup('notes', i, 'angle',0)
                        else
                        setPropertyFromGroup('notes', i, 'angle',180)
                        end
                    end
                end
            end
            NoteSys = false;
        else
            Strumposopx[1] = defaultOpponentStrumX0
            Strumposopy[1] = defaultOpponentStrumY0
            Strumposopx[2] = defaultOpponentStrumX1
            Strumposopy[2] = defaultOpponentStrumY1
            Strumposopx[3] = defaultOpponentStrumX2
            Strumposopy[3] = defaultOpponentStrumY2
            Strumposopx[4] = defaultOpponentStrumX3
            Strumposopy[4] = defaultOpponentStrumY3
            for i = 0,3 do
                Strumposx[i+1] = math.random(0+(275*i),275+(275*i))
                Strumposy[i+1] = math.random(100,500)
                setPropertyFromGroup('playerStrums',i,'x',Strumposx[i+1])
                setPropertyFromGroup('playerStrums',i,'y',Strumposy[i+1])
                setPropertyFromGroup('opponentStrums',i,'x',Strumposopx[i+1]-2000)
                setPropertyFromGroup('opponentStrums',i,'y',Strumposopy[i+1]-2000)
            end
            NoteSys = true;
        end
    end
end

