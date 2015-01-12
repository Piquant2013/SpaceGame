-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates options as a new gamestate
local options = Gamestate.new()

-- Loads changlog script
local changelog = require 'menu/changelog'

-- Loads credits script
local credits = require 'menu/credits'


function options:init()
	
	------ IMAGES ------
	self.OptBG = love.graphics.newImage("images/largespacebg.png")
	self.FPSOn = love.graphics.newImage("images/on.png")
	self.FPSOff = love.graphics.newImage("images/off.png")
	self.MuteOn = love.graphics.newImage("images/on.png")
	self.MuteOff = love.graphics.newImage("images/off.png")
	------ IMAGES ------

	------ AUDIO ------
	EnterOpt = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt1 = love.audio.newSource("audio/enter.ogg")
	self.Select1 = love.audio.newSource("audio/sel.ogg")
	self.Select2 = love.audio.newSource("audio/sel.ogg")
	self.Select3 = love.audio.newSource("audio/sel.ogg")
	self.Select4 = love.audio.newSource("audio/sel.ogg")
	self.Select5 = love.audio.newSource("audio/sel.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	self.Select2M = love.audio.newSource("audio/sel.ogg")
	self.Select3M = love.audio.newSource("audio/sel.ogg")
	self.Select4M = love.audio.newSource("audio/sel.ogg")
	self.Select5M = love.audio.newSource("audio/sel.ogg")
	------ AUDIO ------

	------ VARIABLES ------
	-- Option menu state
	self.FPSState = false
	self.MuteState = false
	self.ChgState = false
	self.CrdState = false
	self.BackState = false

	-- FPS Button Y & X
	self.FPSBtnY = 182
	self.FPSBtnX = 492
	
	-- Mute Button Y & X
	self.MuteBtnY = 297
	self.MuteBtnX = 502

	-- Changelog Button Y & X
	self.ChgBtnY = 412
	self.ChgBtnX = 507

	-- Credits Button Y & X
	self.CrdBtnY = 527
	self.CrdBtnX = 550

	-- Back Button Y & X
	self.BackBtnY = 642
	self.BackBtnX = 584

	-- Button Selecter Y & X
	self.OptArrowY = (self.FPSBtnY)
	self.OptArrowX = 435

	-- FPS Selecter Y & X
	self.FPSArrowY = 232
	self.FPSArrowX = 665

	-- FPS On & Off Button Y & X
	self.FPSOnOffY = 232
	self.FPSOnOffX = 647
	
	-- Mute Selecter Y & X
	self.MuteArrowY = 347
	self.MuteArrowX = 665

	-- Mute On & Off Button Y & X
	self.MuteOnOffY = 347
	self.MuteOnOffX = 647

	-- Mouse button areas
	self.MouseFPSArea = false
	self.MouseMuteArea = false
	self.MouseChgAreat = false
	self.MouseCrdArea = false
	self.MouseBackArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseDetect1 = 0
	self.MouseDetect2 = 0
	self.MouseDetect3 = 0
	self.MouseDetect4 = 0
	self.MouseOnBtn = false

	-- Mouse button coords
	self.MouseFPSY = 162
	self.MouseMuteY = 277
	self.MouseChgY = 392
	self.MouseCrdY = 497
	self.MouseBackYTop = 702
	self.MouseBackY = 612
	------ VARIABLES ------

	-- Sets Menu font and size
	self.OptFont = love.graphics.newFont("fonts/xen3.ttf", 50)

	-- Sets Menu font and size
	self.TitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
end

function options:update(dt)
	
	-- OPTION MENU STATES
	if options.OptArrowY == options.FPSBtnY then
		options.FPSState = true
		options.MuteState = false
		options.ChgState = false
		options.CrdState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
	end

	if options.OptArrowY == options.BackBtnY then
		options.MuteState = false
		options.FPSState = false
		options.ChgState = false
		options.CrdState = false
		options.BackState = true
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select5)
	end

	if options.OptArrowY < options.BackBtnY and options.OptArrowY > options.ChgBtnY then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = true
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
	end

	if options.OptArrowY < options.CrdBtnY and options.OptArrowY > options.MuteBtnY then
		options.ChgState = true
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
	end

	if options.OptArrowY < options.ChgBtnY and options.OptArrowY > options.FPSBtnY then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = true
		options.CrdState = false
		options.BackState = false
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
	end
	-- OPTION MENU STATES

	-- Anything between the "OPTION MENU STATES" comments:
	-- This piece of code is everything that tells the menu what state it is at


	-- Makes sure the arrow doesnt go past back
	if options.OptArrowY > options.BackBtnY then
		options.OptArrowY = options.BackBtnY
	end

	-- Makes sure the arrow doesnt go past FPS
	if options.OptArrowY < options.FPSBtnY then
		options.OptArrowY = options.FPSBtnY
	end

	-- Pushes FPS arrow back if it trys to pass off
	if options.FPSArrowX > options.FPSBtnX then
		options.FPSArrowX = options.FPSBtnX - 118
	end

	-- Sets FPS to Off
	if options.FPSArrowX == options.FPSBtnX - 118 then
		SetFPS = false
	end

	-- Sets FPS to On
	if options.FPSArrowX == options.FPSBtnX then	
		SetFPS = true
	end

	-- Pushes Mute arrow back if it trys to pass off
	if options.MuteArrowX > options.MuteBtnX then
		options.MuteArrowX = options.MuteBtnX - 118
	end

	-- Sets Mute to Off
	if options.MuteArrowX == options.MuteBtnX - 118 then
		SetMute = false
		love.audio.play(MenuMusic)
	end

	-- Sets Mute to On
	if options.MuteArrowX == options.MuteBtnX then	
		SetMute = true
	end

	-- MOUSE AUDIO ONCE
	if options.MouseOnBtn == false then
		options.MouseDetect = 0
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
	end

	if options.MouseDetect == 1 and SetMute == false then
		love.audio.play(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
	end

	if options.MouseDetect1 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.play(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
	end

	if options.MouseDetect2 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.play(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
	end

	if options.MouseDetect3 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.play(options.Select4M)
		love.audio.stop(options.Select5M)
	end

	if options.MouseDetect4 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.play(options.Select5M)
	end
	-- Anything between the "MOUSE AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for each selection when the mouse is moving between selections


	-- MOUSE OUT OF AREA
	if love.mouse.getX() < (options.OptArrowX + 816) then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
	end

	if love.mouse.getX() < options.OptArrowX then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
	end

	if love.mouse.getY() < options.MouseFPSY then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
	end

	if love.mouse.getY() > options.MouseBackYTop then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
	end
	-- MOUSE OUT OF AREA

	-- Anything between the "MOUSE OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE BUTTON AREAS
	
	-- Mouse area of the FPS button
	if love.mouse.getY() > options.MouseFPSY and love.mouse.getY() < options.MouseMuteY and love.mouse.getX() > options.OptArrowX and love.mouse.getX() < (options.OptArrowX + 381) then
		options.OptArrowY = options.FPSBtnY
		options.MouseOnBtn = true
		options.MouseFPSArea = true
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseDetect = options.MouseDetect + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
	end

	-- Mouse area of the mute button
	if love.mouse.getY() > options.MouseMuteY and love.mouse.getY() < options.MouseChgY and love.mouse.getX() > options.OptArrowX and love.mouse.getX() < (options.OptArrowX + 381) then
		options.OptArrowY = options.MuteBtnY
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = true
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseDetect1 = options.MouseDetect1 + 1
		options.MouseDetect = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
	end

	-- Mouse area of the change button
	if love.mouse.getY() > options.MouseChgY and love.mouse.getY() < options.MouseCrdY and love.mouse.getX() > options.OptArrowX and love.mouse.getX() < (options.OptArrowX + 381) then
		options.OptArrowY = options.ChgBtnY
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = true
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseDetect2 = options.MouseDetect2 + 1
		options.MouseDetect = 0
		options.MouseDetect1 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
	end

	-- Mouse area of the credits button
	if love.mouse.getY() > options.MouseCrdY and love.mouse.getY() < options.MouseBackY and love.mouse.getX() > options.OptArrowX and love.mouse.getX() < (options.OptArrowX + 381) then
		options.OptArrowY = options.CrdBtnY
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = true
		options.MouseBackArea = false
		options.MouseDetect3 = options.MouseDetect3 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect = 0
		options.MouseDetect4 = 0
	end

	-- Mouse area of the back button
	if love.mouse.getY() > options.MouseBackY and love.mouse.getY() < options.MouseBackYTop and love.mouse.getX() > options.OptArrowX and love.mouse.getX() < (options.OptArrowX + 381) then
		options.OptArrowY = options.BackBtnY
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = true
		options.MouseDetect4 = options.MouseDetect4 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
	end
	-- MOUSE BUTTON AREAS

	-- Anything between the "MOUSE BUTTON AREAS" comments:
	-- This tells the menu if the mouse is over a certain button
end

function options:mousepressed(mx, my, button)

	-- Move mouse away from button if user tries to use scroll for selection
	if button == "wu" and options.MouseOnBtn == true then
		love.mouse.setX(817)
	end

	-- Move mouse away from button if user tries to use scroll for selection
	if button == "wd" and options.MouseOnBtn == true then
		love.mouse.setX(817)
	end

	------ SELECT BUTTONS ------
	-- Allows scrolling through menu states
	if button == "wu" then
		options.MouseOnBtn = false
		options.OptArrowY = options.OptArrowY - 115
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
	end

	if button == "wd" then
		options.MouseOnBtn = false
		options.OptArrowY = options.OptArrowY + 115
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
	end
	------ SELECT BUTTONS ------

	------ ACTIVATE BUTTONS ------
	-- If the mouse is on FPS and return is true then move FPS On & Off arrow
	if button == "l" and options.FPSState and options.MouseFPSArea == true then
		options.FPSArrowX = options.FPSArrowX + 118
	end

	-- If the mouse is on Mute and return is true then move Mute On & Off arrow
	if button == "l" and options.MuteState and options.MouseMuteArea == true then
		options.MuteArrowX = options.MuteArrowX + 118
	end

	-- If the mouse is on changelog and return is true then display chnagelog
	if button == "l" and options.ChgState and options.MouseChgArea == true then
		Gamestate.push(changelog)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterChg)
	end

	-- If the mouse is on back and return is true then return to the main menu
	if button == "l" and options.BackState and options.MouseBackArea == true then
		Gamestate.pop()
		love.audio.play(EnterOpt)
	end

	-- If the mouse is on credits and return is true then display credits
	if button == "l" and options.CrdState and options.MouseCrdArea == true then
		Gamestate.push(credits)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterCrd)
	end
	------ ACTIVATE BUTTONS ------

	-- Plays audio for FPS On & Off buttons
	if button == "l" and SetFPS and options.MouseFPSArea == true then
		love.audio.play(options.EnterOpt1)
		love.audio.stop(EnterOpt)
	end

	if button == "l" and SetFPS == false and options.MouseFPSArea == true then
		love.audio.play(EnterOpt)
		love.audio.stop(options.EnterOpt1)
	end 
end

function options:keypressed(key)
	
	-- Move mouse away from button if user tries to use arrows for selection
	if key == "up" and options.MouseOnBtn == true or key == "w" and options.MouseOnBtn == true then
		love.mouse.setX(817)
	end

	if key == "down" and options.MouseOnBtn == true or key == "s" and options.MouseOnBtn == true then
		love.mouse.setX(817)
	end

	------ SELECT BUTTONS ------
	-- Moves arrow up and down through option menu states
	if key == "up" or key == "w" then
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseOnBtn = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
		options.OptArrowY = options.OptArrowY - 115
	end

	if key == "down" or key == "s" then
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseOnBtn = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
		options.OptArrowY = options.OptArrowY + 115
	end
	------ SELECT BUTTONS ------

	------ ACTIVATE BUTTONS ------
	-- If the arrow is on FPS and return is true then move FPS On & Off arrow
	if key == "return" and options.FPSState == true then
		options.FPSArrowX = options.FPSArrowX + 118
	end

	-- If the arrow is on Mute and return is true then move Mute On & Off arrow
	if key == "return" and options.MuteState == true then
		options.MuteArrowX = options.MuteArrowX + 118
	end

	-- If the arrow is on changelog and return is true then display chnagelog
	if key == "return" and options.ChgState == true then
		Gamestate.push(changelog)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterChg)
	end

	-- If the arrow is on back and return is true then return to the main menu
	if key == "return" and options.BackState == true then
		Gamestate.pop()
		love.audio.play(EnterOpt)
	end

	-- If the arrow is on credits and return is true then display credits
	if key == "return" and options.CrdState == true then
		Gamestate.push(credits)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterCrd)
	end
	------ ACTIVATE BUTTONS ------

	-- Plays audio for FPS On & Off buttons
	if key == "return" and SetFPS == true then
		love.audio.play(options.EnterOpt1)
		love.audio.stop(EnterOpt)
	end

	if key == "return" and SetFPS == false then
		love.audio.play(EnterOpt)
		love.audio.stop(options.EnterOpt1)
	end 
