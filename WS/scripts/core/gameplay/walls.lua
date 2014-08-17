---===Wall===---
-- includes
local class = 
require('middleclass')
require('rigidbody')

-- declaring
print('- Requiring \'Wall\' class -')
Wall = class('Wall', RigidBodyStatic)

-- public methods
function Wall:initialize(name, pos, props)
	RigidBodyStatic.initialize(self, name, pos, props)

	return nil
end

function Wall:_show()
--	self._link = actor('wall_concrete', self._pos.x, self._pos.y, self._props)
	RigidBodyStatic._show(self)

	return nil
end

function Wall:_updatePos()
	local corner = self._props.corner
	if corner ~= 0 then
		self._props.corner = 0
		self:_updateProps()
		RigidBodyStatic._updatePos(self)
		self._props.corner = corner
		self:_updateProps()
	else
		RigidBodyStatic._updatePos(self)
	end
end


---===Concrete===---
print('- Requiring \'Concrete\' class -')
Concrete = class('Concrete', Wall)

function Concrete:initialize(name, pos, props)
	Wall.initialize(self, name, pos, props)
	
	return nil
end

function Concrete:_show()
	self._link = actor('wall_concrete', self._pos.x, self._pos.y, self._props)
	Wall._show(self)
end

--[[function Concrete:_show()
	self._link = actor('wall_concrete', self._pos.x, self._pos.y, self._props)
	RigidBodyStatic._show(self)

	return nil
end

function Concrete:_updatePos()
	local corner = self._props.corner
	if corner ~= 0 then
		self._props.corner = 0
		self:_updateProps()
		RigidBodyStatic._updatePos(self)
		self._props.corner = corner
		self:_updateProps()
	else
		RigidBodyStatic._updatePos(self)
	end
end]]

---===Brick===---

print('- Requiring \'Brick\' class -')
Brick = class('Brick', Wall)

function Brick:initialize(name, pos, props)
	Wall.initialize(self, name, pos, props)
	
	return nil
end

function Brick:_show()
	self._link = actor('wall_brick', self._pos.x, self._pos.y, self._props)
	Wall._show(self)
end