-- includes
local class = 
require('middleclass')

require('map')

-- declaring
print('- Creating \'Level\' class')
Level = class('Level')

-- private members
local _id -- level folder's name

local _maps = {} -- list of maps on this level
local _currentMap

local _characters = {} -- list of characters on this level

-- public methods
function Level:initialize(id, ...)
	_id = id

	-- Note: maps, currentMap and characters are automaticly read while initializing
	_maps = arg.maps
	_currentMap = arg.currentMap
end

function Level:setMap(id)
	_currentMap = id
	--maps[currentMap]:build() -- requires map class
end

function Level:run()
	-- body
end