-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates pause as a new gamestate
pause = Gamestate.new()


function pause:init()
  
  	------ VARIABLES ------
	-- Resume Button Y & X 
	self.resumebtny = -60
	self.resumebtnx = 548

	-- Main menu Button Y & X  
	self.optionsbtny = 0
	self.optionsbtnx = 512

	-- Main menu Button Y & X  
	self.mainmenubtny = 60
	self.mainmenubtnx = 476
 
	-- Button Selecter Y & X 
	self.arrowy = (self.resumebtny)
	self.arrowx = 0

	-- Pause menu state  
	self.resumestate = false
	self.optionsstate = false
	self.mainmenustate = false

	-- mouse button state
	self.resumestatemouse = false
	self.optionsstatemouse = false
	self.mainmenustatemouse = false

	-- Mouse Dectect vars for sound
	self.mouseover = false
	self.mousedetect1 = 0
	self.mousedetect2 = 0
	self.mousedetect3 = 0

	-- white flash
	self.fade = 100
	------ VARIABLES ------

	------ AUDIO ------
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.select1 = love.audio.newSource("audio/buttons/select.ogg")
	self.select2 = love.audio.newSource("audio/buttons/select.ogg")
	self.select3 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover1 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover2 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover3 = love.audio.newSource("audio/buttons/select.ogg")
	------ AUDIO ------
end

function pause:update(dt)

	-- Pause game music and set cursor
	if resume == false then
		game.music1:setVolume(0.2)
		love.mouse.setCursor(cursor)
	end

	-- Switch back to the game script
	if resume == true then
		Gamestate.pop()
		paused = false
		love.mouse.setCursor(crosshair)
		game.music1:setVolume(1.0)
		self.fade = 100
	end 

	-- FLASH WHITE --
	self.fade = self.fade + dt - 2

	if self.fade < 0 then
		self.fade = 0
	end
	-- FLASH WHITE --

	-- PAUSE MENU STATES -- 
	-- Resume pause menu state
	if self.arrowy == self.resumebtny then
		self.arrowx = 110
		self.resumestate = true
		self.mainmenustate = false
		self.optionsstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
	end

	-- Options pause menu state
	if self.arrowy < self.mainmenubtny and self.arrowy > self.resumebtny then
		self.arrowx = 125
		self.arrowy = self.optionsbtny
		self.resumestate = false
		self.mainmenustate = false
		self.optionsstate = true
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
	end

	-- Main menu pause menu state
	if self.arrowy == self.mainmenubtny then
		self.arrowx = 90
		self.resumestate = false
		self.mainmenustate = true
		self.optionsstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select3)
	end
	-- PAUSE MENU STATES -- 

  	-- Make sure the arrow doesnt go past resume or main menu
	if self.arrowy > self.mainmenubtny then
		self.arrowy = self.mainmenubtny
	elseif self.arrowy < self.resumebtny then
		self.arrowy = self.resumebtny
	end

	-- MOUSE AREAS --
	-- Mouse area of resume button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2) + start.font3:getWidth( "SETTINGS" )
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - 30/2 - 60)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - 30/2 - 60) + start.font3:getHeight( "RESUME" ) then
		self.resumestatemouse = true
		self.optionsstatemouse = false
		self.mainmenustatemouse = false
		self.arrowy = self.resumebtny
		self.arrowx = 110
		self.mouseover = true
		self.mousedetect1 = self.mousedetect1 + 1
		self.mousedetect2 = 0
		self.mousedetect3 = 0
	end

	-- Mouse area of options button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2) + start.font3:getWidth( "SETTINGS" )
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - 30/2)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - 30/2) + start.font3:getHeight( "SETTINGS" ) then
		self.resumestatemouse = false
		self.optionsstatemouse = true
		self.mainmenustatemouse = false
		self.arrowx = 125
		self.arrowy = self.optionsbtny
		self.mouseover = true
		self.mousedetect1 = 0
		self.mousedetect2 = self.mousedetect2 + 1
		self.mousedetect3 = 0
	end

	-- Mouse area of menu button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2) + start.font3:getWidth( "SETTINGS" )
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - 30/2 + 60)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - 30/2 + 60) + start.font3:getHeight( "MENU" ) then
		self.resumestatemouse = false
		self.optionsstatemouse = false
		self.mainmenustatemouse = true
		self.arrowy = self.mainmenubtny
		self.arrowx = 90
		self.mouseover = true
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = self.mousedetect3 + 1
	end
	-- MOUSE AREAS --

	-- MOUSE OUT OF AREA --
	if love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2) + start.font3:getWidth( "SETTINGS" ) then
		self.resumestatemouse = false
		self.optionsstatemouse = false
		self.mainmenustatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2) then
		self.resumestatemouse = false
		self.optionsstatemouse = false
		self.mainmenustatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getY() < (love.graphics.getHeight()/2 - 30/2 - 60) then
		self.resumestatemouse = false
		self.optionsstatemouse = false
		self.mainmenustatemouse = false
		self.mouseover = false
	end

	if love.mouse.getY() > (love.graphics.getHeight()/2 - 30/2 + 60) + start.font3:getHeight( "MENU" ) then
		self.resumestatemouse = false
		self.optionsstatemouse = false
		self.mainmenustatemouse = false
		self.mouseover = false
	end
	-- MOUSE OUT OF AREA --

	-- MOUSE DECTECTS --
	if self.mouseover == false then
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
	end

	if self.mousedetect1 == 1 then
		love.audio.play(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
	end

	if self.mousedetect2 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.play(self.mouseover2)
		love.audio.stop(self.mouseover3)
	end

	if self.mousedetect3 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.play(self.mouseover3)
	end
	-- MOUSE DECTECTS --
end

function pause:keypressed(key)

	-- SELECT BUTTONS --
	-- Move arrow up through pause menu states
	if key == "up" or key == "w" then
		love.audio.play(self.select1)
		love.audio.play(self.select2)
		love.audio.play(self.select3)
		self.arrowy = self.arrowy - 60

		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 500)
		end
	end

	-- Move arrow up through pause menu states
	if key == "down" or key == "s" then
		love.audio.play(self.select1)
		love.audio.play(self.select2)
		love.audio.play(self.select3)
		self.arrowy = self.arrowy + 60

		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 500)
		end
	end
	-- SELECT BUTTONS --
 
 	-- ACTIVATE BUTTONS --
	-- Resume the game
	if key == "return" and self.resumestate == true or key == " " and self.resumestate == true then
		love.audio.play(self.entersound)
		resume = true
	end

	-- Go to options menu
	if key == "return" and self.optionsstate == true or key == " " and self.optionsstate == true then
		love.audio.play(self.entersound)
		Gamestate.push(options)
		self.fade = 100
	end
  
  	-- Go to the main menu
	if key == "return" and self.mainmenustate == true or key == " " and self.mainmenustate == true then
		love.audio.play(self.entersound)
		setendless = true
		gamereset = true
		game.endless = false
		game.stuck = false
		paused = false
		welcomescreen = true
		Gamestate.switch(menu)
		love.audio.play(start.music)
		start.music:setLooping(true)
		love.audio.stop(game.music1)
		love.audio.stop(game.music2)
	end
	-- ACTIVATE BUTTONS --

	-- Resume game
	if key == 'escape' then
		resume = true
	end
