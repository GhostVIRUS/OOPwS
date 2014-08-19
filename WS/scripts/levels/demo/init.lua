-- Demo level initializer

print('-- Launching \'Demo\' level --')
newmap(100, 100)

require('walls')
require('turrets')

walls = {}
turrets = {'turret_cannon', 'turret_rocket', 'turret_minigun', 'turret_gauss'}

for i = 1, 10 do
	if math.random() > 0.5 then
		walls['wall'..i] = Concrete:new('wall'..i, macro.GET32(9+i, 9+i, 'table'), { --[[name = 'c'..i,]] corner = i % 4 })
	else
		walls['wall'..i] = Brick:new('wall'..i, macro.GET32(9+i, 9+i, 'table'), { --[[name = 'c'..i,]] corner = i % 4 })
	end
	pushcmd( function() walls['wall'..i]:setVisibility(true) end, i/5)
	pushcmd( function() walls['wall'..i]:move(macro.GET32(19+i, 9+i, 'table'), { time = 5/i }) end, 2*i/5)
end

pushcmd( function() walls['wall5']:setVisibility(false) end, 2)
pushcmd( function() walls['wall5']:setVisibility(true) end, 7)

for i = 1, 4 do
	turrets[i] = Turret:new('turret'..i, macro.GET32(5+i*2, 5, 'table'), turrets[i], { sight = i*20, team = i })
--	pushcmd( function() turrets[i]:setVisibility(true) end, i)
end

for i = 1, 1000 do
	pushcmd( function() walls['wall1']:setProperties({ corner = i%4 }) end, i/10)
end

classes['fat'] = tcopy(classes.default)
classes['fat'].health = 10000

actor('respawn_point', macro.GET32(10, 20))
service('player_local', {nick = 'killero!', name = 'bitch', vehname = 'train', class = 'fat'})

killingMachine = Turret:new('someFire', macro.GET32(2, 10, 'table'), 'turret_zippo', { sight = 50 })
killingMachine:setVisibility(true)
pushcmd( function() killingMachine:follow('train', 6*32, 0) end, 3)

print('-- All scripts have been completed but pushcmd --')