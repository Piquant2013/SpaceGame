-- Function run for FPS limiter
function love.run() end

-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Loads logo script
logo = require 'logo'

-- Loads frame limiter script
frame_limiter = require 'vendors/fpslimter'


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
	
	-- Set the frame rate limit to 60
	frame_limiter.set(60)

	-- Set game audio to 0 if the options script tells mute to be true
	if SetMute == true then
		love.audio.setVolume(0.0)
	end

	-- Set game audio back to default if the options script tells mute to be false
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
	if SetFPS == true and QuitActive == false then
		love.graphics.print("FPS: " .. love.timer.getFPS(), (love.graphics.getWidth( ) - FPSfont:getWidth( "FPS: " .. love.timer.getFPS()) - 5), 5)
	end

	-- Displays "Mute: ON" if the options script tells mute to be true 
	if SetMute == true and QuitActive == false then
		love.graphics.print("Mute: On", (love.graphics.getWidth( ) - FPSfont:getWidth( "Mute: On" ) - 90), 5)
	end
end

-- Run frame limter
frame_limiter.run()