-- includes
local class = 
require('middleclass')

-- declaring
print('- Creating \'Map\' class')
Map = class('Map')

-- private members
local _id
local _fileName -- possibly should be merged with id

local _objects = {}
local _structures = {}


-- private methods
local function _read()
	-- reading map data from lua file
end

-- public methods
function Map:initialize(id, fileName)
	_id = id
	_fileName = fileName
end

function Map:build()
	_read()
	-- here comes building
end

