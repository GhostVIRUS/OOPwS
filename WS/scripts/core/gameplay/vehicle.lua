---===Vehicle===---
-- includes
local class = 
require('middleclass')
require('rigidbodydynamic')

-- declaring
print('- Requiring \'Vehicle\' class -')
Vehicle = class('Vehicle', RigidBodyDynamic)

-- public methods
function Vehicle:initialize(name, pos, props)
	RigidBodyDynamic.initialize(self, name, pos, props)

	self._class = nil -- nil only for now
end