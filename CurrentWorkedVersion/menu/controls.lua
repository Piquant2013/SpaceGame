-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates controls as a new gamestate
controls = Gamestate.new()


function controls:init()
	
	------ VARIABLES ------
	-- Back Button Y & X
	self.ConBackBtnY = 582	
	self.ConBackBtnX = 584
	self.ConArrowX = 480

	-- Mouse button areas
	self.MouseBackArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseOnBtn = false
	------ VARIABLES ------

	------ FONTS ------
	self.ConFont = love.graphics.newFont("fonts/xen3.ttf", 20)
	self.BackFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.TitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
	------ FONTS ------

	------ AUDIO ------
	EnterCon = love.audio.newSource("audio/enter.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	------ AUDIO ------

	------ IMAGES ------
	self.ConBG = love.graphics.newImage("images/largespacebg.png")
	------ IMAGES ------
end

function controls:update(dt)
	
	-- MOUSE AUDIO ONCE 
	if controls.MouseOnBtn == false then
		controls.MouseDetect = 0
		love.audio.stop(controls.Select1M)
	end

	if controls.MouseDetect == 1 and SetMute == false then
		love.audio.play(controls.Select1M)
	end

	-- MOUSE OUT OF AREA
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 320/2) + 320) then
		controls.MouseBackArea = false
		controls.MouseOnBtn = false
	end

	if love.mouse.getX() < (love.graphics.getWidth()/2 - 320/2) then
		controls.MouseBackArea = false
		controls.MouseOnBtn = false
	end

	if love.mouse.getY() < 580 then
		controls.MouseBackArea = false
		controls.MouseOnBtn = false
	end

	if love.mouse.getY() > 660 then
		controls.MouseBackArea = false
		controls.MouseOnBtn = false
	end


	-- MOUSE BUTTON AREAS
	-- Mouse area of the back button
	-- This tells the menu if the mouse is over a certain button
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 320/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 320/2) + 320) and love.mouse.getY() > 580 and love.mouse.getY() < 660 then
		controls.MouseBackArea = true
		controls.MouseOnBtn = true
		controls.MouseDetect = controls.MouseDetect + 1
	end
end

function controls:mousepressed(mx, my, button)
	
	-- If the mouse is on back and return is true then return to the main menu
	if button == "l" and controls.MouseBackArea == true then
		Gamestate.pop()
		love.audio.play(EnterCon)
		love.audio.stop(EnterOpt)
	end
end

function controls:keypressed(key)
	
	-- Takes you back to the main menu
	if key == "return" then
		
		-- Tells the game script to unload itslef and go back to previous gamestate in stack
		Gamestate.pop()

		-- Plays enter sound and stops previous enter sound
		love.audio.play(EnterCon)
		love.audio.stop(EnterOpt)
	end
end

function controls:draw()
	
	------ FILTERS ------
	controls.ConBG:setFilter( 'nearest', 'nearest' )
	controls.ConFont:setFilter( 'nearest', 'nearest' )
	controls.BackFont:setFilter( 'nearest', 'nearest' )
	controls.TitleFont:setFilter( 'nearest', 'nearest' )
	FPSfont:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(controls.ConBG, -2000, -2000, 0, 2.05)
	------ IMAGES ------
	
	------ SHAPES ------
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2), controls.ConBackBtnY + 5, 29, 35 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2) + 291, controls.ConBackBtnY + 5, 29, 35 )
	------ SHAPES ------

	------ TEXT ------
	love.graphics.setFont( controls.ConFont )
	
	-- Text for the list of the contorls
	love.graphics.print("(customizable controls coming soon. So here is contorls and their functions)", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("(customizable controls coming soon. So here is contorls and their functions)")/2), 150)
	love.graphics.print("W = Up", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("W = Up")/2), 200)
	love.graphics.print("S = Down", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("S = Down")/2), 230)
	love.graphics.print("A = Left", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("A = Left")/2), 260)
	love.graphics.print("D = Right", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("D = Right")/2), 290)
	love.graphics.print("Mouse = Aim/ShipMovement", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("Mouse = Aim/ShipMovement")/2), 320)
	love.graphics.print("LeftClick = Shoot", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("LeftClick = Shoot")/2), 350)
	love.graphics.print("X = Zoom Camera In", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("X = Zoom Camera In")/2), 380)
	love.graphics.print("Z = Zoom Camera Out", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("Z = Zoom Camera Out")/2), 410)
	love.graphics.print("E = Activate/Interact", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("E = Activate/Interact")/2), 440)
	love.graphics.print("Q = Drop", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("Q = Drop")/2), 470)
	love.graphics.print("Esc = Pause", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("Esc = Pause")/2), 500)
	love.graphics.print("LeftShift = Sprint/Boost", (love.graphics.getWidth( )/2-controls.ConFont:getWidth("LeftShift = Sprint/Boost")/2), 530)

	-- Back button
	love.graphics.setFont( controls.BackFont )
	love.graphics.print('Back', (love.graphics.getWidth()/2 - controls.BackFont:getWidth( "Back" )/2), controls.ConBackBtnY)
	
	-- Title
	love.graphics.setFont( controls.TitleFont )
	love.graphics.print('controls', (love.graphics.getWidth()/2 - controls.TitleFont:getWidth( "controls" )/2), 45)
	------ TEXT ------

	if SetDeb == true then
		debugmode:drawcontorls()
	end
end

return controls