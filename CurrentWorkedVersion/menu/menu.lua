-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates menu as a new gamestate
menu = Gamestate.new()

-- Loads game script
game = require 'game'

-- Loads options script
local options = require 'menu/options'


function menu:init()
	

	eggtimer = 0
	colorgoeshere = love.audio.newSource("audio/colorgoeshere.ogg")
	egg = 0
	eggcount = 0

	MenuTimer = 0
	Restart = true
	quitactive = false


	------ VARIABLES ------
	-- Play Button Y & X
	self.PlayBtnY = 392
	self.PlayBtnX = 582
	
	-- Quit Button Y & X
	self.OptBtnY = 482
	self.OptBtnX = 550

	-- Option Button Y & X
	self.QuitBtnY = 582
	self.QuitBtnX = 592
	
	-- Button Selecter Y & X
	self.ArrowY = (self.PlayBtnY)
	self.ArrowX = 480

	-- Backgrounds X and scroll speed
	self.BGx = -2
	self.Scrl = 50

	-- Menus state
	self.PlayState = false
	self.OptState = false
	self.ExitState = false

	-- Mouse button areas
	self.MousePlayArea = false
	self.MouseOptArea = false
	self.MouseQuitArea = false

	-- Mouse detection
	self.MouseDetect = 0
	self.MouseDetect1 = 0
	self.MouseDetect2 = 0
	self.MouseOnBtn = false

	-- Mouse button coords
	self.MousePlayYTop = 390
	self.MousePlayY = 450
	self.MouseQuitY = 560
	self.MouseQuitYTop = 630
	------ VARIABLES ------

	------ IMAGES ------
	self.MenuTitle = love.graphics.newImage("images/menutext.png")
	self.MenuBG = love.graphics.newImage("images/menubg.png")
	------ IMAGES ------

	------ AUDIO ------
	MenuMusic = love.audio.newSource("audio/menumusic.ogg")
	self.Enter = love.audio.newSource("audio/enter.ogg")
	self.Select1 = love.audio.newSource("audio/sel.ogg")
	self.Select2 = love.audio.newSource("audio/sel.ogg")
	self.Select3 = love.audio.newSource("audio/sel.ogg")
	self.Select1M = love.audio.newSource("audio/sel.ogg")
	self.Select2M = love.audio.newSource("audio/sel.ogg")
	self.Select3M = love.audio.newSource("audio/sel.ogg")
	love.audio.play(MenuMusic)
	MenuMusic:setLooping(true)
	------ AUDIO ------

	-- Sets Menu fonts and size
	self.MenuFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.VerFont = love.graphics.newFont("fonts/xen3.ttf", 20)

	-- Set mouse visibility to true
	love.mouse.setVisible(true)
end

