-- Launcher of War System campaign
reset()
print('--- Launching War System ---')
print('-- Loading \'globals.lua\' --')
dofile('campaign/WS/scripts/core/auxiliary/globals.lua')
print('-- Loading \'resets.lua\' --')
dofile(path.aux..'resets.lua')
print('-- Clearing \'package.loaded\' (unloading modules) --')
unrequire('all') -- this is possibly broken
reset()
conf.sv_nightmode = false

dofile('campaign/WS/scripts/start.lua')
