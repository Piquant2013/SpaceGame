-- USING --
local Gamestate = require 'libs/hump/gamestate'
spacestation = require 'game/maps/spacestation'
options = require 'menu/options'

-- This gamestate
menu = Gamestate.new()


function menu:init()

	------ VARIABLES ------
	-- Play Button Y & X
	self.playbtny = 100
	self.playbtnx = -280
	
	-- Option Button Y & X
	self.optbtny = 150
	self.optbtnx = 0

	-- Quit Button Y & X
	self.quitbtny = 200
	self.quitbtnx = 280
	
	-- Button Selecter Y & X
	self.arrowy = (self.playbtny)
	self.arrowx = (self.playbtnx)

	-- Menus state
	self.playstate = false
	self.optstate = false
	self.exitstate = false

	-- mouse button state
	self.playstatemouse = false
	self.optstatemouse = false
	self.exitstatemouse = false

	-- button pressed vars
	self.playpressed = false
	self.optpressed = false
	self.exitpressed = false

	-- Mouse Dectect vars for sound
	self.mouseover = false
	self.mousedetect1 = 0
	self.mousedetect2 = 0
	self.mousedetect3 = 0

	-- quit vars
	self.quittimer = 0

	-- White flash vars
	self.fade = 255
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

function menu:update(dt)
	
	-- Set volume for audio
	self.entersound:setVolume(sfxvolume)
	self.select1:setVolume(sfxvolume)
	self.select2:setVolume(sfxvolume)
	self.select3:setVolume(sfxvolume)
	self.mouseover1:setVolume(sfxvolume)
	self.mouseover2:setVolume(sfxvolume)
	self.mouseover3:setVolume(sfxvolume)

	-- FLASH WHITE --
	self.fade = self.fade + dt - 2

	if self.fade < 0 then
		self.fade = 0
	end
	-- FLASH WHITE --

	-- BACKGROUND SCROLL --
	start.bgx = start.bgx - start.bgscroll * dt

	if start.bgx <= -5200 then
		start.bgscroll = -65
	end

	if start.bgx >= 1 then
		start.bgscroll = 65
	end
	-- BACKGROUND SCROLL --

	-- MENU STATES --
	-- plays menu state
	if self.arrowx == self.playbtnx then
		self.arrowy = self.optbtny + 50
		self.playstate = true
		self.optstate = false
		self.exitstate = false
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
	end

	-- Options menu state
	if self.arrowx < self.quitbtnx and self.arrowx > self.playbtnx then
		self.arrowy = self.optbtny + 50
		self.exitstate = false
		self.playstate = false
		self.optstate = true
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
	end

	-- Quits menu state
	if self.arrowx == self.quitbtnx then
		self.arrowy = self.optbtny + 50
		self.optstate = false
		self.playstate = false
		self.exitstate = true
		love.audio.stop(self.select1)
		love.audio.stop(self.select3)
	end
	-- MENU STATES --

	-- Make sure the arrow doesnt go past play or quit
	if self.arrowx > self.quitbtnx then
		self.arrowx = self.quitbtnx
	elseif self.arrowx < self.playbtnx then
		self.arrowx = self.playbtnx
	end

	-- MOUSE AREAS --
	-- Mouse area of play button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font8:getWidth( "PLAY" )/2 - 280 + start.font8:getWidth( "PLAY" )) + 40
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font8:getWidth( "PLAY" )/2 - 280) - 40
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny) - 30
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny + start.font8:getHeight( "SETTINGS" ) + 30) then
		self.playstatemouse = true
		self.optstatemouse = false
		self.exitstatemouse = false
		self.arrowx = self.playbtnx
		self.mouseover = true
		self.mousedetect1 = self.mousedetect1 + 1
		self.mousedetect2 = 0
		self.mousedetect3 = 0
	end

	-- Mouse area of options button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font8:getWidth( "SETTINGS" )/2 + start.font8:getWidth( "SETTINGS" )) + 40
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font8:getWidth( "SETTINGS" )/2) - 40
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny) - 30
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny + start.font8:getHeight( "SETTINGS" ) + 30) then
		self.playstatemouse = false
		self.optstatemouse = true
		self.exitstatemouse = false
		self.arrowx = self.optbtnx
		self.mouseover = true
		self.mousedetect1 = 0
		self.mousedetect2 = self.mousedetect2 + 1
		self.mousedetect3 = 0
	end

	-- Mouse area of exit button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font8:getWidth( "QUIT" )/2 + 280 + start.font8:getWidth( "QUIT" )) + 40
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font8:getWidth( "QUIT" )/2 + 280) - 40
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny) - 30
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny + start.font8:getHeight( "SETTINGS" ) + 30) then
		self.playstatemouse = false
		self.optstatemouse = false
		self.exitstatemouse = true
		self.arrowx = self.quitbtnx
		self.mouseover = true
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = self.mousedetect3 + 1
	end
	-- MOUSE AREAS --

	-- MOUSE OUT OF AREA --
	if love.mouse.getX() > (love.graphics.getWidth()/2 - start.font8:getWidth( "QUIT" )/2 + 280 + start.font8:getWidth( "QUIT" )) + 40 then
		self.playstatemouse = false
		self.optstatemouse = false
		self.exitstatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font8:getWidth( "PLAY" )/2 - 280) - 40 then
		self.playstatemouse = false
		self.optstatemouse = false
		self.exitstatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getY() < (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny) - 30 then
		self.playstatemouse = false
		self.optstatemouse = false
		self.exitstatemouse = false
		self.mouseover = false
	end

	if love.mouse.getY() > (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2 + self.optbtny + start.font8:getHeight( "SETTINGS" ) + 30) then
		self.playstatemouse = false
		self.optstatemouse = false
		self.exitstatemouse = false
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

	-- ACTIVATE BUTTONS --
	if self.playpressed == true then
		love.audio.play(self.entersound)
		Gamestate.push(spacestation)
		game.endless = true
		love.audio.stop(start.music)
		start.easteregg = false
		love.audio.stop(start.colorgoeshere)
		setfull = false
		self.fade = 100
		self.playpressed = false
	end

	if self.optpressed == true then
		love.audio.play(self.entersound)
		Gamestate.push(options)
		self.fade = 100
		self.optpressed = false
	end
	
	if self.exitpressed == true then
		self.quittimer = self.quittimer + dt
		menu.playstate = false
		menu.optstate = false
		menu.exitstate = false
		love.audio.setVolume(0.0)
		setfps = false
		self.fade = 0
	end
	-- ACTIVATE BUTTONS --

	-- Quit after exit message
	if self.quittimer >= 2 then
		love.event.quit()
	end	

	-- Update easter egg
	start:colorupdate(dt)