end

function options:draw()
	
	------ FILTERS ------
	options.OptBG:setFilter( 'nearest', 'nearest' )
	options.FPSOn:setFilter( 'nearest', 'nearest' )
	options.FPSOff:setFilter( 'nearest', 'nearest' )
	options.MuteOn:setFilter( 'nearest', 'nearest' )
	options.MuteOff:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(options.OptBG, -2000, -2000)
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.rectangle("fill", options.OptArrowX, options.OptArrowY + 5, 29, 35 )
	love.graphics.rectangle("fill", options.OptArrowX + 381, options.OptArrowY + 5, 29, 35 )
	------ SHAPES ------

	-- Tells Options to use TitleFont
	love.graphics.setFont( options.TitleFont )

	------ TEXT ------
	love.graphics.print('Options', 475, 45)
	------ TEXT ------

	-- Tells Options to use OptFont
	love.graphics.setFont( options.OptFont )

	------ TEXT ------
	love.graphics.print('Display FPS', options.FPSBtnX, options.FPSBtnY)
	love.graphics.print('Changelog', options.ChgBtnX, options.ChgBtnY)
	love.graphics.print('Credits', options.CrdBtnX, options.CrdBtnY)
	love.graphics.print('Mute Audio', options.MuteBtnX, options.MuteBtnY)
	love.graphics.print('Back', options.BackBtnX, options.BackBtnY)
	------ TEXT ------

	-- Puts the fade on the On & Off buttons for FPS
	if SetFPS == true then
		love.graphics.draw(options.FPSOn, 562, 232)
	end

	if SetFPS == false then
		love.graphics.draw(options.FPSOff, 562, 232)
	end

	-- Puts the fade on the On & Off buttons for Mute
	if SetMute == true then
		love.graphics.draw(options.MuteOn, 562, 347)
	end

	if SetMute == false then
		love.graphics.draw(options.MuteOff, 562, 347)
	end
end

return options