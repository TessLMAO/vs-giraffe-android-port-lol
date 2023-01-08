function onCreate()

	makeLuaSprite('BlackFlash', '', -10, -10);
	makeGraphic('BlackFlash',1300,740,'000000')
	addLuaSprite('BlackFlash', true)
	setObjectCamera('BlackFlash','other')
	setProperty('BlackFlash.visible', false)

end

function onEvent(name, value1, value2)

	if name == 'BlackOut' then

		if value1 == 'true' then

			setProperty('BlackFlash.visible', true);
			setProperty('scoreTxt.visible', false)
			setProperty('iconP1.visible', false)
			setProperty('iconP2.visible', false)
			setProperty('healthBar.visible', false)
			setProperty('healthBarBG.visible', false)

		elseif value1 == 'false' then

			setProperty('BlackFlash.visible', false)
			setProperty('scoreTxt.visible', true)
			setProperty('iconP1.visible', true)
			setProperty('iconP2.visible', true)
			setProperty('healthBar.visible', true)
			setProperty('healthBarBG.visible', true)

		end
	end
end