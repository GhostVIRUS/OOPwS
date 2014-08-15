-- includes
local class = 
require('middleclass')

require('object')

print('- Creating \'Concrete\' class -')
Concrete = class('Concrete', Object)


function Concrete:initialize(name, pos, props)
	Object.initialize(self, name, pos, props)
	Concrete.setPrivate(self, 'actorId', 'wall_concrete')
end
