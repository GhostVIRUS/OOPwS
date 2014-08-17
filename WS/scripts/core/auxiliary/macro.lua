-- Here are functions :D

function macro.GET32(x, y, type)
	if type == 'table' then
		return { x = x*32-16, y = y*32-16 }
	elseif type == 'values' then
		return x*32-16, y*32-16
	else
		return x*32-16, y*32-16
	end
end