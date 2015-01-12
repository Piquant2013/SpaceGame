-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates credits as a new gamestate
local credits = Gamestate.new()


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
	if love.mouse.getX() < (credits.CrdArrowX + 771) then
		credits.MouseBackArea = false
		credits.MouseOnBtn = false
	end

	if love.mouse.getX() < credits.CrdArrowX then
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
	if love.mouse.getX() > credits.CrdArrowX and love.mouse.getX() < (credits.CrdArrowX + 291) and love.mouse.getY() > 580 and love.mouse.getY() < 660 then
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
		-- JUST PAUSES FOR NOW
		Gamestate.pop()

		-- Plays enter sound and stops previous enter sound
		love.audio.play(EnterCrd)
		love.audio.stop(EnterOpt)
	end
end

function credits:draw()
	
	------ FILTERS ------
	credits.CrdBG:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(credits.CrdBG, -2000, -2000)
	------ IMAGES ------
	
	------ SHAPES ------
	love.graphics.rectangle("fill", credits.CrdArrowX, credits.CrdBackBtnY + 5, 29, 35 )
	love.graphics.rectangle("fill", credits.CrdArrowX + 291, credits.CrdBackBtnY + 5, 29, 35 )
	------ SHAPES ------

	------ TEXT ------
	love.graphics.setFont( credits.CrdFont )
	love.graphics.print('Aaron Rogers:', 520, 150)
	love.graphics.print('Writer, Graphics', 520, 180)
	love.graphics.print('Bryce Dunn:', 520, 240)
	love.graphics.print('Coder,  Writer,  Graphics', 520, 270)
	love.graphics.print('Tyronne Chrisfield:', 520, 320)
	love.graphics.print('Coder,  Writer', 520, 350)
	love.graphics.print('Toby Lowe:', 520, 400)
	love.graphics.print('Music & Sound,  Writer', 520, 430)
	love.graphics.print('Thomas Wiltshire:', 520, 480)
	love.graphics.print('Coder,  Writer,  Graphics', 520, 510)

	-- Back button
	love.graphics.setFont( credits.BackFont )
	love.graphics.print('Back', credits.CrdBackBtnX, credits.CrdBackBtnY)
	
	-- Title
	love.graphics.setFont( credits.TitleFont )
	love.graphics.print('Credits', 475, 45)
	------ TEXT ------
end

return credits