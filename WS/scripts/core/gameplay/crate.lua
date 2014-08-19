---===Crate===---
-- includes
local class = 
require('middleclass')
require('rigidbodydynamic')

-- declaring
print('- Requiring \'Crate\' class -')
Crate = class('Crate', RigidBodyDynamic)

-- public methods
function Crate:initialize(name, pos, props)
	RigidBodyDynamic.initialize(self, name, pos, props)

	
end