function onCreatePost()

	makeLuaSprite('dadwin', 'icons/win-giraffe', getProperty('iconP2.x'), getProperty('iconP2.y'))
	setObjectCamera('dadwin', 'hud')
	addLuaSprite('dadwin', true)
	setObjectOrder('dadwin', getObjectOrder('healthBar') + 3)

	setProperty('dadwin.flipX', false)
	setProperty('dadwin.visible', false)
end

function onUpdate(elapsed)
		
	setProperty('dadwin.x', getProperty('iconP2.x'))
	setProperty('dadwin.y', getProperty('iconP2.y'))
	setProperty('dadwin.angle', getProperty('iconP2.angle'))
	setProperty('dadwin.scale.x', getProperty('iconP2.scale.x'))
	setProperty('dadwin.scale.y', getProperty('iconP2.scale.y'))
			
	if getProperty('healthBar.percent') < 35 then
		setProperty('iconP2.visible', false)
		setProperty('dadwin.visible', true)
	else
		setProperty('iconP2.visible', true)
		setProperty('dadwin.visible', false)
	end
end