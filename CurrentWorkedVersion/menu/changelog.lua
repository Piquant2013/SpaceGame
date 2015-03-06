-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates changelog as a new gamestate
changelog = Gamestate.new()


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
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 320/2) + 320) then
		changelog.MouseBackArea = false
		changelog.MouseOnBtn = false
	end

	if love.mouse.getX() < (love.graphics.getWidth()/2 - 320/2) then
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
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 320/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 320/2) + 320) and love.mouse.getY() > 580 and love.mouse.getY() < 660 then
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
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2), changelog.ChgBackBtnY + 5, 29, 35 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2) + 291, changelog.ChgBackBtnY + 5, 29, 35 )
	------ SHAPES ------

	------ TEXT ------
	-- Changes
	-- First change log row
	love.graphics.setFont( changelog.ChgFont )
	love.graphics.print("Version: 0.3.1", (love.graphics.getWidth()/2 - changelog.ChgFont:getWidth( "Version: 0.3.1" )/2), 105)
	love.graphics.print("- ", (love.graphics.getWidth()/2 - changelog.ChgFont:getWidth( "- " )/2), 141)
	
	-- Back button
	love.graphics.setFont( changelog.BackFont )
	love.graphics.print('Back', (love.graphics.getWidth()/2 - changelog.BackFont:getWidth( "Back" )/2), changelog.ChgBackBtnY)

	-- Title
	love.graphics.setFont( changelog.TitleFont )
	love.graphics.print('Changelog', (love.graphics.getWidth()/2 - changelog.TitleFont:getWidth( "Changelog" )/2), 15)
	------ TEXT ------
end

return changelog