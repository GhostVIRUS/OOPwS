---===Trigger===---
-- includes
local class = 
require('middleclass')
require('entity')

-- declaring
print('- Requiring \'Trigger\' class -')
Trigger = class('Trigger', Entity)

-- public methods

function Trigger:initialize(name, pos, props)
	Entity.initialize(self, name, pos, props)

	self._objectType = 'trigger'
end
