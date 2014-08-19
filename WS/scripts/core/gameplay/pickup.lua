---===Pickup===---
-- includes
local class = 
require('middleclass')
require('entity')

-- declaring
print('- Requiring \'Pickup\' class -')
Pickup = class('Pickup', Entity)

-- public methods
function Pickup:initialize(name, pos, props)
	Entity.initialize(self, name, pos, props)

	self._owner = nil
end



---===Powerup===---
-- declaring
print('- Requiring \'Powerup\' class -')
Powerup = class('Powerup', Pickup)

-- public methods
function Powerup:initialize(name, pos, powerupType, props)
	Pickup.initialize(self, name, pos, props)

	self._objectType = powerupType 
end



---===Weapon===---
-- declaring
print('- Requiring \'Weapon\' class -')
Weapon = class('Weapon', Pickup)

-- public methods
function Weapon:initialize(name, pos, weaponType, props)
	Pickup.initialize(self, name, pos, props)

	self._objectType = weaponType
end