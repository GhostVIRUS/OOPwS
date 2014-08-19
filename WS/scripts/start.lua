-- First executable file
print('-- Initialization of WS --')
print('-- \'package.path\' is set to: \''..package.path..'\' --')
print('-- Loading \'macro.lua\' --')
dofile(path.aux..'macro.lua')
print('----------------------------')
--dofile(path.levels..'demo/init.lua')
require('level')

myLevel = Level:new('demo')
myLevel:run()