-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates credits as a new gamestate
credits = Gamestate.new()


function credits:init()
	
	------ VARIABLES ------
	-- Back Button Y & X
	self.CrdBackBtnY = 582	
	self.CrdBackBtnX = 584
	self.CrdArrowX = 480

	-- Mouse button areas
	self.MouseBackArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseOnBtn = false
	------ VARIABLES ------

	------ FONTS ------
	self.CrdFont = love.graphics.newFont("fonts/xen3.ttf", 20)
	self.BackFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.TitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
	------ FONTS ------

	------ AUDIO ------
	EnterCrd = love.audio.newSource("audio/enter.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	------ AUDIO ------

	------ IMAGES ------
	self.CrdBG = love.graphics.newImage("images/largespacebg.png")
	------ IMAGES ------
end

function credits:update(dt)
	
	-- MOUSE AUDIO ONCE 
	if credits.MouseOnBtn == false then
		credits.MouseDetect = 0
		love.audio.stop(credits.Select1M)
	end

	if credits.MouseDetect == 1 and SetMute == false then
		love.audio.play(credits.Select1M)
	end

	-- MOUSE OUT OF AREA
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 320/2) + 320) then
		credits.MouseBackArea = false
		credits.MouseOnBtn = false
	end

	if love.mouse.getX() < (love.graphics.getWidth()/2 - 320/2) then
		credits.MouseBackArea = false
		credits.MouseOnBtn = false
	end

	if love.mouse.getY() < 580 then
		credits.MouseBackArea = false
		credits.MouseOnBtn = false
	end

	if love.mouse.getY() > 660 then
		credits.MouseBackArea = false
		credits.MouseOnBtn = false
	end


	-- MOUSE BUTTON AREAS
	-- Mouse area of the back button
	-- This tells the menu if the mouse is over a certain button
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 320/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 320/2) + 320) and love.mouse.getY() > 580 and love.mouse.getY() < 660 then
		credits.MouseBackArea = true
		credits.MouseOnBtn = true
		credits.MouseDetect = credits.MouseDetect + 1
	end
end

function credits:mousepressed(mx, my, button)
	
	-- If the mouse is on back and return is true then return to the main menu
	if button == "l" and credits.MouseBackArea == true then
		Gamestate.pop()
		love.audio.play(EnterCrd)
		love.audio.stop(EnterOpt)
	end
end

function credits:keypressed(key)
	
	-- Takes you back to the main menu
	if key == "return" then
		
		-- Tells the game script to unload itslef and go back to previous gamestate in stack
		Gamestate.pop()

		-- Plays enter sound and stops previous enter sound
		love.audio.play(EnterCrd)
		love.audio.stop(EnterOpt)
	end
end

function credits:draw()
	
	------ FILTERS ------
	credits.CrdBG:setFilter( 'nearest', 'nearest' )
	credits.CrdFont:setFilter( 'nearest', 'nearest' )
	credits.BackFont:setFilter( 'nearest', 'nearest' )
	credits.TitleFont:setFilter( 'nearest', 'nearest' )
	FPSfont:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(credits.CrdBG, -2000, -2000, 0, 2.05)
	------ IMAGES ------
	
	------ SHAPES ------
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2), credits.CrdBackBtnY + 5, 29, 35 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2) + 291, credits.CrdBackBtnY + 5, 29, 35 )
	------ SHAPES ------

	------ TEXT ------
	love.graphics.setFont( credits.CrdFont )
	
	love.graphics.print("Bryce Dunn:", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Bryce Dunn:")/2), 150)
	love.graphics.print("Author, Coder", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Author, Coder")/2), 180)

	love.graphics.print("Tyronne Crisfield:", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Tyronne Crisfield:")/2), 240)
	love.graphics.print("Author, Coder", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Author, Coder")/2), 270)

	love.graphics.print("Toby Lowe:", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Toby Lowe:")/2), 330)
	love.graphics.print("Music & Sound, Author", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Music & Sound, Author")/2), 360)

	love.graphics.print("Thomas Wiltshire:", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Thomas Wiltshire:")/2), 420)
	love.graphics.print("Lead Coder,  Author,  Graphics", (love.graphics.getWidth( )/2-credits.CrdFont:getWidth("Lead Coder,  Author,  Graphics")/2), 450)

	-- Back button
	love.graphics.setFont( credits.BackFont )
	love.graphics.print('Back', (love.graphics.getWidth()/2 - credits.BackFont:getWidth( "Back" )/2), credits.CrdBackBtnY)
	
	-- Title
	love.graphics.setFont( credits.TitleFont )
	love.graphics.print('Credits', (love.graphics.getWidth()/2 - credits.TitleFont:getWidth( "Credits" )/2), 45)
	------ TEXT ------

	-- Draw credits.lua debug
	if SetDeb == true then
		debugmode:credits()
	end
end

return credits