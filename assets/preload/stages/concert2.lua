function onCreate()

luaDebugMode = true

--Stage

  makeLuaSprite('front', 'BG/stagefront', -1550, -840)
  setScrollFactor('front', 1, 1);

  makeAnimatedLuaSprite('sayuu', 'BG/sayuu', -1550, -840)
  addAnimationByPrefix('sayuu', 'idle', 'sayuu', 24, false)

  makeLuaSprite('screen', 'BG/screenframe', -1550, -840)
  setScrollFactor('screen', 1, 1);

  makeAnimatedLuaSprite('speaker', 'BG/speaker', -970, -200)
  addAnimationByPrefix('speaker', 'idle', 'speaker', 24, false)

  addLuaSprite('sayuu', false);
  addLuaSprite('front', false);
  addLuaSprite('screen', false);
  addLuaSprite('speaker', false);

--Characters

  makeAnimatedLuaSprite('gf1', 'characters/gf1', 500, -500)
  addAnimationByPrefix('gf1', 'idle', 'gf1 idle', 24, false)

  makeAnimatedLuaSprite('moyashiro', 'BG/moyashiro', -940, -740)
  addAnimationByPrefix('moyashiro', 'idle', 'moyashiro', 24, false)

  makeAnimatedLuaSprite('shin', 'BG/shin', -1070, -320)
  addAnimationByPrefix('shin', 'idle', 'shinBG', 24, false)

  makeAnimatedLuaSprite('cyan', 'BG/cyan', -860, -260)
  addAnimationByPrefix('cyan', 'idle', 'cyan', 24, false)

  makeAnimatedLuaSprite('kankyaku', 'BG/kankyaku', -1900, -350)
  setScrollFactor('kankyaku', 1.2, 1.2)
  addAnimationByPrefix('kankyaku', 'idle', 'kankyaku', 24, false)

  makeAnimatedLuaSprite('lordxmajin', 'BG/lordxmajin', -1500, 50)
  setScrollFactor('lordxmajin', 1.35, 1.35)
  addAnimationByPrefix('lordxmajin', 'idle', 'lordxmajin', 24, false)

  addLuaSprite('gf1', false)
  addLuaSprite('moyashiro', false)
  addLuaSprite('shin', false)
  addLuaSprite('cyan', false)

  addLuaSprite('kankyaku', true)
  addLuaSprite('lordxmajin', true)



end

function onCreatePost()

  setScrollFactor('gfGroup', 1, 1)
  setObjectOrder('gfGroup', 3)

end

--BG dancing

function bgDance()

  playAnim('moyashiro', 'idle', true)
  playAnim('shin', 'idle', true)
  playAnim('cyan', 'idle', true)
  playAnim('gira', 'idle', true)
  playAnim('sayuu', 'idle', true)
  playAnim('lordxmajin', 'idle', true)
  playAnim('kankyaku', 'idle', true)

end



function onBeatHit()

  if curBeat % 2 == 0 then

    playAnim('gf1', 'idle', true)
  end

  bgDance()
  playAnim('speaker', 'idle', true)
  
end

function onSongStart()
  bgDance()
end

--[[
function opponentNoteHit(id,d,t,s)

  anim = {'singLEFT','singDOWN','singUP','singRIGHT'}
  playAnim('gf', anim[d+1], true)
  setProperty('gf.specialAnim', true)

end
]]--


--fuwafuwa lordx
function onUpdate(elapsed)
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/110)
      doTweenY('shaggy', 'lordxmajin', 90-40*math.sin((currentBeat*0.35)*math.pi),0.001)
end