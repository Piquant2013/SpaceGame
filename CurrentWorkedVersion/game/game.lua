-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Loads camera script
local camera = require "libs/hump/camera"

-- Loads Hardon Collider script
local HC = require 'libs/hardoncollider'

-- Loads pause script
pause = require 'game/menus/pause'

-- Loads player script
player = require 'game/player'

-- Loads crpistol script
crpistol = require 'game/weapons/crpistol'

-- Creates game as a new gamestate
game = Gamestate.new()


function game:init()

	------ VARIABLES ------
	-- Set up hardon collider
	Collider = HC(100, on_collision, collision_stop)

	-- Load player, pistol, etc vars
    player:initialize()
    crpistol:initialize()

    -- gamemodes
    self.endless = false
	
	-- Camera
	self.Cam = camera(plyr.x, plyr.y, 2.5)

	-- Flashing text vars
	self.flashbutton = true
	self.buttonflash = 0

	-- white flash
	self.fade = 100
	------ VARIABLES ------

	------ AUDIO ------
	self.music1 = love.audio.newSource("audio/music/game.ogg")
	self.music2 = love.audio.newSource("audio/music/credits.ogg")
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.pickupsound = love.audio.newSource("audio/weapons/pickup.ogg")
	------ AUDIO ------
end

function playercollision(dt, shape_a, shape_b, mtv_x, mtv_y)

	local other

	-- Set soild objects for player
    if shape_a == plyr.bb then
        
        -- set to shape	
        other = shape_b

        if gameover == false then
        	
        	-- if player hits wall
        	if other == endless.wallT or other == endless.wallB or other == endless.wallL or other == endless.wallR then
        		plyr.yvel = 0
        		plyr.xvel = 0
        		shape_a:move(mtv_x, mtv_y)
        		plyr.y = plyr.y + mtv_y
        		plyr.x = plyr.x + mtv_x
      		end

      		-- If player hits tree
      		if other == endless.tree1 or other == endless.tree2 or other == endless.tree3 or other == endless.tree4 then
        		plyr.yvel = 0
        		plyr.xvel = 0
        		shape_a:move(mtv_x, mtv_y)
        		plyr.y = plyr.y + mtv_y
        		plyr.x = plyr.x + mtv_x
      		end
      	end
    
    elseif shape_b == plyr.bb then
        
        -- set to shape	
        other = shape_a
       	
       	if gameover == false then
       		
       		-- if player hits wall
       		if other == endless.wallT or other == endless.wallB or other == endless.wallL or other == endless.wallR then
       			plyr.yvel = 0
        		plyr.xvel = 0
       			shape_b:move(-mtv_x, -mtv_y)
       			plyr.y = plyr.y + -mtv_y
        		plyr.x = plyr.x + -mtv_x
    		end

    		-- If player hits tree
    		if other == endless.tree1 or other == endless.tree2 or other == endless.tree3 or other == endless.tree4 then
       			plyr.yvel = 0
        		plyr.xvel = 0
       			shape_b:move(-mtv_x, -mtv_y)
       			plyr.y = plyr.y + -mtv_y
        		plyr.x = plyr.x + -mtv_x
    		end
    	end
    
    else
        return
    end
end

function playercollisionstopped(dt, shape_a, shape_b)

	-- Set player hitbox to a shape
	local other

    if shape_a == plyr.bb then
        other = shape_b
    elseif shape_b == plyr.bb then
        other = shape_a
    else
        return
    end

    -- stop player from getting hurt when not hitting zombies
	plyr.hurt = false
end

function on_collision(dt, shape_a, shape_b, mtv_x, mtv_y)
	playercollision(dt, shape_a, shape_b, mtv_x, mtv_y)
end

function collision_stop(dt, shape_a, shape_b, mtv_x, mtv_y)
	playercollisionstopped(dt, shape_a, shape_b)
end

function game:keypressed(key)

	-- dissmiss the welcome message for endless mode
  	if key == "return" and welcomescreen == true and self.endless == true or key == " " and welcomescreen == true and self.endless == true then
  		welcomescreen = false
  		setendless = false
  		love.audio.play(self.entersound)
		love.audio.play(self.music1)
		self.music1:setVolume(1.0)
		self.music1:setLooping(true)
  	end

  	-- Pause the game
  	if key == "escape" and paused == false and welcomescreen == false and gameover == false then
   		paused = true
   		resume = false
   		love.mouse.setCursor(cursor)
   		self.fade = 100
  	end