function menu:update(dt)
	
	-- MENUSTATES
	if menu.ArrowY == menu.PlayBtnY then
		menu.PlayState = true
		menu.OptState = false
		menu.ExitState = false
		love.audio.stop(menu.Select2)
		love.audio.stop(menu.Select3)
	end

	if menu.ArrowY == menu.QuitBtnY then
		menu.OptState = false
		menu.PlayState = false
		menu.ExitState = true
		love.audio.stop(menu.Select1)
		love.audio.stop(menu.Select3)
	end

	if menu.ArrowY < menu.QuitBtnY and menu.ArrowY > menu.PlayBtnY then
		menu.ArrowY = menu.OptBtnY
		menu.ExitState = false
		menu.PlayState = false
		menu.OptState = true
		love.audio.stop(menu.Select1)
		love.audio.stop(menu.Select2)
	end
	-- MENUSTATES

	-- Anything between the "MENUSATES" comments:
	-- This piece of code is everything that tells the menu what state it is at

	
	-- Makes sure the arrow doesnt go past play or quit
	if menu.ArrowY > menu.QuitBtnY then
		menu.ArrowY = menu.QuitBtnY
	end

	if menu.ArrowY < menu.PlayBtnY then
		menu.ArrowY = menu.PlayBtnY
	end
	
	-- BACKGROUND SCROLL
	menu.BGx = menu.BGx - menu.Scrl * dt

	if menu.BGx <= -5200 then
		menu.Scrl = -65
	end

	if menu.BGx >= 1 then
		menu.Scrl = 150
	end
	-- BACKGROUND SCROLL
	
	-- Anything between the "BACKGROUND SCROLL" comments:
	-- This scrolls the background across the back of the screen


	-- MOUSE AUDIO ONCE
	if menu.MouseOnBtn == false then
		menu.MouseDetect = 0
		menu.MouseDetect1 = 0
		menu.MouseDetect2 = 0
		love.audio.stop(menu.Select1M)
		love.audio.stop(menu.Select2M)
		love.audio.stop(menu.Select3M)
	end

	if menu.MouseDetect == 1 and SetMute == false then
		love.audio.play(menu.Select1M)
		love.audio.stop(menu.Select2M)
		love.audio.stop(menu.Select3M)
	end

	if menu.MouseDetect1 == 1 and SetMute == false then
		love.audio.play(menu.Select2M)
		love.audio.stop(menu.Select1M)
		love.audio.stop(menu.Select3M)
	end

	if menu.MouseDetect2 == 1 and SetMute == false then
		love.audio.play(menu.Select3M)
		love.audio.stop(menu.Select2M)
		love.audio.stop(menu.Select1M)
	end
	-- MOUSE AUDIO ONCE
	
	-- Anything between the "MOUSE AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for Play, Opt and Quit when the mouse is moving between selections


	-- MOUSE OUT OF AREA
	if love.mouse.getX() > (menu.ArrowX + 326) then
		menu.MouseOnBtn = false
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
	end
	
	if love.mouse.getX() < menu.ArrowX then
		menu.MouseOnBtn = false
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
	end
	
	if love.mouse.getY() < menu.MousePlayYTop then
		menu.MouseOnBtn = false
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
	end

	if love.mouse.getY() > menu.MouseQuitYTop then
		menu.MouseOnBtn = false
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
	end
	-- MOUSE OUT OF AREA

	-- Anything between the "MOUSE OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE BUTTON AREAS
	
	-- Mouse area of the quit button
	if love.mouse.getY() > menu.MouseQuitY and love.mouse.getY() < menu.MouseQuitYTop and love.mouse.getX() > menu.ArrowX and love.mouse.getX() < (menu.ArrowX + 326) then
		menu.ArrowY = menu.QuitBtnY
		menu.MouseOnBtn = true
		menu.MouseQuitArea = true
		menu.MousePlayArea = false
		menu.MouseOptArea = false
		menu.MouseDetect = menu.MouseDetect + 1
		menu.MouseDetect1 = 0
		menu.MouseDetect2 = 0
	end

	-- Mouse area of the options button
	if love.mouse.getY() < menu.MouseQuitY and love.mouse.getY() > menu.MousePlayY and love.mouse.getX() > menu.ArrowX and love.mouse.getX() < (menu.ArrowX + 326) then
		menu.ArrowY = menu.OptBtnY
		menu.MouseOnBtn = true
		menu.MouseOptArea = true
		menu.MousePlayArea = false
		menu.MouseQuitArea = false
		menu.MouseDetect1 = menu.MouseDetect1 + 1
		menu.MouseDetect = 0
		menu.MouseDetect2 = 0
	end

	-- Mouse area of the play button
	if love.mouse.getY() < menu.MousePlayY and love.mouse.getY() > menu.MousePlayYTop and love.mouse.getX() > menu.ArrowX and love.mouse.getX() < (menu.ArrowX + 326) then
		menu.ArrowY = menu.PlayBtnY
		menu.MouseOnBtn = true
		menu.MousePlayArea = true
		menu.MouseOptArea = false
		menu.MouseQuitArea = false
		menu.MouseDetect2 = menu.MouseDetect2 + 1
		menu.MouseDetect = 0
		menu.MouseDetect1 = 0
	end
	-- MOUSE BUTTON AREAS

	-- Anything between the "MOUSE BUTTON AREAS" comments:
	-- This tells the menu if the mouse is over a certain button




	if quitactive == true then
		MenuTimer = MenuTimer + dt
		
		menu.PlayState = false
		menu.OptState = false
		menu.ExitState = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
		menu.MouseQuitArea = false
		menu.MouseOnBtn = false
		SetMute = true
	end

	if MenuTimer >= 2 then
		love.event.quit()
	end	



	if egg == true then
		love.audio.play(colorgoeshere)
		colorgoeshere:setLooping(true)
		love.audio.stop(MenuMusic)
		eggtimer = 0
		eggcount = 0
	end

	if egg == false then
		love.audio.stop(colorgoeshere)
	end

	eggtimer = eggtimer + dt

	if eggtimer > 4 then
		eggtimer = 0
		eggcount = 0
	end






end

