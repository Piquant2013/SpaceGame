-- Function run for FPS limiter
function love.run() end

-- USING --
Gamestate = require 'libs/hump/gamestate'
logo = require 'logo'
frame_limiter = require 'libs/fpslimter'

function love.load()

	------ FONTS ------
	fpsfont = love.graphics.newFont("fonts/xen3.ttf", 15)
	fpsfont1 = love.graphics.newFont("fonts/xen3.ttf", 20)
	------ FONTS ------

	------ FILTERS ------
	fpsfont:setFilter( 'nearest', 'nearest' )
	fpsfont1:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ CURSOR ------
hascursor = love.mouse.hasCursor( false )
	crosshair = love.mouse.newCursor("images/crosshair.png", 14, 14)
	cursor = love.mouse.newCursor("images/cursor.png", 2, 2)
	------ CURSOR ------

	------ GOLBAL VARIABLES ------
	setfps = false
	setmute = false
	setmouselock = true
	setfull = false
	paused = false
	resume = false
	gamereset = true
	mastervolume = 1
	musicvolume = 1
	sfxvolume = 1
	musicvolumelower = 0
	resselections = 1
	fullscreenon = false
	gameover = false
	welcomescreen = true
	------ GOLBAL VARIABLES ------

	-- Set master volume
	love.audio.setVolume(mastervolume)

	-- Set system cursor
	love.mouse.setCursor(cursor)
	
	-- Tells game to start with the logo script
	Gamestate.switch(logo)
end

-- Mousepressd
function love.mousepressed(mx, my, button)
	Gamestate.mousepressed(mx, my, button)
end

function love.update(dt)
	
	-- Set the frame rate limit to 60
	frame_limiter.set(60)

	-- Mute
	if setmute == true then
		love.audio.setVolume(0.0)
	else
		love.audio.setVolume(mastervolume)
	end

	-- Mouselock
	if setmouselock == true then
		love.mouse.setGrabbed( true )
	else
		love.mouse.setGrabbed( false )
	end

	-- Update for game
	Gamestate.update(dt)
end

-- Keyreleased
function love.keyreleased(key)
	Gamestate.keyreleased(key)
end

-- Keypressed
function love.keypressed(key)
	Gamestate.keypressed(key)
end

function love.draw()

	-- Draw for game
	Gamestate.draw()
	
	-- Display FPS
	if setfps == true then
		love.graphics.setFont( fpsfont1 )
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("FPS: " .. love.timer.getFPS(), (love.graphics.getWidth( ) - fpsfont1:getWidth( "FPS: " .. love.timer.getFPS()) - 20), 5)
		love.graphics.setColor(255, 255, 255)
	end
end

-- Run frame limter
frame_limiter.run()