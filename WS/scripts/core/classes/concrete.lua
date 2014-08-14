local class = require('middleclass')
require('object')

print('- Creating \'Concrete\' class -')
Concrete = class('Concrete', Object)

function Concrete:initialize(name, age)
	Object.initialize(self, name)
	self.age = age
end

function Concrete:getAge()
	print('My age: '..self.age)
end