end

function game:mousepressed(mx, my, button)

	-- dissmiss the welcome message for endless mode
  	if button == "l" and welcomescreen == true and self.endless == true then
  		welcomescreen = false
  		setendless = false
  		love.audio.play(self.entersound)
		love.audio.play(self.music1)
		self.music1:setVolume(1.0)
		self.music1:setLooping(true)
  	end
end

function game:update(dt)

	-- CAMERA --
	-- set up camera
	dx,dy = (plyr.x) - self.Cam.x, (plyr.y) - self.Cam.y
	mx1,my1 = self.Cam:mousepos()
	self.Cam:move(dx/2, dy/2)

	-- Zoom camera in when gameover but make sure it stays default when not
    if gameover == true then
		self.Cam:zoomTo(5)
	elseif gameover == false then
		self.Cam:zoomTo(3.2)
	end
	-- CAMERA --

	-- FLASH WHITE --
	self.fade = self.fade + dt - 2

	if self.fade < 0 then
		self.fade = 0
	end
	-- FLASH WHITE --

	-- add to the the crpistol bullet to players group
	for i, o in ipairs(crpistol.bullets) do
		Collider:addToGroup("players", o.bb)
	end

	-- Update player, pistol, hardon collider, etc
	player:update(dt)
	player:health(dt)
	Collider:update(dt)

    -- if game is paused switch to the pause screen
	if paused == true then
		Gamestate.push(pause)
	end
end

function love.focus(f)
	
	-- pause the game if window loses focus
	if not f then
		if paused == false and welcomescreen == false and game.endless == true or game.stuck == true and gameover == false then  
			paused = true
			resume = false
   			love.mouse.setCursor(cursor)
   			self.fade = 100
   		end 
	end
end

function game:draw()
	
	------ FILTERS ------
	start.font1:setFilter( 'nearest', 'nearest' )
	start.font2:setFilter( 'nearest', 'nearest' )
	start.font3:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ TEXT ------
	-- draw the welcome text and background for endless mode
	 if welcomescreen == true and self.endless == true then
    	
    	love.graphics.draw(start.bg, 0, -1000, 0, 3)
    	love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", (love.graphics.getWidth()/2 - 904/2), (love.graphics.getHeight()/2 - 304/2), 904, 304 )
		love.graphics.setColor(0, 0, 0, 100)
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 900/2), (love.graphics.getHeight()/2 - 300/2), 900, 300 )
		love.graphics.setColor(255, 255, 255, 255)
    	love.mouse.setCursor(cursor)
    	love.graphics.setFont( start.font3 )
		love.graphics.print("WELCOME! THANK YOU FOR TAKING THE TIME", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) - 120)
		love.graphics.print("TO TEST PIQUANT INTERACTIVE'S PROJECT,", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) - 80)
		love.graphics.print("SPACE GAME. HAVE FUN AND PLEASE ENJOY!", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) - 40)
		love.graphics.setFont( start.font2 )
		love.graphics.print("LEAVE ANY FEEDBACK", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) + 40)
		love.graphics.print("YOU MAY HAVE AT", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) + 70)
		love.graphics.print("[REDDIT.COM/R/PIQUANT2013/]", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) + 100)
		love.graphics.print("AS WE LOVE PLAYER INTERACTION.", (love.graphics.getWidth()/2 - start.font3:getWidth("WELCOME! THANK YOU FOR TAKING THE TIME")/2), (love.graphics.getHeight()/2 - 40/2) + 130)
		love.graphics.setFont( start.font8 )
		love.graphics.print("CONTINUE", (love.graphics.getWidth()/2 + 125), (love.graphics.getHeight()/2 - 40/2) + 40)
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 + 125), (love.graphics.getHeight()/2 - 40/2 + 70 + 40), start.font8:getWidth("CONTINUE"), 10 )
		love.graphics.setColor(255, 255, 255)
	end
	------ TEXT ------

	------ SHAPES ------
	-- White Flash
	love.graphics.setColor(255, 255, 255, self.fade)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------
end

return game