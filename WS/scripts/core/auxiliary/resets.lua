-- Here are functions for reseting and garbage collecting

function unrequire(module) -- unloads all/chosen modules (classes)
	if module == 'all' then
		for key,_ in pairs(package.loaded) do
			package.loaded[key] = nil
			_G[key] = nil
		end
	else
		package.loaded[module] = nil
		_G[module] = nil
	end
end