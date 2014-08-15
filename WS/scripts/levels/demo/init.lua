-- Demo level initializer

print('-- Launching \'Demo\' level --')


require('concrete')

myConcrete = Concrete:new('concrete1', {x = 5*32, y = 5*32})
myConcrete2 = Concrete:new('concrete2', {x = 7*32-16, y = 7*32-16}, {name = 'cool_concrete', corner = 0})

myConcrete2:setVisibility(true)
myConcrete:setVisibility(true)

pushcmd(function() myConcrete2:move({x = 320, y = 320}, 1) myConcrete:move({x = 320, y = 320}, 1) end, 2)

--link = actor('wall_brick', 100, 100, {name='1'})

print('Test')