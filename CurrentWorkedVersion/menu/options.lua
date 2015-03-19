-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates options as a new gamestate
options = Gamestate.new()

-- Loads changlog script
changelog = require 'menu/changelog'

-- Loads credits script
credits = require 'menu/credits'




controls = require 'menu/controls'


function options:init()
	







	self.ScreenModeOn = love.graphics.newImage("images/on.png")
	self.ScreenModeOff = love.graphics.newImage("images/off.png")
	self.DebugModeOn = love.graphics.newImage("images/on.png")
	self.DebugModeOff = love.graphics.newImage("images/off.png")
	self.HighDPIOn = love.graphics.newImage("images/on.png")
	self.HighDPIOff = love.graphics.newImage("images/off.png")
	
	self.Select6M = love.audio.newSource("audio/sel.ogg")
	self.Select7M = love.audio.newSource("audio/sel.ogg")
	self.Select8M = love.audio.newSource("audio/sel.ogg")
	self.Select9M = love.audio.newSource("audio/sel.ogg")

	self.Select6 = love.audio.newSource("audio/sel.ogg")
	self.Select7 = love.audio.newSource("audio/sel.ogg")
	self.Select8 = love.audio.newSource("audio/sel.ogg")
	self.Select9 = love.audio.newSource("audio/sel.ogg")

	self.Select10 = love.audio.newSource("audio/sel.ogg")
	self.Select11 = love.audio.newSource("audio/sel.ogg")

	self.EnterOpt2 = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt2a = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt3 = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt3a = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt4 = love.audio.newSource("audio/enter.ogg")
	self.EnterOpt4a = love.audio.newSource("audio/enter.ogg")

	self.WinState = false
	self.DebState = false
	self.HighState = false
	self.ConState = false


	self.WinBtnY = 182
	self.WinBtnX = 492

	self.DebBtnY = 297
	self.DebBtnX = 502

	self.HighBtnY = 412
	self.HighBtnX = 507

	self.ConBtnY = 527
	self.ConBtnX = 550


	self.MouseWinArea = false
	self.MouseDebArea = false
	self.MouseHighArea = false
	self.MouseConArea = false


	self.WinY = 162
	self.DebY = 277
	self.HighY = 392
	self.ConY = 497


	self.WinArrowY = 232
	self.WinArrowX = 665

	self.DebArrowY = 347
	self.DebArrowX = 665

	self.HighArrowY = 462
	self.HighArrowX = 665

	rightside = false







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
	self.EnterOpt1a = love.audio.newSource("audio/enter.ogg")
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
	self.OptArrowX = (love.graphics.getWidth()/2 - 459/2)

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
	self.MouseChgArea = false
	self.MouseCrdArea = false
	self.MouseBackArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseDetect1 = 0
	self.MouseDetect2 = 0
	self.MouseDetect3 = 0
	self.MouseDetect4 = 0
	self.MouseDetect5 = 0
	self.MouseDetect6 = 0
	self.MouseDetect7 = 0
	self.MouseDetect8 = 0
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
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY == options.BackBtnY then
		options.MuteState = false
		options.FPSState = false
		options.ChgState = false
		options.CrdState = false
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = true
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY < options.BackBtnY and options.OptArrowY > options.ChgBtnY then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = true
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY < options.CrdBtnY and options.OptArrowY > options.MuteBtnY then
		options.ChgState = true
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY < options.ChgBtnY and options.OptArrowY > options.FPSBtnY then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = true
		options.CrdState = false
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY == options.WinBtnY and rightside == true then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.WinState = true
		options.DebState = false
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY < options.BackBtnY and options.OptArrowY > options.HighBtnY and rightside == true then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.WinState = false
		options.DebState = false
		options.HighState = false
		options.ConState = true
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select8)
		love.audio.stop(options.Select9)
	end
	
	if options.OptArrowY < options.ConBtnY and options.OptArrowY > options.DebBtnY and rightside == true then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.WinState = false
		options.DebState = false
		options.HighState = true
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select9)
	end

	if options.OptArrowY < options.HighBtnY and options.OptArrowY > options.WinBtnY and rightside == true then
		options.ChgState = false
		options.FPSState = false
		options.MuteState = false
		options.CrdState = false
		options.WinState = false
		options.DebState = true
		options.HighState = false
		options.ConState = false
		options.BackState = false
		love.audio.stop(options.Select1)
		love.audio.stop(options.Select2)
		love.audio.stop(options.Select3)
		love.audio.stop(options.Select4)
		love.audio.stop(options.Select5)
		love.audio.stop(options.Select6)
		love.audio.stop(options.Select7)
		love.audio.stop(options.Select8)
	end

	-- OPTION MENU STATES

	-- Anything between the "OPTION MENU STATES" comments:
	-- This piece of code is everything that tells the menu what state it is at

























	-- Makes sure the arrow doesnt go past back
	if options.OptArrowY > 527 then
		options.OptArrowY = options.BackBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 250
	end

	if options.OptArrowY < 642 and options.OptArrowX == (love.graphics.getWidth()/2 - 459/2) + 250 then
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) or (love.graphics.getWidth()/2 - 459/2) + 500
	end

	-- Makes sure the arrow doesnt go past FPS
	if options.OptArrowY < 182 then
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
	end

	-- Sets Mute to On
	if options.MuteArrowX == options.MuteBtnX then	
		SetMute = true
	end

	if options.WinArrowX > options.WinBtnX then
		options.WinArrowX = options.WinBtnX - 118
	end

	if options.WinArrowX == options.WinBtnX - 118 then
		Win = false
	end

	if options.WinArrowX == options.WinBtnX then	
		Win = true
	end

	if options.DebArrowX > options.DebBtnX then
		options.DebArrowX = options.DebBtnX - 118
	end

	if options.DebArrowX == options.DebBtnX - 118 then
		Deb = false
	end

	if options.DebArrowX == options.DebBtnX then	
		Deb = true
	end

	if options.HighArrowX > options.HighBtnX then
		options.HighArrowX = options.HighBtnX - 118
	end

	if options.HighArrowX == options.HighBtnX - 118 then
		High = false
	end

	if options.HighArrowX == options.HighBtnX then	
		High = true
	end














	-- MOUSE AUDIO ONCE
	if options.MouseOnBtn == false then
		options.MouseDetect = 0
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect == 1 and SetMute == false then
		love.audio.play(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect1 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.play(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)

	end

	if options.MouseDetect2 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.play(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect3 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.play(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect4 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.play(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect5 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.play(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect6 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.play(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect7 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.play(options.Select8M)
		love.audio.stop(options.Select9M)
	end

	if options.MouseDetect8 == 1 and SetMute == false then
		love.audio.stop(options.Select1M)
		love.audio.stop(options.Select2M)
		love.audio.stop(options.Select3M)
		love.audio.stop(options.Select4M)
		love.audio.stop(options.Select5M)
		love.audio.stop(options.Select6M)
		love.audio.stop(options.Select7M)
		love.audio.stop(options.Select8M)
		love.audio.play(options.Select9M)
	end
	-- MOUSE AUDIO ONCE

	-- Anything between the "MOUSE AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for each selection when the mouse is moving between selections

	
	-- MOUSE OUT OF AREA
	if love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) - 250 then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
	end

	if love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) + 250 then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
	end

	if love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
	end

	if love.mouse.getY() < 162 then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
	end

	if love.mouse.getY() > options.MouseBackYTop then
		options.MouseOnBtn = false
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
	end
	-- MOUSE OUT OF AREA

	-- Anything between the "MOUSE OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE BUTTON AREAS
	
	-- Mouse area of the FPS button
	if love.mouse.getY() > options.MouseFPSY and love.mouse.getY() < options.MouseMuteY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) - 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) - 250 then
		options.OptArrowY = options.FPSBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2)
		options.MouseOnBtn = true
		options.MouseFPSArea = true
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect = options.MouseDetect + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = false
	end

	-- Mouse area of the mute button
	if love.mouse.getY() > options.MouseMuteY and love.mouse.getY() < options.MouseChgY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) - 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) - 250 then
		options.OptArrowY = options.MuteBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2)
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = true
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect1 = options.MouseDetect1 + 1
		options.MouseDetect = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = false
	end

	-- Mouse area of the change button
	if love.mouse.getY() > options.MouseChgY and love.mouse.getY() < options.MouseCrdY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) - 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) - 250 then
		options.OptArrowY = options.ChgBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2)
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = true
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect2 = options.MouseDetect2 + 1
		options.MouseDetect = 0
		options.MouseDetect1 = 0
		options.MouseDetect3 = 0
		options.MouseDetect4 = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = false
	end

	-- Mouse area of the credits button
	if love.mouse.getY() > options.MouseCrdY and love.mouse.getY() < options.MouseBackY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) - 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) - 250 then
		options.OptArrowY = options.CrdBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2)
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = true
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect3 = options.MouseDetect3 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect = 0
		options.MouseDetect4 = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = false
	end

	-- Mouse area of the windowed button
	if love.mouse.getY() > options.WinY and love.mouse.getY() < options.DebY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) + 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) + 250 then
		options.OptArrowY = options.WinBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 500
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = true
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect5 = options.MouseDetect5 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = true
	end

	-- Mouse area of the debug mode button
	if love.mouse.getY() > options.DebY and love.mouse.getY() < options.HighY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) + 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) + 250 then
		options.OptArrowY = options.DebBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 500
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = true
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect6 = options.MouseDetect6 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
		options.MouseDetect5 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = true
	end

	-- Mouse area of the highdpi button
	if love.mouse.getY() > options.HighY and love.mouse.getY() < options.ConY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) + 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) + 250 then
		options.OptArrowY = options.HighBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 500
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = true
		options.MouseConArea = false
		options.MouseDetect7 = options.MouseDetect7 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect8 = 0
		rightside = true
	end

	-- Mouse area of the contorls button
	if love.mouse.getY() > options.ConY and love.mouse.getY() < options.MouseBackY and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) + 250 and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) + 250 then
		options.OptArrowY = options.ConBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 500
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = true
		options.MouseDetect8 = options.MouseDetect8 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		rightside = true
	end

	-- Mouse area of the back button
	if love.mouse.getY() > options.MouseBackY and love.mouse.getY() < options.MouseBackYTop and love.mouse.getX() > (love.graphics.getWidth()/2 - 459/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 459/2) + 459) then
		options.OptArrowY = options.BackBtnY
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 250
		options.MouseOnBtn = true
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = true
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseDetect4 = options.MouseDetect4 + 1
		options.MouseDetect1 = 0
		options.MouseDetect2 = 0
		options.MouseDetect3 = 0
		options.MouseDetect = 0
		options.MouseDetect5 = 0
		options.MouseDetect6 = 0
		options.MouseDetect7 = 0
		options.MouseDetect8 = 0
		rightside = false
	end
	-- MOUSE BUTTON AREAS

	-- Anything between the "MOUSE BUTTON AREAS" comments:
	-- This tells the menu if the mouse is over a certain button
