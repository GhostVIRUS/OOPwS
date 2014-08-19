---===RigidBodyStatic===---
-- includes
local class = 
require('middleclass')

-- declaring
print('- Requiring \'RigidBodyStatic\' class -')
RigidBodyStatic = class('RigidBodyStatic')

-- public methods
function RigidBodyStatic:initialize(name, pos, props)
	if props == nil then
		props = {}
	end
	if props['name'] == nil then
		props.name = name
	end

	-- conditionally private members
	self._name = name
	self._pos = pos
	self._link = link
	self._isVisible = false
	self._props = props

	self._objectType = nil -- maybe this will not be needed

	return nil
end

function RigidBodyStatic:getPosition()
	return self._pos
end

function RigidBodyStatic:setProperties(props) -- requires table property-value
	for key, value in pairs(props) do
		self._props[key] = value
	end

	if self._isVisible == true then
		self:_updateProps()
	end

	return nil
end

function RigidBodyStatic:setVisibility(value)
	print(self._name..':setVisibility()')
	if value == true then
		self:_show()
	elseif value == false then
		self:_hide()
	end

	return nil
end

function RigidBodyStatic:move(pos, parameters) -- parameters.time in seconds; if time = 0 works as setposition
	print(self._name..':move()')
	local xCathetus = pos.x - self._pos.x
	local yCathetus = pos.y - self._pos.y
	local hypotenuse = math.sqrt((xCathetus * xCathetus) + (yCathetus * yCathetus))
	local alpha = math.acos(xCathetus / hypotenuse)
	if pos.y < self._pos.y then
		alpha = math.pi*2 - alpha
	end

	local currentTime = 0
	local currentSpeed = 0
	if parameters.time ~= nil then
		currentSpeed = hypotenuse/(parameters.time*50)
	else
		currentSpeed = parameters.speed/50
	end
	if parameters.time == 0 then
		currentSpeed = hypotenuse
	end
	for i = 1, hypotenuse, currentSpeed do
		pushcmd( 
			function()
				self._pos.x = math.min(self._pos.x + math.cos(alpha)*currentSpeed, pos.x)
				self._pos.y = math.min(self._pos.y + math.sin(alpha)*currentSpeed, pos.y)
				self:_updatePos() -- instead of setposition
			end, currentTime)
		currentTime = currentTime + (1/50)
	end

	return nil
end

function RigidBodyStatic:follow(who, speed)

end

-- conditionally private methods
function RigidBodyStatic:_saveProps()
	print(self._name..':_saveProps()')
	local tempTable = getmetatable(self._link)
	local property = 'name'

	while property ~= nil do
		self._props[property] = tempTable.__index(self._link, property)
		property = tempTable.__next(self._link, property)
	end

	return nil
end

function RigidBodyStatic:_show()
	print(self._name..':_show()')
	self._link = actor(self._objectType, self._pos.x, self._pos.y, self._props)
	self._isVisible = true
	self:_saveProps()

	return nil
end

function RigidBodyStatic:_hide()
	print(self._name..':_hide()')
	self._isVisible = false
	self:_saveProps()
	kill(self._link)
	self._link = nil

	return nil
end

function RigidBodyStatic:_updatePos() -- updating real RigidBodyStatic's coords from props
--	print(self._name..':_updatePos()') -- Floods a lot
	if self._isVisible == true then
		setposition(self._link, self._pos.x, self._pos.y)
	end

	return nil
end

function RigidBodyStatic:_updateProps() -- updating real RigidBodyStatic's properties from props
	if self._isVisible == true then
		for key, value in pairs(self._props) do
			self._link[key] = value
		end
	end

	return nil
end