end

function pause:mousepressed(mx, my, button)
 
	-- Resume the game
	if button == "l" and self.resumestatemouse == true then
		love.audio.play(self.entersound)
		resume = true
	end

	-- Go to options menu
	if button == "l" and self.optionsstatemouse == true then
		love.audio.play(self.entersound)
		Gamestate.push(options)
		self.fade = 100
	end
  
  	-- Go to the main menu
	if button == "l" and self.mainmenustatemouse == true then
		love.audio.play(self.entersound)
		setendless = true
		gamereset = true
		game.endless = false
		game.stuck = false
		paused = false
		welcomescreen = true
		Gamestate.switch(menu)
		love.audio.play(start.music)
		start.music:setLooping(true)
		love.audio.stop(game.music1)
		love.audio.stop(game.music2)
	end

	-- Resume game
	if button == 'r' then
		resume = true
	end
end

function pause:draw()
	
	------ FILTERS ------
	start.bg:setFilter( 'nearest', 'nearest' )
	start.font2:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(start.bg, 0, -1000, 0, 3)
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 28/2) - self.arrowx, (love.graphics.getHeight()/2 - 28/2) + self.arrowy + 12, 28, 10 )
	------ SHAPES ------

	------ TEXT ------
	love.graphics.setFont( start.font3 )
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('RESUME', (love.graphics.getWidth()/2 - start.font3:getWidth( "RESUME" )/2), (love.graphics.getHeight()/2 - 30/2 - 60))
	love.graphics.print('SETTINGS', (love.graphics.getWidth()/2 - start.font3:getWidth( "SETTINGS" )/2), (love.graphics.getHeight()/2 - 30/2))
	love.graphics.print('MENU', (love.graphics.getWidth()/2 - start.font3:getWidth( "MENU" )/2), (love.graphics.getHeight()/2 - 30/2 + 60))
	love.graphics.setColor(255, 255, 255, 255)
	------ TEXT ------

	------ SHAPES ------
	-- White Flash
	love.graphics.setColor(255, 255, 255, self.fade)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------
end

return pause