end

























































function options:mousepressed(mx, my, button)

	------ ACTIVATE BUTTONS ------
	-- If the mouse is on FPS and return is true then move FPS On & Off arrow
	if button == "l" and options.FPSState and options.MouseFPSArea == true then
		options.FPSArrowX = options.FPSArrowX + 118
	end

	-- If the mouse is on Mute and return is true then move Mute On & Off arrow
	if button == "l" and options.MuteState and options.MouseMuteArea == true then
		options.MuteArrowX = options.MuteArrowX + 118
	end








	if button == "l" and options.WinState and options.MouseWinArea == true then
		options.WinArrowX = options.WinArrowX + 118
	end

	if button == "l" and options.DebState and options.MouseDebArea == true then
		options.DebArrowX = options.DebArrowX + 118
	end

	if button == "l" and options.HighState and options.MouseHighArea == true then
		options.HighArrowX = options.HighArrowX + 118
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
		OptionsSelected = false
	end

	-- If the mouse is on credits and return is true then display credits
	if button == "l" and options.CrdState and options.MouseCrdArea == true then
		Gamestate.push(credits)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterCrd)
	end









	if button == "l" and options.ConState and options.MouseConArea == true then
		Gamestate.push(controls)
		love.audio.play(EnterOpt)
	end








	------ ACTIVATE BUTTONS ------

	-- Plays audio for FPS On & Off buttons
	if button == "l" and SetFPS and options.MouseFPSArea == true then
		love.audio.play(options.EnterOpt1)
		love.audio.stop(options.EnterOpt1a)
	end

	if button == "l" and SetFPS == false and options.MouseFPSArea == true then
		love.audio.play(options.EnterOpt1a)
		love.audio.stop(options.EnterOpt1)
	end 







	if button == "l" and Win and options.MouseWinArea == true then
		love.audio.play(options.EnterOpt2)
		love.audio.stop(options.EnterOpt2a)
	end

	if button == "l" and Win == false and options.MouseWinArea == true then
		love.audio.play(options.EnterOpt2a)
		love.audio.stop(options.EnterOpt2)
	end

	if button == "l" and Deb and options.MouseDebArea == true then
		love.audio.play(options.EnterOpt3a)
		love.audio.stop(options.EnterOpt3)
	end

	if button == "l" and Deb == false and options.MouseDebArea == true then
		love.audio.play(options.EnterOpt3)
		love.audio.stop(options.EnterOpt3a)
	end

	if button == "l" and High and options.MouseHighArea == true then
		love.audio.play(options.EnterOpt4a)
		love.audio.stop(options.EnterOpt4)
	end

	if button == "l" and High == false and options.MouseHighArea == true then
		love.audio.play(options.EnterOpt4)
		love.audio.stop(options.EnterOpt4a)
	end






