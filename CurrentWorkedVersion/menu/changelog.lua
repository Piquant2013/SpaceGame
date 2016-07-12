-- USING --
local Gamestate = require 'libs/hump/gamestate'

-- This gamestate
changelog = Gamestate.new()

function changelog:init()

	------ VARIABLES ------
	-- white flash
	self.fade = 100
	self.backpressed = false
	------ VARIABLES ------

	------ AUDIO ------
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.backsound = love.audio.newSource("audio/buttons/enter.ogg")
	------ AUDIO ------
end

function changelog:update(dt)

	-- Set volume for audio
	self.entersound:setVolume(sfxvolume)
	self.backsound:setVolume(sfxvolume)

	-- Takes you back to the main menu
	if self.backpressed == true then
		Gamestate.pop()
		love.audio.play(self.backsound)
		love.audio.stop(options.entersound1)
		self.fade = 100
		self.backpressed = false
	end

		-- FLASH WHITE --
	self.fade = self.fade + dt - 2

	if self.fade < 0 then
		self.fade = 0
	end
	-- FLASH WHITE --

	-- BACKGROUND SCROLL --
	start.bgx = start.bgx - start.bgscroll * dt

	if start.bgx <= -5200 then
		start.bgscroll = -65
	end

	if start.bgx >= 1 then
		start.bgscroll = 65
	end
	-- BACKGROUND SCROLL --
end

function changelog:keypressed(key)
	
	-- Takes you back to the main menu
	if key == "escape" or key == "return" or key == "space" then
		self.backpressed = true
	end
end

function changelog:mousepressed(mx, my, button)

	-- Go back to the start screen
	if button == 1 or button == 2 then
		self.backpressed = true
	end
end

function changelog:draw()

	------ IMAGE ------
	if paused == false then
		love.graphics.draw(start.bg, start.bgx, 0, 0, 2.05)
	elseif paused == true then
		love.graphics.draw(start.bg, 0, -1000, 0, 3)
	end
	------ IMAGE ------

	------ SHAPES ------
	-- Box
	love.graphics.rectangle("line", (love.graphics.getWidth()/2 - 1204/2), (love.graphics.getHeight()/2 - 664/2), 1204, 664 )
	love.graphics.setColor(0, 0, 0, 100)
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 1200/2), (love.graphics.getHeight()/2 - 660/2), 1200, 660 )
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------

	------ TEXT ------
	love.graphics.setColor(255, 255, 255)
	love.graphics.setFont( start.font9 )
	love.graphics.print('CHANGELOG', (love.graphics.getWidth()/2 - start.font9:getWidth( "CHANGELOG" )/2), (love.graphics.getHeight()/2 - 310))
	love.graphics.setFont( start.font0 )
	love.graphics.print('', (love.graphics.getWidth()/2 - 580), 115-25)
	love.graphics.setColor(255, 255, 255)
	------ TEXT ------

	------ SHAPES ------
	-- Flash white
	love.graphics.setColor(255, 255, 255, self.fade)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------
end

return changelog