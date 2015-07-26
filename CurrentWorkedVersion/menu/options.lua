-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Loads credits script
credits = require 'menu/credits'

-- Loads controls script
controls = require 'menu/controls'

-- Loads changelog script
changelog = require 'menu/changelog'

-- Loads moregames script
moregames = require 'menu/moregames'

-- Creates options as a new gamestate
options = Gamestate.new()


function options:init()

	------ VARIABLES ------
	-- FPS Button Y & X
	self.fpsbtny = -240						
	self.fpsbtnx = 492
	
	-- Mute Button Y & X
	self.mutebtny = -180
	self.mutebtnx = 502
	
	-- MouseLock Button Y & X
	self.mouselockbtny = -120
	self.mouselockbtnx = 507

	-- Fullscreen Button Y & X
	self.fullscreenbtny = -60
	self.fullscreenbtnx = 492

	-- Credits Button Y & X
	self.creditsbtny = 60
	
	-- control Button Y & X
	self.controlsbtny = 120
	
	-- changelog Button Y & X
	self.changelogbtny = 180
	
	-- moregames Button Y & X
	self.moregamesbtny = 240

	-- Back button
	self.backy = 0

	-- FPS Selecter Y & X
	self.fpsarrowy = 232
	self.fpsarrowx = 665
	
	-- Mute Selecter Y & X
	self.mutearrowy = 347
	self.mutearrowx = 665

	-- MouseLock Selecter Y & X
	self.mouselockarrowy = 462
	self.mouselockarrowx = 507

	-- fullscreen Selecter Y & X
	self.fullscreenarrowy = 232
	self.fullscreenarrowx = 665

	-- Button Selecter Y & X
	self.arrowy = (self.fpsbtny)
	self.arrowx = 650

	-- Option menu states
	self.fpsstate = false
	self.mutestate = false
	self.mouselockstate = false
	self.creditsstate = false
	self.fullscreenstate = false
	self.controlsstate = false
	self.changelogstate = false
	self.moregamesstate = false

	-- white flash
	self.fade = 100

	-- scale back button
	self.scaleback = 1

	-- mouse button state
	self.fpsstatemouse = false
	self.mutestatemouse = false
	self.mouselockstatemouse = false
	self.creditsstatemouse = false
	self.fullscreenstatemouse = false
	self.controlsstatemouse = false
	self.changelogstatemouse = false
	self.moregamesstatemouse = false
	self.backstatemouse = false

	-- Mouse Dectect vars for sound
	self.mouseover = false
	self.mouseoverback = false
	self.mousedetect1 = 0
	self.mousedetect2 = 0
	self.mousedetect3 = 0
	self.mousedetect4 = 0
	self.mousedetect5 = 0
	------ VARIABLES ------

	------ IMAGES ------
	self.fullimage = love.graphics.newImage("images/menu/fullscreen.png")
	self.fpsimage = love.graphics.newImage("images/menu/fps.png")
	self.muteimage = love.graphics.newImage("images/menu/mute.png")
	self.mouselockimage = love.graphics.newImage("images/menu/mouselock.png")
	self.controlsimage = love.graphics.newImage("images/menu/controlsicon.png")
	self.moregamesimage = love.graphics.newImage("images/menu/moregames.png")
	self.changelogimage = love.graphics.newImage("images/menu/changelog.png")
	self.creditsimage = love.graphics.newImage("images/menu/credits.png")
	------ IMAGES ------

	------ AUDIO ------
	self.entersound1 = love.audio.newSource("audio/buttons/enter.ogg")
	self.entersound1a = love.audio.newSource("audio/buttons/enter.ogg")
	self.entersound2 = love.audio.newSource("audio/buttons/enter.ogg")
	self.entersound2a = love.audio.newSource("audio/buttons/enter.ogg")
	self.entersound3 = love.audio.newSource("audio/buttons/enter.ogg")
	self.entersound3a = love.audio.newSource("audio/buttons/enter.ogg")
	self.backsound = love.audio.newSource("audio/buttons/enter.ogg")
	self.select1 = love.audio.newSource("audio/buttons/select.ogg")
	self.select2 = love.audio.newSource("audio/buttons/select.ogg")
	self.select3 = love.audio.newSource("audio/buttons/select.ogg")
	self.select4 = love.audio.newSource("audio/buttons/select.ogg")
	self.select5 = love.audio.newSource("audio/buttons/select.ogg")
	self.select6 = love.audio.newSource("audio/buttons/select.ogg")
	self.clickselect1 = love.audio.newSource("audio/buttons/select.ogg")
	self.clickselect2 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover1 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover2 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover3 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover4 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover5 = love.audio.newSource("audio/buttons/select.ogg")
	------ AUDIO ------
