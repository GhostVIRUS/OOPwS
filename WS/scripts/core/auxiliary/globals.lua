-- Global tables and variables

path = {
	-- scripts folder
	aux = 'campaign/WS/scripts/core/auxiliary/',
	gameplay = 'campaign/WS/scripts/core/gameplay/',
	gui = 'campaign/WS/scripts/core/gui/',
	-- levels
	levels = 'campaign/WS/scripts/levels/'
	-- sounds

	-- textures

}

package.path = 'data/'..path.gameplay..'?.lua' -- classes folder

templates = {
	position = {
		x = 0,
		y = 0,
	}
}

macro = {

}
