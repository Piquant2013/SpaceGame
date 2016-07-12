-- USING --
local Gamestate = require 'libs/hump/gamestate'
start = require 'menu/start'

-- This gamestate
logo = Gamestate.new()


function logo:init()
	
	-- Set mouse visibility
	love.mouse.setVisible(false)
	
	------ VARIABLES ------
	self.timer = 0
	self.alpha = 0
	self.fadein  = 3
	self.display = 3
	self.fadeout = 5
	self.skip = false
	------ VARIABLES ------
	
	------ IMAGES ------
	self.image = love.graphics.newImage("images/teamlogo.png")
	self.bg = love.graphics.newImage("images/bg-logo.png")
	------ IMAGES ------

	------ FILTERS ------
	self.image:setFilter( 'nearest', 'nearest' )
	self.bg:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ AUDIO ------
	self.chime = love.audio.newSource("audio/teamchime.ogg")
	love.audio.play(self.chime)
	------ AUDIO ------
end

function logo:update(dt)
	
	-- Set audio volume
	love.audio.setVolume(0.5)

	-- Start logo timer
	self.timer = self.timer + dt

	-- Fades the logo in
	if self.timer < self.fadein then 
		self.alpha = self.timer / self.fadein
	elseif self.timer < self.display then 
		self.alpha = 1
	else 
		self.alpha = 1
	end

	-- Move to start screen
	if  self.timer >= 8 then
		Gamestate.switch(start)
		love.audio.setVolume(1.0)
	end

	-- Skip
	if self.skip == true then
		Gamestate.switch(start)
		love.graphics.setColor(255, 255, 255)
		love.audio.stop(self.chime)
		love.audio.setVolume(1.0)
	end
end

function logo:keypressed(key)
	
	-- Skip if key press
	if key == "return" or "escape" or "space" then
		self.skip = true
	end 
end

function logo:mousepressed(mx, my, button)
	
	-- Skip if click
	if button == 1 or 2 then
		self.skip = true
	end
end

function logo:draw()
	
	-- Draw logo and background
	love.graphics.setColor(255, 255, 255, self.alpha * 255)
	love.graphics.draw(self.bg, 0, 0, 0, 1.1)
	love.graphics.draw(self.image, (love.graphics.getWidth()/2 - self.image:getWidth()/2), (love.graphics.getHeight()/2 - self.image:getHeight()/2))
end

return logo