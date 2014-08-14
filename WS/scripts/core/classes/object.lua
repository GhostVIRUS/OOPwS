local class = require('middleclass')

--print(class)

print('- Creating \'Object\' class -')
Object = class('Object')

function Object:initialize(name)
	self.name = name
end

function Object:getName()
	print('My name is: '..self.name)
end
