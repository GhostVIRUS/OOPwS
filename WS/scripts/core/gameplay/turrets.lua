-- testfile
--[[
local class = 
require('middleclass')
require('object')

turret = class('turret', Object)

function turret:initialize(name, pos, actorId, props)
	Object.initialize(self, name, pos, props)
	turret.setPrivate(self, 'actorId', actorId)
end]]