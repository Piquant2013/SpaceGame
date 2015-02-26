-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Loads logo script
local logo = require 'logo'


function love.load()
	
	------ CURSOR ------
	-- Load cursors
	cursor = love.mouse.newCursor("images/cursor.png", 2, 2)
	crosshair = love.mouse.newCursor("images/crosshair.png", 14, 14)
	
	-- Set system cursor
	love.mouse.setCursor(cursor)
	------ CURSOR ------

	-- FPS & Mute states
	SetFPS = false
	SetMute = false

	-- Tells game to continue onto the logo script
	Gamestate.switch(logo)

	-- Sets FPS font and size
	FPSfont = love.graphics.newFont("fonts/xen3.ttf", 20)
end

function love.mousepressed(mx, my, button)
	
	-- Sets up each individual script to use its own love.update, love.load, etc
	Gamestate.mousepressed(mx, my, button)
end

function love.update(dt)
	






	-- Mute game audio if the options script tells mute to be true
	if SetMute == true then
		love.audio.setVolume(0.0)
	end




	if SetMute == false then
		love.audio.setVolume(1.0)
	end




	-- Sets up each individual script to use its own love.update, love.load, etc
	Gamestate.update(dt)
end

function love.keyreleased(key)
	
	-- Sets up each individual script to use its own love.update, love.load, etc
	Gamestate.keyreleased(key)
end

function love.keypressed(key)
	
	-- Sets up each individual script to use its own love.update, love.load, etc
	Gamestate.keypressed(key)
end

function love.draw()
	
	-- Sets up each individual script to use its own love.update, love.load, etc
	Gamestate.draw()

	-- Tells FPS to use FPSfont
	love.graphics.setFont( FPSfont )
	
	-- Displays FPS if the options script tells FPS to be true
	if SetFPS == true then
		love.graphics.print("FPS: " .. love.timer.getFPS(), 1200, 5)
	end
end