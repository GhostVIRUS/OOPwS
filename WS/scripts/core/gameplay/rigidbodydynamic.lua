---===RigidBodyDynamic===---
-- includes
local class = 
require('middleclass')
require('rigidbody')

-- declaring
print('- Requiring \'RigidBodyDynamic\' class -')
RigidBodyDynamic = class('RigidBodyDynamic', RigidBodyStatic)

-- public methods
function RigidBodyDynamic:initialize(name, pos, props)
	RigidBodyStatic.initialize(self, name, pos, props)

	
end