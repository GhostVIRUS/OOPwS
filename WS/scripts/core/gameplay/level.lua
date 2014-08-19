---===Level===---
-- includes
local class = 
require('middleclass')
--require('map')

-- declaring
print('- Requiring \'Level\' class')
Level = class('Level')

-- public methods
function Level:initialize(id)
	
	-- conditionally private members
	self._id = id -- level folder's name
	self._maps = {} -- list of maps on this level
	self._currentMap = nil
	self._characters = {} -- list of characters on this level
	-- Note: maps, currentMap and characters are automaticly read while initializing
end

function Level:setMap(id)
	self._currentMap = id
	--maps[currentMap]:build() -- requires map class
end

function Level:run()
	dofile(path.levels..self._id..'/init.lua')
end