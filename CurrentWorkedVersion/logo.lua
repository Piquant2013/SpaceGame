-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates logo as a new gamestate
local logo = Gamestate.new()

-- Loads menu script
local menu = require 'menu/menu'


function logo:init()
	-- Set mouse visibility to false
	love.mouse.setVisible(false)
	
	------ VARIABLES ------
	self.Timer = 0
	self.Alpha = 0
	self.Fadein  = 3
	self.Display = 3
	self.Fadeout = 5
	------ VARIABLES ------
	
	------ IMAGES ------
	self.PiquantLogo = love.graphics.newImage("images/hdlogo.png")
	------ IMAGES ------

	------ AUDIO ------
	self.LogoChime = love.audio.newSource("audio/logochime.ogg")
	love.audio.play(logo.LogoChime)
	------ AUDIO ------
end

function logo:update(dt)
	
	-- Fades the logo in
	logo.Timer = logo.Timer + dt

	if logo.Timer < logo.Fadein then logo.Alpha = logo.Timer / logo.Fadein
		elseif logo.Timer < logo.Display then logo.Alpha = 1
		else logo.Alpha = 1
	end

	-- unloads logo script and moves to the menu script
	if  logo.Timer >= 8 then
		Gamestate.switch(menu)
		
	end	
end

function logo:draw()
	
	------ FILTERS ------
	logo.PiquantLogo:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	love.graphics.setColor(255, 255, 255, logo.Alpha * 255)
	love.graphics.draw(logo.PiquantLogo, 150, 200, 0, .75)
end

return logo