function menu:mousepressed(mx, my, button)

	------ ACTIVATE BUTTONS ------
	-- Tells menu to continue onto the game script
	if button == "l" and menu.PlayState and menu.MousePlayArea == true then
		





		
		-- play sound effect for enter
		love.audio.play(menu.Enter)
		
		-- Tells the menu script to stack the game script on top of it self
		-- JUST PAUSES FOR NOW
		Gamestate.switch(game)






		paused = false
		egg = false
		




		
		-- Stops menu music and plays game music
		love.audio.play(GameMusic)
		GameMusic:setLooping(true)
		love.audio.stop(MenuMusic)
		love.audio.stop(colorgoeshere)
	end






	-- Tells game to quit
	if button == "l" and menu.ExitState and menu.MouseQuitArea == true then
		quitactive = true
	end






	-- Tells menu to continue onto the options script
	if button == "l" and menu.OptState and menu.MouseOptArea == true then
		
		-- play sound effect for enter
		love.audio.play(menu.Enter)
		
		-- Tells the menu script to stack the options script on top of it self
		-- JUST PAUSES FOR NOW
		Gamestate.push(options)
	end
	------ ACTIVATE BUTTONS ------
end

function menu:keypressed(key)

	-- Move mouse away from button if user tries to use arrows for selection
	if key == "up" and menu.MouseOnBtn == true or key == "w" and menu.MouseOnBtn == true then
		love.mouse.setX(806)
	end

	if key == "down" and menu.MouseOnBtn == true or key == "s" and menu.MouseOnBtn == true then
		love.mouse.setX(806)
	end

	------ SELECT BUTTONS ------
	-- Moves arrow up and down through menu states
	if key == "up" or key == "w" then
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
		menu.MouseOnBtn = false
		love.audio.play(menu.Select1)
		love.audio.play(menu.Select2)
		love.audio.play(menu.Select3)
		menu.ArrowY = menu.ArrowY - 100
	end

	if key == "down" or key == "s" then
		menu.MouseQuitArea = false
		menu.MousePlayArea = false
		menu.MouseOptArea = false
		menu.MouseOnBtn = false
		love.audio.play(menu.Select1)
		love.audio.play(menu.Select2)
		love.audio.play(menu.Select3)
		menu.ArrowY = menu.ArrowY + 100
	end
	------ SELECT BUTTONS ------

	------ ACTIVATE BUTTONS ------
	-- Tells menu to continue onto the game script
	if key == "return" and menu.PlayState == true then
		
		






		-- play sound effect for enter
		love.audio.play(menu.Enter)

		-- Tells the menu script to stack the game script on top of it self
		-- JUST PAUSES FOR NOW
		Gamestate.switch(game)




		egg = false
		paused = false




	
		-- Stops menu music and plays game music
		love.audio.play(GameMusic)
		GameMusic:setLooping(true)
		love.audio.stop(MenuMusic)
		love.audio.stop(colorgoeshere)
	end







	-- Tells game to quit
	if key == "return" and menu.ExitState == true then
		quitactive = true
	end






	-- Tells menu to continue onto the options script
	if key == "return" and menu.OptState == true then
		
		-- play sound effect for enter
		love.audio.play(menu.Enter)

		-- Tells the menu script to stack the options script on top of it self
		-- JUST PAUSES FOR NOW
		Gamestate.push(options)
	end
	------ ACTIVATE BUTTONS ------







	if key == "c" then
		eggcount = eggcount + 1
		eggtimer = 0
	end

	if key == "g" and eggcount == 1 and eggtimer < 2 then
		eggcount = eggcount + 1
	end

	if key == "h" and eggcount == 2 and eggtimer < 4 then
		egg = true
		eggcount = 0
	end








end

function menu:draw()

	------ FILTERS ------
	menu.MenuBG:setFilter( 'nearest', 'nearest' )
	menu.MenuTitle:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	------ IMAGES ------
	love.graphics.draw(menu.MenuBG, menu.BGx, 0, 0, 2.05)
	love.graphics.draw(menu.MenuTitle, 375, 100)
	------ IMAGES ------

	------ SHAPES ------
	love.graphics.rectangle("fill", menu.ArrowX, menu.ArrowY + 5, 29, 35 )
	love.graphics.rectangle("fill", menu.ArrowX + 291, menu.ArrowY + 5, 29, 35 )
	------ SHAPES ------

	-- Tells Menu to use MenuFont
	love.graphics.setFont( menu.MenuFont )

	------ TEXT ------
	love.graphics.print('Play', menu.PlayBtnX, menu.PlayBtnY)
	love.graphics.print('Quit', menu.QuitBtnX, menu.QuitBtnY)
	love.graphics.print('Options', menu.OptBtnX, menu.OptBtnY)

	-- Version text font
	love.graphics.setFont( menu.VerFont )
	
	love.graphics.print('Pre-Alpha 0.2.1', 10, 690)
	------ TEXT ------





	if quitactive == true then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", 0, 0, 1280, 720 )
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.print('See You Space Cowboy...', 1020, 680)
	end




end

return menu