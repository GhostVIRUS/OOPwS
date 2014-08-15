-- Here are functions for reseting and garbage collecting

function unrequire(module) -- unloads all/chosen modules (classes)
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