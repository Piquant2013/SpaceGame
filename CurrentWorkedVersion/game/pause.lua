-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates pause as a new gamestate
pause = Gamestate.new()


function pause:init()
  
  	------ VARIABLES ------
  	-- What state the pause menu is in
  	Resume = false

	-- Resume Button Y & X 
	self.ResumeBtnY = 300
	self.ResumeBtnX = 548
 
	-- Main menu Button Y & X  
	self.MainMenuBtnY = 464
	self.MainMenuBtnX = 476

	-- Main menu Button Y & X  
	self.OptionsBtnY = 382
	self.OptionsBtnX = 512
 
	-- Pause menu state  
	self.ResumeState = false
	self.OptionsState = false
	self.MainMenuState = false

	-- Button Selecter Y & X 
	self.ArrowY = (pause.ResumeBtnY)
	self.ArrowX = 450

	-- Mouse button areas
	self.MouseResumeArea = false
	self.MouseOptionsArea = false
	self.MouseMainMenuArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseDetect1 = 0
	self.MouseDetect2 = 0
	self.MouseOnBtn = false

	-- Mouse button coords
	self.MouseResumeYTop = 300
	self.MouseResumeY = 360
	self.MouseOptionsY = 462
	self.MouseMainMenuYTop = 522
	------ VARIABLES ------
  
	------ FONTS ------
	self.PauseFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.TitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
	------ FONTS ------

	------ AUDIO ------
	self.Enter = love.audio.newSource("audio/enter.ogg")
	self.Select1 = love.audio.newSource("audio/sel.ogg")
	self.Select2 = love.audio.newSource("audio/sel.ogg")
	self.Select3 = love.audio.newSource("audio/sel.ogg")
	self.SelectM = love.audio.newSource("audio/sel.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	self.Select2M = love.audio.newSource("audio/sel.ogg")
	PauseMusic = love.audio.newSource("audio/pausemusic.ogg")
	------ AUDIO ------
end

function pause:keypressed(key)

	-- Move mouse away from button if user tries to use arrows for selection
	if key == "up" and pause.MouseOnBtn == true or key == "w" and pause.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 430)
	end

	if key == "down" and pause.MouseOnBtn == true or key == "s" and pause.MouseOnBtn == true then
		love.mouse.setX((love.graphics.getWidth()/2 - 459/2) + 430)
	end

	------ SELECT BUTTONS ------
	-- Moves arrow up and down through pause states
	if key == "up" or key == "w" then
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
		pause.MouseOnBtn = false
		love.audio.play(pause.Select1)
		love.audio.play(pause.Select2)
		love.audio.play(pause.Select3)
		pause.ArrowY = pause.ArrowY - 100
	end

	if key == "down" or key == "s" then
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
		pause.MouseOnBtn = false
		love.audio.play(pause.Select1)
		love.audio.play(pause.Select2)
		love.audio.play(pause.Select3)
		pause.ArrowY = pause.ArrowY + 100
	end
	------ SELECT BUTTONS ------
 
 	------ ACTIVATE BUTTONS ------
	-- Tells pause menu to resume game script
	if key == "return" and pause.ResumeState == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)
		
		-- Changes the pause state
		Resume = true
	end

	if key == "return" and pause.OptionsState == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)
		
		-- Tells the pause menu script to switch to the options script
		Gamestate.push(options)
	end
  
	if key == "return" and pause.MainMenuState == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)

		-- Reset the game
		GameReset = true
		Paused = false
		
		-- Tells the pause menu script to switch to the menu script
		Gamestate.switch(menu)
		
		-- Stops pause menu music and plays menu music
		love.audio.play(MenuMusic)
		MenuMusic:setLooping(true)
		love.audio.stop(PauseMusic)
		love.audio.stop(GameMusic)
	end
	------ ACTIVATE BUTTONS ------

	-- Tells pause menu to resume game script
	if key == 'escape' then
		
		-- Changes the pause state
		Resume = true
	end
end

