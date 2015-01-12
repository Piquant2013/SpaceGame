-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates changelog as a new gamestate
local changelog = Gamestate.new()


function changelog:init()
	
	------ VARIABLES ------
	-- Back Button Y & X
	self.ChgBackBtnY = 592
	self.ChgBackBtnX = 584
	self.ChgArrowX = 480

	-- Mouse button areas
	self.MouseBackArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseOnBtn = false
	------ VARIABLES ------
	
	------ IMAGES ------
	self.ChgBG = love.graphics.newImage("images/largespacebg.png")
	------ IMAGES ------

	------ FONTS ------
	self.ChgFont = love.graphics.newFont("fonts/xen3.ttf", 20)
	self.BackFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.TitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
	------ FONTS ------
	
	------ AUDIO ------
	EnterChg = love.audio.newSource("audio/enter.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	------ AUDIO ------
end

function changelog:update(dt)

	-- MOUSE AUDIO ONCE 
	if changelog.MouseOnBtn == false then
		changelog.MouseDetect = 0
		love.audio.stop(changelog.Select1M)
	end

	if changelog.MouseDetect == 1 and SetMute == false then
		love.audio.play(changelog.Select1M)
	end

	-- MOUSE OUT OF AREA
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false
	if love.mouse.getX() < (changelog.ChgArrowX + 771) then
		changelog.MouseBackArea = false
		changelog.MouseOnBtn = false
	end

	if love.mouse.getX() < changelog.ChgArrowX then
		changelog.MouseBackArea = false
		changelog.MouseOnBtn = false
	end

	if love.mouse.getY() < 580 then
		changelog.MouseBackArea = false
		changelog.MouseOnBtn = false
	end

	if love.mouse.getY() > 660 then
		changelog.MouseBackArea = false
		changelog.MouseOnBtn = false
	end


	-- MOUSE BUTTON AREAS
	-- Mouse area of the back button
	-- This tells the menu if the mouse is over a certain button
	if love.mouse.getX() > changelog.ChgArrowX and love.mouse.getX() < (changelog.ChgArrowX + 291) and love.mouse.getY() > 580 and love.mouse.getY() < 660 then
		changelog.MouseBackArea = true
		changelog.MouseOnBtn = true
		changelog.MouseDetect = changelog.MouseDetect + 1
	end
end

function changelog:mousepressed(mx, my, button)
	
	-- If the mouse is on back and return is true then return to the main menu
	if button == "l" and changelog.MouseBackArea == true then
		Gamestate.pop()
		love.audio.play(EnterChg)
		love.audio.stop(EnterOpt)
	end
end

function changelog:keypressed(key)
	
	-- Takes you back to the main menu
	if key == "return" then
		
		-- Tells the game script to unload itslef and go back to previous gamestate in stack
		-- JUST PAUSES FOR NOW
		Gamestate.pop()
		
		-- Plays enter sound and stops previous enter sound
		love.audio.play(EnterChg)
		love.audio.stop(EnterOpt)
	end
end

function changelog:draw()
	
	------ FILTERS ------
	changelog.ChgBG:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(changelog.ChgBG, -2000, -2000)
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.rectangle("fill", changelog.ChgArrowX, changelog.ChgBackBtnY + 5, 29, 35 )
	love.graphics.rectangle("fill", changelog.ChgArrowX + 291, changelog.ChgBackBtnY + 5, 29, 35 )
	------ SHAPES ------

	------ TEXT ------
	-- Changes
	love.graphics.setFont( changelog.ChgFont )
	love.graphics.print('Version: 0.2.1', 578, 105)
	love.graphics.print('Menu:', 325, 123)
	love.graphics.print('- ', 325, 141)
	love.graphics.print('- ', 325, 159)
	love.graphics.print('- ', 325, 177)
	love.graphics.print('', 325, 195)
	love.graphics.print('Aesthetics and Sound:', 325, 213)
	love.graphics.print('- ', 325, 231)
	love.graphics.print('- ', 325, 249)
	love.graphics.print('- ', 325, 267)
	love.graphics.print('- ', 325, 285)
	love.graphics.print('- ', 325, 303)
	love.graphics.print('- ', 325, 321)
	love.graphics.print('- ', 325, 339)
	love.graphics.print('- ', 325, 357)
	love.graphics.print('', 325, 375)
	love.graphics.print('Gameplay:', 325, 393)
	love.graphics.print('- ', 325, 411)
	love.graphics.print('- ', 325, 429)
	love.graphics.print('- ', 325, 447)
	love.graphics.print('- ', 325, 465)
	love.graphics.print('', 325, 483)
	love.graphics.print('Code and Misc:', 325, 501)
	love.graphics.print('- ', 325, 519)
	love.graphics.print('- ', 325, 537)
	love.graphics.print('- ', 325, 555)

	-- Back button
	love.graphics.setFont( changelog.BackFont )
	love.graphics.print('Back', changelog.ChgBackBtnX, changelog.ChgBackBtnY)

	-- Title
	love.graphics.setFont( changelog.TitleFont )
	love.graphics.print('Changelog', 403, 15)
	------ TEXT ------
end

return changelog