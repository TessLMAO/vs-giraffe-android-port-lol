function onEvent(name,v1,v2)

  if name == 'HUDbye' then

    if v1 == '1' then
        doTweenAlpha('bye','camHUD', 0, v2, 'linear')

    elseif v1 == '0' then

        doTweenAlpha('hi','camHUD', 1, v2, 'linear')
    end

  end
end