function pause:mousepressed(mx, my, button)
	
	------ ACTIVATE BUTTONS ------
	-- Tells pause menu to go back to the menu script
	if button == "l" and pause.MainMenuState and pause.MouseMainMenuArea == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)
		
		-- Reset the game
		GameReset = true
		Paused = false
		
		-- Tells the pause menu script to switch to the menu script
		Gamestate.switch(menu)
      
      	-- Stops pause menu music and plays menu music
		love.audio.play(MenuMusic)
		MenuMusic:setLooping(true)
		love.audio.stop(PauseMusic)
		love.audio.stop(GameMusic)
	end

	if button == "l" and pause.OptionsState and pause.MouseOptionsArea == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)
		
		-- Tells the pause menu script to switch to the pause script
		Gamestate.push(options)
	end

	-- Tells pause menu to resume game script
	if button == "l" and pause.ResumeState and pause.MouseResumeArea == true then
		
		-- play sound effect for enter
		love.audio.play(pause.Enter)
		
		-- Changes the pause state
		Resume = true
	end
	------ ACTIVATE BUTTONS ------
end

function pause:update(dt)

	-- Plays pause music on loop and pauses game music
	if Resume == false then
		love.audio.play(PauseMusic)
		PauseMusic:setLooping(true)
		love.audio.pause(GameMusic)
	end

	-- Switches back to the game script
	if Resume == true then
		
		-- Tells the pause menu script to switch to the game script
		Gamestate.switch(game)
		
		-- Sets pause menu to off
		Paused = false
		
		-- Sets cursor back
		love.mouse.setCursor(crosshair)

		-- Stops pause menu music and plays menu music
		love.audio.resume(GameMusic)
		GameMusic:setLooping(true)
		love.audio.stop(PauseMusic)
	end 

	-- PAUSE STATES
	if pause.ArrowY == pause.ResumeBtnY then
		pause.ResumeState = true
		pause.MainMenuState = false
		pause.OptionsState = false
		love.audio.stop(pause.Select1)
		love.audio.stop(pause.Select2)
	end

	if pause.ArrowY == pause.MainMenuBtnY then
		pause.ResumeState = false
		pause.MainMenuState = true
		pause.OptionsState = false
		love.audio.stop(pause.Select1)
		love.audio.stop(pause.Select3)
	end

	if pause.ArrowY < pause.MainMenuBtnY and pause.ArrowY > pause.ResumeBtnY then
		pause.ArrowY = pause.OptionsBtnY
		pause.ResumeState = false
		pause.MainMenuState = false
		pause.OptionsState = true
		love.audio.stop(pause.Select2)
		love.audio.stop(pause.Select3)
	end
	-- PAUSE STATES

	-- Anything between the "PAUSE STATES" comments:
	-- This piece of code is everything that tells the pause menu what state it is at

  
  	-- Makes sure the arrow doesnt go past resume or main menu
	if pause.ArrowY > pause.MainMenuBtnY then
		pause.ArrowY = pause.MainMenuBtnY
	end

	if pause.ArrowY < pause.ResumeBtnY then
		pause.ArrowY = pause.ResumeBtnY
	end

	-- MOUSE AUDIO ONCE
	if pause.MouseOnBtn == false then
		pause.MouseDetect = 0
		pause.MouseDetect1 = 0
		pause.MouseDetect2 = 0
		love.audio.stop(pause.SelectM)
		love.audio.stop(pause.Select2M)
		love.audio.stop(pause.Select1M)
	end

	if pause.MouseDetect == 1 and SetMute == false then
		love.audio.play(pause.SelectM)
		love.audio.stop(pause.Select2M)
		love.audio.stop(pause.Select1M)
	end

	if pause.MouseDetect1 == 1 and SetMute == false then
		love.audio.play(pause.Select1M)
		love.audio.stop(pause.Select2M)
		love.audio.stop(pause.SelectM)
	end

	if pause.MouseDetect2 == 1 and SetMute == false then
		love.audio.stop(pause.Select1M)
		love.audio.play(pause.Select2M)
		love.audio.stop(pause.SelectM)
	end
	-- MOUSE AUDIO ONCE

	-- Anything between the "MOUSE AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for resume and main menu when the mouse is moving between selections


	-- MOUSE OUT OF AREA
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 379/2) + 379) then
		pause.MouseOnBtn = false
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
	end
  
	if love.mouse.getX() < (love.graphics.getWidth()/2 - 379/2) then
		pause.MouseOnBtn = false
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
	end

	if love.mouse.getY() < pause.MouseResumeY then
		pause.MouseOnBtn = false
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
	end

	if love.mouse.getY() > pause.MouseMainMenuYTop then
		pause.MouseOnBtn = false
		pause.MouseMainMenuArea = false
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
	end
  	-- MOUSE OUT OF AREA

	-- Anything between the "MOUSE OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE BUTTON AREAS
	-- Mouse area of the main menu button
	if love.mouse.getY() > pause.MouseOptionsY and love.mouse.getY() < pause.MouseMainMenuYTop and love.mouse.getX() > (love.graphics.getWidth()/2 - 379/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 378/2) + 379) then
		pause.ArrowY = pause.MainMenuBtnY
		pause.MouseOnBtn = true
		pause.MouseMainMenuArea = true
		pause.MouseResumeArea = false
		pause.MouseOptionsArea = false
		pause.MouseDetect = pause.MouseDetect + 1
		pause.MouseDetect1 = 0
		pause.MouseDetect2 = 0
	end

	-- Mouse area of the resume button
	if love.mouse.getY() < pause.MouseOptionsY and love.mouse.getY() > pause.MouseResumeY and love.mouse.getX() > (love.graphics.getWidth()/2 - 379/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 378/2) + 379) then
		pause.ArrowY = pause.OptionsBtnY
		pause.MouseOnBtn = true
		pause.MouseResumeArea = false
		pause.MouseMainMenuArea = false
		pause.MouseOptionsArea = true
		pause.MouseDetect1 = pause.MouseDetect1 + 1
		pause.MouseDetect = 0
		pause.MouseDetect2 = 0
	end

	if love.mouse.getY() < pause.MouseResumeY and love.mouse.getY() > pause.MouseResumeYTop and love.mouse.getX() > (love.graphics.getWidth()/2 - 379/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 378/2) + 379) then
		pause.ArrowY = pause.ResumeBtnY
		pause.MouseOnBtn = true
		pause.MouseResumeArea = true
		pause.MouseMainMenuArea = false
		pause.MouseOptionsArea = false
		pause.MouseDetect2 = pause.MouseDetect2 + 1
		pause.MouseDetect1 = 0
		pause.MouseDetect = 0
	end
	-- MOUSE BUTTON AREAS

	-- Anything between the "MOUSE BUTTON AREAS" comments:
	-- This tells the pause menu if the mouse is over a certain button