end

function options:keypressed(key)
	
	-- Move mouse away from button if user tries to use arrows for selection
	if key == "up" and options.MouseOnBtn == true or key == "w" and options.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
	end

	if key == "down" and options.MouseOnBtn == true or key == "s" and options.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
	end

	if key == "left" and options.MouseOnBtn == true or key == "a" and options.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
	end

	if key == "right" and options.MouseOnBtn == true or key == "d" and options.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 800)
	end

	------ SELECT BUTTONS ------
	-- Moves arrow up and down through option menu states
	if key == "up" or key == "w" then
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseOnBtn = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
		love.audio.play(options.Select6)
		love.audio.play(options.Select7)
		love.audio.play(options.Select8)
		love.audio.play(options.Select9)
		options.OptArrowY = options.OptArrowY - 115
	end

	if key == "down" or key == "s" then
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseOnBtn = false
		love.audio.play(options.Select1)
		love.audio.play(options.Select2)
		love.audio.play(options.Select3)
		love.audio.play(options.Select4)
		love.audio.play(options.Select5)
		love.audio.play(options.Select6)
		love.audio.play(options.Select7)
		love.audio.play(options.Select8)
		love.audio.play(options.Select9)
		options.OptArrowY = options.OptArrowY + 115
	end








	if key == "left" and rightside == true or key == "a" and rightside == true then
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2)
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseOnBtn = false
		rightside = false
		love.audio.play(options.Select10)
		love.audio.stop(options.Select11)
	end

	if key == "right" or key == "d" then
		options.OptArrowX = (love.graphics.getWidth()/2 - 459/2) + 500
		options.MouseFPSArea = false
		options.MouseMuteArea = false
		options.MouseChgArea = false
		options.MouseCrdArea = false
		options.MouseBackArea = false
		options.MouseWinArea = false
		options.MouseDebArea = false
		options.MouseHighArea = false
		options.MouseConArea = false
		options.MouseOnBtn = false
		rightside = true
		love.audio.stop(options.Select10)
		love.audio.play(options.Select11)
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








	if key == "return" and options.WinState == true then
		options.WinArrowX = options.WinArrowX + 118
	end

	if key == "return" and options.DebState == true then
		options.DebArrowX = options.DebArrowX + 118
	end

	if key == "return" and options.HighState == true then
		options.HighArrowX = options.HighArrowX + 118
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
		OptionsSelected = false
	end

	-- If the arrow is on credits and return is true then display credits
	if key == "return" and options.CrdState == true then
		Gamestate.push(credits)
		love.audio.play(EnterOpt)
		love.audio.stop(EnterCrd)
	end





	if key == "return" and options.ConState == true then
		Gamestate.push(controls)
		love.audio.play(EnterOpt)
	end





	------ ACTIVATE BUTTONS ------

	-- Plays audio for FPS On & Off buttons
	if key == "return" and SetFPS == true then
		love.audio.play(options.EnterOpt1)
		love.audio.stop(options.EnterOpt1a)
	end

	if key == "return" and SetFPS == false then
		love.audio.play(options.EnterOpt1a)
		love.audio.stop(options.EnterOpt1)
	end 





	if key == "return" and Win == true then
		love.audio.play(options.EnterOpt2)
		love.audio.stop(options.EnterOpt2a)
	end

	if key == "return" and Win == false then
		love.audio.play(options.EnterOpt2a)
		love.audio.stop(options.EnterOpt2)
	end

	if key == "return" and Deb == true then
		love.audio.play(options.EnterOpt3)
		love.audio.stop(options.EnterOpt3a)
	end

	if key == "return" and Deb == false then
		love.audio.play(options.EnterOpt3a)
		love.audio.stop(options.EnterOpt3)
	end

	if key == "return" and High == true then
		love.audio.play(options.EnterOpt4)
		love.audio.stop(options.EnterOpt4a)
	end

	if key == "return" and High == false then
		love.audio.play(options.EnterOpt4a)
		love.audio.stop(options.EnterOpt4)
	end 






