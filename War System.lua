-- Launcher of War System campaign
reset()
--[[
function unrequire(module)
	if module == 'all' then
		for i=1, #package.loaded do
			package.loaded[i] = nil
			_G[i] = nil
		end
	else
		package.loaded[module] = nil
		_G[module] = nil
	end
end

unrequire('all')]]

print('--- Launching War System ---')
print('----------------------------')
dofile('campaign/WS/scripts/start.lua')
