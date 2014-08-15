-- includes
local class = 
require('middleclass')

-- declaring
print('- Creating \'Object\' class -')
Object = class('Object')

-- static variables


-- metatable for private members
local _private = setmetatable({}, {__mode = "k"})

-- private methods
local saveProps = function(self)
	local tempTable = getmetatable(_link)
	local property = 'name'

	while property ~= nil do
		_private[self].props[property] = tempTable.__index(_private[self].link, property)
		property = tempTable.__next(_private[self].link, property)
	end

	return nil
end

local show = function(self)
	print('Object:show')
	_private[self].link = actor(_private[self].actorId, _private[self].pos.x, _private[self].pos.y, _private[self].props)
	_private[self].isVisible = true

	return nil
end

local hide = function(self)
	saveProps(self)
	kill(_private[self].link)
	_private[self].link = nil

	_private[self].isVisible = false

	return nil
end

local updatePos = function(self) -- updating real object's coords from props
	setposition(_private[self].link, _private[self].pos.x, _private[self].pos.y)

	return nil
end

local updateProps = function(self) -- updating real object's properties from _props
	for key, value in pairs(_private[self].props) do
		_private[self].link[key] = value
	end

	return nil
end

-- public methods
function Object:initialize(name, pos, props)
	_private[self] = {
		name = name,
		pos = pos,
		isVisible = false,
		link = nil,
		props = props,

		actorId = nil
	}
	_private[self].props = _private[self].props or {name = _private[self].name} 
	_private[self].props.name = _private[self].props.name or _private[self].name 

	return nil
end

function Object:setPosition(x, y)
	_private[self].pos.x = _private[self].pos.x or x
	_private[self].pos.y = _private[self].pos.y or y

	if _private[self].isVisible == true then
		updatePos(self) -- instead of setposition
	end

	return nil
end

function Object:getPosition()
	return _private[self].pos
end

function Object:setProperties(...) -- requires table property-value
	for key, value in pairs(arg) do
		_private[self].props[key] = value
	end

	if _private[self].isVisible == true then
		updateProps(self)
	end

	return nil
end

function Object:getPrivate(key)
	return _private[self][key]
end

function Object:setPrivate(key, value)
	_private[self][key] = value

	return nil
end

function Object:setVisibility(value)
	print('Object:setVisibility')
	if value == true then
		show(self)
	elseif value == false then
		hide(self)
	end

	return nil
end

function Object:move(pos, time) -- time in seconds
	local xCathetus = pos.x - _private[self].pos.x
	local yCathetus = pos.y - _private[self].pos.y
	local hypotenuse = math.sqrt((xCathetus * xCathetus) + (yCathetus * yCathetus))
	local alpha = math.acos(xCathetus / hypotenuse);
	if pos.y < _private[self].pos.y then
		alpha = math.pi*2 - alpha
	end

	local currentTime = 0
	for i = 1, hypotenuse, hypotenuse/(time*50) do
		print(i)
		currentTime = currentTime + (1/50)
		print(currentTime)
		pushcmd( 
			function()
				_private[self].pos.x = _private[self].pos.x + math.cos(alpha)*(hypotenuse/(time*50))
				_private[self].pos.y = _private[self].pos.y + math.sin(alpha)*(hypotenuse/(time*50))
				updatePos(self) -- instead of setposition
			end, currentTime)
	end

	return nil
end