---===Turrets===---
-- includes
local class = 
require('middleclass')
require('rigidbody')

---===Turret===---
--declaring
print('- Requiring \'Turret\' class -')
Turret = class('Turret', RigidBodyStatic)

-- public methods
function Turret:initialize(name, pos, turretType, props)
	assert(type(turretType) == 'string', 'bad argument #3 to\'Turret:initialize\' (\'string\' expected, got \''..type(turretType)..'\')')

	RigidBodyStatic.initialize(self, name, pos, props)

	self._objectType = turretType

	return nil
end

--[[ conditionally private methods
function Turret:_show()
	RigidBodyStatic._show(self)

	return nil
end]]