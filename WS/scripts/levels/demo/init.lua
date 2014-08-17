-- Demo level initializer

print('-- Launching \'Demo\' level --')
newmap(100, 100)

require('walls')
--require('turrets')

walls = {}

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

print('-- All scripts have been completed but pushcmd --')