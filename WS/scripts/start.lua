-- First executable file
package.path = 'data/campaign/WS/scripts/core/classes/?.lua'

print('-- Initialization of WS --')
print('-- Classes lib is set to: '..package.path..' --')
print('')
dofile('campaign/WS/scripts/levels/demo/init.lua')