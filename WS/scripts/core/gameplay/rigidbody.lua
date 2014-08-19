---===RigidBody===---
-- includes
local class = 
require('middleclass')
require('entity')

-- declaring
print('- Requiring \'RigidBodyStatic\' class -')
RigidBodyStatic = class('RigidBodyStatic', Entity)

-- public methods
function RigidBodyStatic:initialize(name, pos, props)
	Entity.initialize(self, name, pos, props)

end

-- TODO: Add on_damage, on_destroy auto-handlers

---===UserObject===---
-- declaring
print('- Requiring \'UserObject\' class -')
UserObject = class('UserObject', RigidBodyStatic)

-- public methods
function UserObject:initialize(name, pos, props)
	RigidBodyStatic.initialize(self, name, pos, props)

end
