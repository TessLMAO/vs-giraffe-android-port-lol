function onEvent(name,value1,value2)

    if name == 'BeatCameraZoom' then

        beatTime = 60 / getPropertyFromClass('Conductor', 'bpm') * 0.95
        addHUD = value2
        addGame = value2 / 2
        BeatZoom = true

        --debugPrint('BeatZoom = true')

        if value1 == '0' then

            BeatZoom = false
            onebeat = false
            twobeat = false
            fourbeat = false

            --debugPrint('All false')

        elseif value1 == '2' then

            onebeat = false
            twobeat = true
            fourbeat = false

            --debugPrint('two = true')

        elseif value1 == '4' then

            onebeat = false
            twobeat = false
            fourbeat = true

            --debugPrint('four = true')

        else

            onebeat = true
            twobeat = false
            fourbeat = false

            --debugPrint('one = true')

        end

    end

end



function onBeatHit()

    if BeatZoom == true then

        if onebeat == true then

            --setProperty('camGame.zoom',1 + addGame)
            --doTweenZoom('camz', 'camGame', 1, beatTime, 'quadOut')

            setProperty('camHUD.zoom',1 + addHUD)
            doTweenZoom('camh', 'camHUD', 1, beatTime, 'quadOut')

        elseif twobeat == true then

            if curBeat % 2 == 0 then

                --setProperty('camGame.zoom',1 + addGame)
                --doTweenZoom('camz2', 'camGame', 1, beatTime * 2, 'quadOut')

                setProperty('camHUD.zoom',1 + addHUD)
                doTweenZoom('camh2', 'camHUD', 1, beatTime * 2, 'quadOut')

            end

        elseif fourbeat == true then

            if curBeat % 4 == 0 then

                --setProperty('camGame.zoom',1 + addGame)
                --doTweenZoom('camz4', 'camGame', 1, beatTime * 2, 'quadOut')

                setProperty('camHUD.zoom',1 + addHUD)
                doTweenZoom('camh4', 'camHUD', 1, beatTime * 2, 'quadOut')

            end

        end

    end

end