end

function options:update(dt)

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

	-- Move options text depending on if its in menu or pasued
	if paused == false or paused == true then
		self.fpsbtny = -240
		self.mutebtny = -180
		self.mouselockbtny = -120
		self.fullscreenbtny = -60
		self.backy = 0
		self.creditsbtny = 60
		self.changelogbtny = 120
		self.controlsbtny = 180
		self.moregamesbtny = 240
	end 
	
	-- OPTION MENU STATES --
	-- fps options menu state
	if self.arrowy == self.fpsbtny then--and self.page2 == false then
		self.arrowx = 518
		self.fpsstate = true
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
		love.audio.stop(self.select4)
	end

	-- mute options menu state
	if self.arrowy < self.mouselockbtny and self.arrowy > self.fpsbtny then--and self.page2 == false then
		self.arrowx = 518
		self.fpsstate = false
		self.mutestate = true
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
		love.audio.stop(self.select4)
	end

	-- mouselock options menu state
	if self.arrowy < self.fullscreenbtny and self.arrowy > self.mutebtny then--and self.page2 == false then
		self.arrowx = 518
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = true
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
	end

	-- fullscreen options menu state
	if self.arrowy == self.fullscreenbtny then--and self.page2 == false then
		self.arrowx = 518
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = true
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select3)
		love.audio.stop(self.select4)
	end

	-- credits options menu state
	if self.arrowy == self.creditsbtny then--and self.page2 == true then
		self.arrowx = 410
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = true
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
		love.audio.stop(self.select4)
	end

	-- mute controls menu state
	if self.arrowy < self.controlsbtny and self.arrowy > self.creditsbtny then--and self.page2 == true then
		self.arrowx = 438
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = false
		self.changelogstate = true
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
		love.audio.stop(self.select4)
	end

	-- mouselock changelog menu state
	if self.arrowy < self.moregamesbtny and self.arrowy > self.changelogbtny then--and self.page2 == true then
		self.arrowx = 428
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = true
		self.moregamesstate = false
		self.changelogstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select2)
		love.audio.stop(self.select3)
	end

	-- credits moregames menu state
	if self.arrowy == self.moregamesbtny then--and self.page2 == true then
		self.arrowx = 458 --60
		self.fpsstate = false
		self.mutestate = false
		self.fullscreenstate = false
		self.mouselockstate = false
		self.creditsstate = false
		self.controlsstate = false
		self.moregamesstate = true
		self.changelogstate = false
		love.audio.stop(self.select1)
		love.audio.stop(self.select3)
		love.audio.stop(self.select4)
	end
	-- OPTION MENU STATES --

	-- Make sure the arrow doesnt go past fps or credits
	if self.arrowy < self.fpsbtny then
		self.arrowy = self.fpsbtny
	elseif self.arrowy > self.moregamesbtny then
		self.arrowy = self.moregamesbtny
	end

	-- Pushes FPS arrow back if it trys to pass off else turn setfps true or false
	if self.fpsarrowx > self.fpsbtnx then
		self.fpsarrowx = self.fpsbtnx - 118
	elseif self.fpsarrowx == self.fpsbtnx - 118 then
		setfps = false
	elseif self.fpsarrowx == self.fpsbtnx then	
		setfps = true
	end

	-- Pushes mute arrow back if it trys to pass off else turn setmute true or false
	if self.mutearrowx > self.mutebtnx then
		self.mutearrowx = self.mutebtnx - 118
	elseif self.mutearrowx == self.mutebtnx - 118 then
		setmute = false
	elseif self.mutearrowx == self.mutebtnx then	
		setmute = true
	end

	-- Pushes mouselock arrow back if it trys to pass off else turn setmouselock true or false
	if self.mouselockarrowx > self.mouselockbtnx then
		self.mouselockarrowx = self.mouselockbtnx - 118
	elseif self.mouselockarrowx == self.mouselockbtnx - 118 then
		setmouselock = false
	elseif self.mouselockarrowx == self.mouselockbtnx then	
		setmouselock = true
	end

	-- Pushes fullscreen arrow back if it trys to pass off else turn setfullscreen true or false
	if self.fullscreenarrowx > self.fullscreenbtnx then
		self.fullscreenarrowx = self.fullscreenbtnx - 118
	elseif self.fullscreenarrowx == self.fullscreenbtnx - 118 and setgamefull == true then
		setfull = false
		setgamefull = false
	elseif self.fullscreenarrowx == self.fullscreenbtnx and setgamefull == false then	
		setfull = true
		setgamefull = true
	end
	
	-- MOUSE AREAS --
	-- Mouse area of fps button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "DISPLAY FPS:" )/2 + self.fpsbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "DISPLAY FPS:" )/2 + self.fpsbtny) + start.font3:getHeight( "DISPLAY FPS:" ) then
		self.fpsstatemouse = true
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.backstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.arrowx = 518
		self.arrowy = self.fpsbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = self.mousedetect1 + 1
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of mute button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "MUTE AUDIO:" )/2 + self.mutebtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "MUTE AUDIO:" )/2 + self.mutebtny + start.font3:getHeight( "MUTE AUDIO:" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = true
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 518
		self.arrowy = self.mutebtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = self.mousedetect2 + 1
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of mouselock button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "WINDOW LOCK:" )/2 + self.mouselockbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "WINDOW LOCK:" )/2 + self.mouselockbtny + start.font3:getHeight( "WINDOW LOCK:" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = true
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 518
		self.arrowy = self.mouselockbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = self.mousedetect3 + 1
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of fullscreen button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) 
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "FULLSCREEN:" )/2 + self.fullscreenbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "FULLSCREEN:" )/2 + self.fullscreenbtny + start.font3:getHeight( "FULLSCREEN:" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = true
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 518
		self.arrowy = self.fullscreenbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = self.mousedetect4 + 1
		self.mousedetect5 = 0
	end

	-- Mouse area of credits button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) 
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "CREDITS" )/2 + self.creditsbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "CREDITS" )/2 + self.creditsbtny + start.font3:getHeight( "CREDITS" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = true
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 410
		self.arrowy = self.creditsbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = self.mousedetect1 + 1
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of controls button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) 
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "CONTROLS" )/2 + self.controlsbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "CONTROLS" )/2 + self.controlsbtny + start.font3:getHeight( "CONTROLS" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = true
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 428
		self.arrowy = self.controlsbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = self.mousedetect2 + 1
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of changelog button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) 
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "CHANGELOG" )/2 + self.changelogbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "CHANGELOG" )/2 + self.changelogbtny + start.font3:getHeight( "CHANGELOG" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = true
		self.moregamesstatemouse = false
		self.backstatemouse = false
		self.arrowx = 438
		self.arrowy = self.changelogbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = self.mousedetect3 + 1
		self.mousedetect4 = 0
		self.mousedetect5 = 0
	end

	-- Mouse area of moregames button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130
		and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) 
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "MORE GAMES" )/2 + self.moregamesbtny)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "MORE GAMES" )/2 + self.moregamesbtny + start.font3:getHeight( "MORE GAMES" )) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = true
		self.backstatemouse = false
		self.arrowx = 458
		self.arrowy = self.moregamesbtny
		self.mouseover = true
		self.mouseoverback = false
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = self.mousedetect4 + 1
		self.mousedetect5 = 0
	end

	-- Mouse area of back button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - 610 + start.font5:getWidth( "<" )) 
		and love.mouse.getX() > (love.graphics.getWidth()/2 - 610)
		and love.mouse.getY() > (love.graphics.getHeight()/2 - start.font5:getHeight( "<" )/2)
		and love.mouse.getY() < (love.graphics.getHeight()/2 - start.font5:getHeight( "<" )/2) + 45 then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.backstatemouse = true
		self.mouseover = false
		self.mouseoverback = true
		self.scaleback = 1.2
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		self.mousedetect5 = self.mousedetect5 + 1
	end
	-- MOUSE AREAS --

	-- MOUSE OUT OF AREA --
	-- Out of areas for the page 1 buttons
	if love.mouse.getX() > (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360 + start.font3:getWidth( "DISPLAY FPS:" )) + 130 then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2 - 360) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.mouseover = false
	end
	
	if love.mouse.getY() < (love.graphics.getHeight()/2 - start.font3:getHeight( "DISPLAY FPS:" )/2 + self.fpsbtny) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.mouseover = false
	end

	if love.mouse.getY() > (love.graphics.getHeight()/2 - start.font3:getHeight( "MORE GAMES" )/2 + self.moregamesbtny) + start.font3:getHeight( "MORE GAMES" ) then
		self.fpsstatemouse = false
		self.mutestatemouse = false
		self.mouselockstatemouse = false
		self.creditsstatemouse = false
		self.fullscreenstatemouse = false
		self.controlsstatemouse = false
		self.changelogstatemouse = false
		self.moregamesstatemouse = false
		self.mouseover = false
	end

	-- Out of areas for the back button
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 610 + start.font5:getWidth( "<" )) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end 
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - 610) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end

	if love.mouse.getY() < (love.graphics.getHeight()/2 - start.font5:getHeight( "<" )/2) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end 

	if love.mouse.getY() > (love.graphics.getHeight()/2 - start.font5:getHeight( "<" )/2) + 45 then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end
	-- MOUSE OUT OF AREA --

	-- MOUSE DECTECTS --
	if self.mouseover == false then
		self.mousedetect1 = 0
		self.mousedetect2 = 0
		self.mousedetect3 = 0
		self.mousedetect4 = 0
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
		love.audio.stop(self.mouseover4)
	end

	if self.mouseoverback == false then
		self.mousedetect5 = 0
		love.audio.stop(self.mouseover5)
	end

	if self.mousedetect1 == 1 then
		love.audio.play(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
		love.audio.stop(self.mouseover4)
		love.audio.stop(self.mouseover5)
	end

	if self.mousedetect2 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.play(self.mouseover2)
		love.audio.stop(self.mouseover3)
		love.audio.stop(self.mouseover4)
		love.audio.stop(self.mouseover5)
	end

	if self.mousedetect3 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.play(self.mouseover3)
		love.audio.stop(self.mouseover4)
		love.audio.stop(self.mouseover5)
	end

	if self.mousedetect4 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
		love.audio.play(self.mouseover4)
		love.audio.stop(self.mouseover5)
	end

	if self.mousedetect5 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.stop(self.mouseover2)
		love.audio.stop(self.mouseover3)
		love.audio.stop(self.mouseover4)
		love.audio.play(self.mouseover5)
	end
	-- MOUSE DECTECTS --
end

function options:keypressed(key)
	
	-- SELECT BUTTONS --
	-- Move arrow up through options menu states
	if key == "up" or key == "w" then
		love.audio.play(self.select1)
		love.audio.play(self.select2)
		love.audio.play(self.select3)
		love.audio.play(self.select4)
		self.arrowy = self.arrowy - 60

		-- move arrow over the fullscreen and credits gap
		if self.arrowy > self.fullscreenbtny and self.arrowy < self.creditsbtny then
			self.arrowy = self.arrowy - 60
		end

		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 400)
		end 
	end

	-- Move arrow up through options menu states
	if key == "down" or key == "s" then
		love.audio.play(self.select1)
		love.audio.play(self.select2)
		love.audio.play(self.select3)
		love.audio.play(self.select4)
		self.arrowy = self.arrowy + 60

		-- move arrow over the fullscreen and credits gap
		if self.arrowy > self.fullscreenbtny and self.arrowy < self.creditsbtny then
			self.arrowy = self.arrowy + 60
		end

		if self.mouseover == true then
			love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 400)
		end 
	end
	-- SELECT BUTTONS --

	-- ACTIVATE BUTTONS --
	-- go to credits screen
	if key == "return" and self.creditsstate == true or key == " " and self.creditsstate == true then
		Gamestate.push(credits)
		love.audio.stop(credits.entersound)
		love.audio.pause(start.music)
		self.fade = 100

		-- pause easteregg music if its playing
		if start.easteregg == true then
			love.audio.pause(start.colorgoeshere)
		end
		
		-- pasue game music if its playing
		if paused == true then
			love.audio.pause(game.music1)
		end

		love.audio.play(credits.music)
		credits.music:setLooping(true)
		credits.slider = love.graphics.getHeight() + 20
	end

	-- set fullscreen on or off
	if key == "return" and self.fullscreenstate == true or key == " " and self.fullscreenstate == true then
		self.fullscreenarrowx = self.fullscreenarrowx + 118
	end

	-- set controls on or off
	if key == "return" and self.controlsstate == true or key == " " and self.controlsstate == true then
		Gamestate.push(controls)
		self.fade = 100
	end

	-- set changelog on or off
	if key == "return" and self.changelogstate == true or key == " " and self.changelogstate == true then
		Gamestate.push(changelog)
		self.fade = 100
	end

	-- go to moregames screen
	if key == "return" and self.moregamesstate == true or key == " " and self.moregamesstate == true then
		Gamestate.push(moregames)
		self.fade = 100
	end

	-- set fps on or off
	if key == "return" and self.fpsstate == true or key == " " and self.fpsstate == true then
		self.fpsarrowx = self.fpsarrowx + 118
	end

	-- set mute on or off
	if key == "return" and self.mutestate == true or key == " " and self.mutestate == true then
		self.mutearrowx = self.mutearrowx + 118
	end

	-- set mouselock on or off
	if key == "return" and self.mouselockstate == true or key == " " and self.mouselockstate == true then
		self.mouselockarrowx = self.mouselockarrowx + 118
	end

	-- Plays audio for FPS On & Off buttons
	if key == "return" and setfps == true or key == " " and setfps == true then
		love.audio.play(self.entersound1)
		love.audio.stop(self.entersound1a)
	elseif key == "return" and setfps == false or key == " " and setfps == false then
		love.audio.play(self.entersound1a)
		love.audio.stop(self.entersound1)
	end 

	-- Plays audio for mouselock On & Off buttons
	if key == "return" and setmouselock == true or key == " " and setmouselock == true then
		love.audio.play(self.entersound2a)
		love.audio.stop(self.entersound2)
	elseif key == "return" and setmouselock == false or key == " " and setmouselock == false then
		love.audio.play(self.entersound2)
		love.audio.stop(self.entersound2a)
	end

	-- Plays audio for fullscreen On & Off buttons
	if key == "return" and setfull == true or key == " " and setfull == true then
		love.audio.play(self.entersound3)
		love.audio.stop(self.entersound3a)
	elseif key == "return" and setfull == false or key == " " and setfull == false then
		love.audio.play(self.entersound3a)
		love.audio.stop(self.entersound3)
	end
	-- ACTIVATE BUTTONS --

	-- Go back to the menu screen
	if key == "escape" then
		Gamestate.pop()
		love.audio.play(self.backsound)
		self.fade = 100
	end