end

function pause:draw()
	
	------ FILTERS ------
	pause.PauseFont:setFilter( 'nearest', 'nearest' )
	pause.TitleFont:setFilter( 'nearest', 'nearest' )
	FPSfont:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ SHAPES ------
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 379/2), pause.ArrowY + 5, 29, 35 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 379/2) + 350, pause.ArrowY + 5, 29, 35 )
	------ SHAPES ------

	-- Tells Menu to use PauseFont
	love.graphics.setFont( pause.PauseFont )
	
	------ TEXT ------
	love.graphics.print('Resume', (love.graphics.getWidth()/2 - pause.PauseFont:getWidth( "Resume" )/2), pause.ResumeBtnY)
	love.graphics.print('Options', (love.graphics.getWidth()/2 - pause.PauseFont:getWidth( "Options" )/2), pause.OptionsBtnY)
	love.graphics.print('Main Menu', (love.graphics.getWidth()/2 - pause.PauseFont:getWidth( "Main Menu" )/2), pause.MainMenuBtnY)
	
	-- Title text and font
	love.graphics.setFont( pause.TitleFont )
	love.graphics.print('Paused', (love.graphics.getWidth()/2 - pause.TitleFont:getWidth( "Paused" )/2), 200)
	------ TEXT ------

	-- Draw pause.lua debug
	if SetDeb == true then
		debugmode:pause()
	end
end

return pause