end

function menu:keypressed(key)

	-- SELECT BUTTONS --
	-- Move arrow up through menu states
	if key == "left" or key == "a" or key == "up" or key == "w" then
		if self.playstate == false then
			love.audio.play(self.select1)
			love.audio.play(self.select2)
			love.audio.play(self.select3)
		end
		
		self.arrowx = self.arrowx - 280
		
		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
		end 
	end

	-- Move arrow down through menu states
	if key == "right" or key == "d" or key == "down" or key == "s" then
		if self.exitstate == false then
			love.audio.play(self.select1)
			love.audio.play(self.select2)
			love.audio.play(self.select3)
		end

		self.arrowx = self.arrowx + 280
		
		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
		end
	end
	-- SELECT BUTTONS --

	-- ACTIVATE BUTTONS --
	-- Launch game
	if key == "return" and self.playstate == true or key == "space" and self.playstate == true then
		self.playpressed = true
	end

	-- Quit game
	if key == "return" and self.exitstate == true or key == "space" and self.exitstate == true then
		self.exitpressed = true
	end

	-- Go to options menu
	if key == "return" and self.optstate == true or key == "space" and self.optstate == true then
		self.optpressed = true
	end
	-- ACTIVATE BUTTONS --

	-- Keypressed for easter egg
	start:colorkeypressed(key)
end


function menu:mousepressed(mx, my, button)

	-- ACTIVATE BUTTONS --
	-- Launch game
	if button == 1 and self.playstatemouse == true then
		self.playpressed = true
	end

	-- Quit game
	if button == 1 and self.exitstatemouse == true then
		self.exitpressed = true
	end

	-- Go to options menu
	if button == 1 and self.optstatemouse == true then
		self.optpressed = true
	end
	-- ACTIVATE BUTTONS --

end

function menu:draw()

	if self.exitpressed == false then
		
		------ IMAGES ------
		love.graphics.draw(start.bg, start.bgx, 0, 0, 2.05)
		love.graphics.draw(start.gamelogo, (love.graphics.getWidth()/2 - start.gamelogo:getWidth()/2), (love.graphics.getHeight()/2 - start.gamelogo:getHeight()/2 - start.movelogo))
		------ IMAGES ------

		------ TEXT ------
		love.graphics.setFont( start.font8 )
		love.graphics.setColor(255, 255, 255)
		love.graphics.print('PLAY', (love.graphics.getWidth()/2 - start.font8:getWidth( "PLAY" )/2 - 280), (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2) + self.optbtny)
		love.graphics.print('QUIT', (love.graphics.getWidth()/2 - start.font8:getWidth( "QUIT" )/2 + 280), (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2) + self.optbtny, 0)
		love.graphics.print('SETTINGS', (love.graphics.getWidth()/2 - start.font8:getWidth( "SETTINGS" )/2), (love.graphics.getHeight()/2 - start.font8:getHeight( "SETTINGS" )/2) + self.optbtny, 0)
		love.graphics.setFont( start.font0 )
		love.graphics.print('Pre-Alpha 0.4.0', 10, (love.graphics.getHeight() - start.font0:getHeight("Pre-Alpha 0.4.0") - 10))
		love.graphics.setColor(255, 255, 255, 255)
		------ TEXT ------

		------ SHAPES ------
		-- Arrow
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - start.font8:getWidth( "SETTINGS" )/2) + self.arrowx + 30, (love.graphics.getHeight()/2 - 28/2) + self.arrowy, 200, 10 )
		
		-- White Flash
		love.graphics.setColor(255, 255, 255, self.fade)
		love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setColor(255, 255, 255, 255)
		------ SHAPES ------
	end

	if self.exitpressed == true then
		
		------ TEXT ------
		-- Displays quit message
		love.graphics.setFont( start.font7 )
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.print('See You Space Cowboy...', (love.graphics.getWidth( ) - start.font7:getWidth( "See You Space Cowboy..." ) - 45), (love.graphics.getHeight( ) - start.font7:getHeight( "See You Space Cowboy..." ) - 40))
		------ TEXT ------
	end
end

return menu