end

function options:mousepressed(mx, my, button)
	
	-- ACTIVATE BUTTONS --
	-- go to credits screen
	if button == "l" and self.creditsstatemouse == true then
		Gamestate.push(credits)
		love.audio.stop(credits.entersound)
		love.audio.pause(start.music)
		self.fade = 100

		-- pause easteregg music if its playing
		if start.easteregg == true then
			love.audio.pause(start.colorgoeshere)
		end
		
		-- pasue game music if its playing
		if paused == true then
			love.audio.pause(game.music1)
		end

		love.audio.play(credits.music)
		credits.music:setLooping(true)
		credits.slider = love.graphics.getHeight() + 20
	end

	-- set fullscreen on or off
	if button == "l" and self.fullscreenstatemouse == true then
		self.fullscreenarrowx = self.fullscreenarrowx + 118
	end

	-- set controls on or off
	if button == "l" and self.controlsstatemouse == true then
		Gamestate.push(controls)
		self.fade = 100
	end

	-- set changelog on or off
	if button == "l" and self.changelogstatemouse == true then
		Gamestate.push(changelog)
		self.fade = 100
	end

	-- go to moregames screen
	if button == "l" and self.moregamesstatemouse == true then
		Gamestate.push(moregames)
		self.fade = 100
	end

	-- set fps on or off
	if button == "l" and self.fpsstatemouse == true then
		self.fpsarrowx = self.fpsarrowx + 118
	end

	-- set mute on or off
	if button == "l" and self.mutestatemouse == true then
		self.mutearrowx = self.mutearrowx + 118
	end

	-- set mouselock on or off
	if button == "l" and self.mouselockstatemouse == true then
		self.mouselockarrowx = self.mouselockarrowx + 118
	end

	-- Plays audio for FPS On & Off buttons
	if button == "l" and setfps == true and self.mouseover == true then
		love.audio.play(self.entersound1)
		love.audio.stop(self.entersound1a)
	elseif button == "l" and setfps == false and self.mouseover == true then
		love.audio.play(self.entersound1a)
		love.audio.stop(self.entersound1)
	end 

	-- Plays audio for mouselock On & Off buttons
	if button == "l" and setmouselock == true and self.mouseover == true then
		love.audio.play(self.entersound2a)
		love.audio.stop(self.entersound2)
	elseif button == "l" and setmouselock == false and self.mouseover == true then
		love.audio.play(self.entersound2)
		love.audio.stop(self.entersound2a)
	end

	-- Plays audio for fullscreen On & Off buttons
	if button == "l" and setfull == true and self.mouseover == true then
		love.audio.play(self.entersound3)
		love.audio.stop(self.entersound3a)
	elseif button == "l" and setfull == false and self.mouseover == true then
		love.audio.play(self.entersound3a)
		love.audio.stop(self.entersound3)
	end
	-- ACTIVATE BUTTONS --

	-- Go back to the start screen
	if button == "r" then
		Gamestate.pop()
		love.audio.play(self.backsound)
		self.fade = 100
	end

	if button == "l" and self.backstatemouse == true then
		Gamestate.pop()
		love.audio.play(self.backsound)
		self.fade = 100
	end
