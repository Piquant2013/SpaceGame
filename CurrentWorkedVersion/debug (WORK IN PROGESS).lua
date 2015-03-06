local Gamestate = require 'vendors/gamestate'

debug = Gamestate.new()


function debug:init()
end

function debug:update(dt)
end

function debug:draw()
	
	if debugmode == true then
		
		love.graphics.print("Debug Mode", 100, 100)

		love.graphics.draw("game.PlayerY = " .. game.PlayerY, 150, 150)
		love.graphics.draw("game.PlayerX = " .. game.PlayerX, 150, 150)
	
		if PlayerMovementStop == true then
		end
		
		if not PlayerMovementStop == true then
		end

	end

end

return debug