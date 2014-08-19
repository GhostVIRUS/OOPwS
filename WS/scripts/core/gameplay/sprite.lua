---===Sprite===---
-- includes
local class =
require('middleclass')
require('entity')

-- declaring
print('- Requiring \'Sprite\' class -')
Sprite = class('Sprite', Entity)

-- public methods
function Sprite:initialize(name, pos, props)
	Entity:initialize(self, name, pos, props)


	self._objectType = 'user_sprite'
	-- this is important -> self._texture 
end