end

function options:draw()

	------ FILTERS ------
	start.bg:setFilter( 'nearest', 'nearest' )
	start.font9:setFilter( 'nearest', 'nearest' )
	start.font3:setFilter( 'nearest', 'nearest' )
	self.fullimage:setFilter( 'nearest', 'nearest' )
	self.fpsimage:setFilter( 'nearest', 'nearest' )
	self.muteimage:setFilter( 'nearest', 'nearest' )
	self.mouselockimage:setFilter( 'nearest', 'nearest' )
	self.moregamesimage:setFilter( 'nearest', 'nearest' )
	self.controlsimage:setFilter( 'nearest', 'nearest' )
	self.changelogimage:setFilter( 'nearest', 'nearest' )
	self.creditsimage:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	-- Sets image depending if in options menu or pasue
	if paused == false then
		love.graphics.draw(start.bg, start.bgx, 0, 0, 2.05)
	elseif paused == true then
		love.graphics.draw(start.bg, 0, -1000, 0, 3)
	end
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("line", (love.graphics.getWidth()/2 - 504/2) - 250 - 50, (love.graphics.getHeight()/2 - 564/2), 504, 564 )
	love.graphics.setColor(0, 0, 0, 100)
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 500/2) - 250 - 50, (love.graphics.getHeight()/2 - 560/2), 500, 560 )
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 28/2) - self.arrowx, (love.graphics.getHeight()/2 - 28/2) + self.arrowy + 6, 28, 10 )
	love.graphics.setColor(255, 255, 255)
	------ SHAPES ------

	------ IMAGES ------
	-- draw current setting images
	if self.fullscreenstate == true then
		love.graphics.draw(self.fullimage, (love.graphics.getWidth()/2 - self.fullimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.fullimage:getHeight() + 200))
	end

	if self.fpsstate == true then
		love.graphics.draw(self.fpsimage, (love.graphics.getWidth()/2 - self.fpsimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.fpsimage:getHeight() + 200))
	end

	if self.mutestate == true then
		love.graphics.draw(self.muteimage, (love.graphics.getWidth()/2 - self.muteimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.muteimage:getHeight() + 200))
	end

	if self.mouselockstate == true then
		love.graphics.draw(self.mouselockimage, (love.graphics.getWidth()/2 - self.mouselockimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.mouselockimage:getHeight() + 200))
	end

	if self.controlsstate == true then
		love.graphics.draw(self.controlsimage, (love.graphics.getWidth()/2 - self.controlsimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.controlsimage:getHeight() + 200))
	end

	if self.moregamesstate == true then
		love.graphics.draw(self.moregamesimage, (love.graphics.getWidth()/2 - self.moregamesimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.moregamesimage:getHeight() + 200))
	end

	if self.changelogstate == true then
		love.graphics.draw(self.changelogimage, (love.graphics.getWidth()/2 - self.changelogimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.changelogimage:getHeight() + 200))
	end

	if self.creditsstate == true then
		love.graphics.draw(self.creditsimage, (love.graphics.getWidth()/2 - self.creditsimage:getWidth()/2 + 300), (love.graphics.getHeight()/2 - self.creditsimage:getHeight() + 200))
	end
	------ IMAGES ------

	------ TEXT ------	
	love.graphics.setFont( start.font9 )
	love.graphics.setColor(255, 255, 255)
	love.graphics.print('SETTINGS', (love.graphics.getWidth()/2) + 125, (love.graphics.getHeight()/2 - start.font9:getHeight("SETTINGS") - 180))
	love.graphics.setFont( start.font3 )
	love.graphics.print('DISPLAY FPS:', (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2) - 360, (love.graphics.getHeight()/2 - start.font3:getHeight( "DISPLAY FPS:" )/2) + self.fpsbtny)--, 0, self.scalefps)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('MUTE AUDIO:', (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2) - 360, (love.graphics.getHeight()/2 - start.font3:getHeight( "MUTE AUDIO:" )/2) + self.mutebtny)--, 0, self.scalemute)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('WINDOW LOCK:', (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2) - 360, (love.graphics.getHeight()/2 - start.font3:getHeight( "WINDOW LOCK:" )/2) + self.mouselockbtny)--, 0, self.scalemouselock)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('FULLSCREEN:', (love.graphics.getWidth()/2 - start.font3:getWidth( "DISPLAY FPS:" )/2) - 360, (love.graphics.getHeight()/2 - start.font3:getHeight( "FULLSCREEN:" )/2) + self.fullscreenbtny)--, 0, self.scalefullscreen)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('CREDITS', (love.graphics.getWidth()/2 - start.font3:getWidth( "CREDITS" )/2) - 300, (love.graphics.getHeight()/2 - start.font3:getHeight( "CREDITS" )/2) + self.creditsbtny)--, 0, self.scalecredits)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('CHANGELOG', (love.graphics.getWidth()/2 - start.font3:getWidth( "CHANGELOG" )/2) - 300, (love.graphics.getHeight()/2 - start.font3:getHeight( "CHANGELOG" )/2) + self.changelogbtny)--, 0, self.scalechangelog)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('CONTROLS', (love.graphics.getWidth()/2 - start.font3:getWidth( "CONTROLS" )/2) - 300, (love.graphics.getHeight()/2 - start.font3:getHeight( "CONTROLS" )/2) + self.controlsbtny)--, 0, self.scalecontrols)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print('MORE GAMES', (love.graphics.getWidth()/2 - start.font3:getWidth( "MORE GAMES" )/2) - 300, (love.graphics.getHeight()/2 - start.font3:getHeight( "MORE GAMES" )/2) + self.moregamesbtny)--, 0, self.scalemoregames)
	love.graphics.setColor(255, 255, 255, 255)
	
	-- changes text from on and off for fps
	if setfps == true then
		love.graphics.print('ON', (love.graphics.getWidth()/2 - start.font3:getWidth( "ON" )/2) - 162, (love.graphics.getHeight()/2 - start.font3:getHeight( "ON" )/2) + self.fpsbtny)
	elseif setfps == false then
		love.graphics.print('OFF', (love.graphics.getWidth()/2 - start.font3:getWidth( "OFF" )/2) - 150, (love.graphics.getHeight()/2 - start.font3:getHeight( "OFF" )/2) + self.fpsbtny)
	end

	-- changes text from on and off for mute
	if setmute == true then
		love.graphics.print('ON', (love.graphics.getWidth()/2 - start.font3:getWidth( "ON" )/2) - 162, (love.graphics.getHeight()/2 - start.font3:getHeight( "ON" )/2) + self.mutebtny)
	elseif setmute == false then
		love.graphics.print('OFF', (love.graphics.getWidth()/2 - start.font3:getWidth( "OFF" )/2) - 150, (love.graphics.getHeight()/2 - start.font3:getHeight( "OFF" )/2) + self.mutebtny)
	end

	-- changes text from on and off for mouselock
	if setmouselock == true then
		love.graphics.print('ON', (love.graphics.getWidth()/2 - start.font3:getWidth( "ON" )/2) - 162, (love.graphics.getHeight()/2 - start.font3:getHeight( "ON" )/2) + self.mouselockbtny)
	elseif setmouselock == false then
		love.graphics.print('OFF', (love.graphics.getWidth()/2 - start.font3:getWidth( "OFF" )/2) - 150, (love.graphics.getHeight()/2 - start.font3:getHeight( "OFF" )/2) + self.mouselockbtny)
	end

	-- changes text from on and off for fullscreen
	if setfull == true then
		love.graphics.print('ON', (love.graphics.getWidth()/2 - start.font3:getWidth( "ON" )/2) - 162, (love.graphics.getHeight()/2 - start.font3:getHeight( "ON" )/2) + self.fullscreenbtny)
	elseif setfull == false then
		love.graphics.print('OFF', (love.graphics.getWidth()/2 - start.font3:getWidth( "OFF" )/2) - 150, (love.graphics.getHeight()/2 - start.font3:getHeight( "OFF" )/2) + self.fullscreenbtny)
	end

	-- draw back button
	love.graphics.setFont( start.font5 )
	love.graphics.print('<', (love.graphics.getWidth()/2 - 610), (love.graphics.getHeight()/2 - start.font5:getHeight( "<" )/2), 0, self.scaleback)
	love.graphics.setColor(255, 255, 255)
	------ TEXT ------

	------ SHAPES ------
	-- White Flash
	love.graphics.setColor(255, 255, 255, self.fade)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------
end

return options