end

function options:draw()
	
	------ FILTERS ------
	options.OptBG:setFilter( 'nearest', 'nearest' )
	options.FPSOn:setFilter( 'nearest', 'nearest' )
	options.FPSOff:setFilter( 'nearest', 'nearest' )
	options.MuteOn:setFilter( 'nearest', 'nearest' )
	options.MuteOff:setFilter( 'nearest', 'nearest' )

	options.ScreenModeOn:setFilter( 'nearest', 'nearest' )
	options.ScreenModeOff:setFilter( 'nearest', 'nearest' )
	options.DebugModeOn:setFilter( 'nearest', 'nearest' )
	options.DebugModeOff:setFilter( 'nearest', 'nearest' )
	options.HighDPIOn:setFilter( 'nearest', 'nearest' )
	options.HighDPIOff:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGES ------
	love.graphics.draw(options.OptBG, -2000, -2000, 0, 2.05)
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.rectangle("fill", options.OptArrowX - 250, options.OptArrowY + 5, 29, 35 )
	love.graphics.rectangle("fill", (options.OptArrowX + 430) - 250, options.OptArrowY + 5, 29, 35 )
	------ SHAPES ------

	-- Tells Options to use TitleFont
	love.graphics.setFont( options.TitleFont )

	------ TEXT ------
	love.graphics.print('Options', (love.graphics.getWidth()/2 - options.TitleFont:getWidth( "Options" )/2), 45)
	------ TEXT ------

	-- Tells Options to use OptFont
	love.graphics.setFont( options.OptFont )

	------ TEXT ------
	love.graphics.print('Display FPS', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Display FPS" )/2) -250, options.FPSBtnY)
	love.graphics.print('Changelog', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Changelog" )/2)-250, options.ChgBtnY)
	love.graphics.print('Credits', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Credits" )/2)-250, options.CrdBtnY)
	love.graphics.print('Mute Audio', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Mute Audio" )/2)-250, options.MuteBtnY)
	




	love.graphics.print('Windowed Mode', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Windowed Mode" )/2) +250, options.WinBtnY)
	love.graphics.print('Window Lock', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Window Lock" )/2)+250, options.HighBtnY)
	love.graphics.print('Controls', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Controls" )/2)+250, options.ConBtnY)
	love.graphics.print('Debug Mode', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Debug Mode" )/2)+250, options.DebBtnY)




	love.graphics.print('Back', (love.graphics.getWidth()/2 - options.OptFont:getWidth( "Back" )/2), options.BackBtnY)
	------ TEXT ------

	-- Puts the fade on the On & Off buttons for FPS
	if SetFPS == true then
		love.graphics.draw(options.FPSOn, (love.graphics.getWidth()/2 - options.FPSOn:getWidth()/2) - 250, 232)
	end

	if SetFPS == false then
		love.graphics.draw(options.FPSOff, (love.graphics.getWidth()/2 - options.FPSOff:getWidth()/2) - 250, 232)
	end

	-- Puts the fade on the On & Off buttons for Mute
	if SetMute == true then
		love.graphics.draw(options.MuteOn, (love.graphics.getWidth()/2 - options.MuteOn:getWidth()/2) - 250, 347)
	end

	if SetMute == false then
		love.graphics.draw(options.MuteOff, (love.graphics.getWidth()/2 - options.MuteOff:getWidth()/2) - 250, 347)
	end















	if Win == false then
		love.graphics.draw(options.ScreenModeOn, (love.graphics.getWidth()/2 - options.ScreenModeOn:getWidth()/2) + 250, 232)
	end

	if Win == true then
		love.graphics.draw(options.ScreenModeOff, (love.graphics.getWidth()/2 - options.ScreenModeOff:getWidth()/2) + 250, 232)
	end

	if Deb == true then
		love.graphics.draw(options.DebugModeOn, (love.graphics.getWidth()/2 - options.DebugModeOn:getWidth()/2) + 250, 347)
	end

	if Deb == false then
		love.graphics.draw(options.DebugModeOff, (love.graphics.getWidth()/2 - options.DebugModeOff:getWidth()/2) + 250, 347)
	end

	if High == true then
		love.graphics.draw(options.HighDPIOn, (love.graphics.getWidth()/2 - options.HighDPIOn:getWidth()/2) + 250, 462)
	end

	if High == false then
		love.graphics.draw(options.HighDPIOff, (love.graphics.getWidth()/2 - options.HighDPIOff:getWidth()/2) + 250, 462)
	end













	if Deb == true then
		
		-- Print all of the options vars for when debug mode is active

		-- Font, boxes, color
		love.graphics.setFont( FPSfont )
		love.graphics.setColor(0,0,0,160)
		love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 330, 455)
		love.graphics.rectangle("fill", 330, love.graphics.getHeight( ) - 240, 650, 240)		
		love.graphics.setColor(255,255,255,160)

		-- Box 1
		love.graphics.print("Options", 5, love.graphics.getHeight( ) - 435)
		love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 415)
		love.graphics.print("options.WinState: "..tostring(options.WinState), 5, love.graphics.getHeight( ) - 395)
		love.graphics.print("options.DebState: "..tostring(options.DebState), 5, love.graphics.getHeight( ) - 375)
		love.graphics.print("options.HighState: "..tostring(options.HighState), 5, love.graphics.getHeight( ) - 355)
		love.graphics.print("options.ConState: "..tostring(options.ConState), 5, love.graphics.getHeight( ) - 335)
		love.graphics.print("options.MouseWinArea: "..tostring(options.MouseWinArea), 5, love.graphics.getHeight( ) - 315)
		love.graphics.print("options.MouseDebArea: "..tostring(options.MouseDebArea), 5, love.graphics.getHeight( ) - 295)
		love.graphics.print("options.MouseHighArea: "..tostring(options.MouseHighArea), 5, love.graphics.getHeight( ) - 275)
		love.graphics.print("options.MouseConArea: "..tostring(options.MouseConArea), 5, love.graphics.getHeight( ) - 255)
		love.graphics.print("options.WinArrowY: "..tostring(options.WinArrowY), 5, love.graphics.getHeight( ) - 235)
		love.graphics.print("options.WinArrowX: "..tostring(options.WinArrowX), 5, love.graphics.getHeight( ) - 215)
		love.graphics.print("options.DebArrowY: "..tostring(options.DebArrowY), 5, love.graphics.getHeight( ) - 195)
		love.graphics.print("options.DebArrowX: "..tostring(options.DebArrowX), 5, love.graphics.getHeight( ) - 175)
		love.graphics.print("options.HighArrowY: "..tostring(options.HighArrowY), 5, love.graphics.getHeight( ) - 155)
		love.graphics.print("options.HighArrowX: "..tostring(options.HighArrowX), 5, love.graphics.getHeight( ) - 135)
		love.graphics.print("options.FPSState: "..tostring(options.FPSState), 5, love.graphics.getHeight( ) - 115)
		love.graphics.print("options.MuteState: "..tostring(options.MuteState), 5, love.graphics.getHeight( ) - 95)
		love.graphics.print("options.ChgState: "..tostring(options.ChgState), 5, love.graphics.getHeight( ) - 75)
		love.graphics.print("options.CrdState: "..tostring(options.CrdState), 5, love.graphics.getHeight( ) - 55)
		love.graphics.print("options.BackState: "..tostring(options.BackState), 5, love.graphics.getHeight( ) - 35)
		
		-- Box 2
		love.graphics.print("options.OptArrowY: "..tostring(options.OptArrowY), 335, love.graphics.getHeight( ) - 215)
		love.graphics.print("options.OptArrowX: "..tostring(options.OptArrowX), 335, love.graphics.getHeight( ) - 195)
		love.graphics.print("options.FPSArrowY: "..tostring(options.FPSArrowY), 335, love.graphics.getHeight( ) - 175)
		love.graphics.print("options.FPSArrowX: "..tostring(options.FPSArrowX), 335, love.graphics.getHeight( ) - 155)
		love.graphics.print("options.MuteArrowY: "..tostring(options.MuteArrowY), 335, love.graphics.getHeight( ) - 135)
		love.graphics.print("options.MuteArrowX: "..tostring(options.MuteArrowX), 335, love.graphics.getHeight( ) - 115)
		love.graphics.print("options.MouseMuteArea: "..tostring(options.MouseMuteArea), 335, love.graphics.getHeight( ) - 95)
		love.graphics.print("options.MouseChgArea: "..tostring(options.MouseChgArea), 335, love.graphics.getHeight( ) - 75)
		love.graphics.print("options.MouseCrdArea: "..tostring(options.MouseCrdArea), 335, love.graphics.getHeight( ) - 55)
		love.graphics.print("options.MouseBackArea: "..tostring(options.MouseBackArea), 335, love.graphics.getHeight( ) - 35)
		
		-- Box 3
		love.graphics.print("options.MouseDetect: "..tostring(options.MouseDetect), 675, love.graphics.getHeight( ) - 215)
		love.graphics.print("options.MouseDetect1: "..tostring(options.MouseDetect1), 675, love.graphics.getHeight( ) - 195)
		love.graphics.print("options.MouseDetect2: "..tostring(options.MouseDetect2), 675, love.graphics.getHeight( ) - 175)
		love.graphics.print("options.MouseDetect3: "..tostring(options.MouseDetect3), 675, love.graphics.getHeight( ) - 155)
		love.graphics.print("options.MouseDetect4: "..tostring(options.MouseDetect4), 675, love.graphics.getHeight( ) - 135)
		love.graphics.print("options.MouseDetect5: "..tostring(options.MouseDetect5), 675, love.graphics.getHeight( ) - 115)
		love.graphics.print("options.MouseDetect6: "..tostring(options.MouseDetect6), 675, love.graphics.getHeight( ) - 95)
		love.graphics.print("options.MouseDetect7: "..tostring(options.MouseDetect7), 675, love.graphics.getHeight( ) - 75)
		love.graphics.print("options.MouseDetect8: "..tostring(options.MouseDetect8), 675, love.graphics.getHeight( ) - 55)
		love.graphics.print("options.MouseOnBtn: "..tostring(options.MouseOnBtn), 675, love.graphics.getHeight( ) - 35)
		
		love.graphics.setColor(255,255,255,255)
	end
end

return options