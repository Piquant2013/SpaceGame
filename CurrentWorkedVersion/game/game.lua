-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Loads Hardon Collider script
local HC = require 'vendors/hardoncollider'

-- Loads camera script
local camera = require "vendors/camera"

-- Creates game as a new gamestate
game = Gamestate.new()

-- Loads pause script
pause = require 'game/pause'


--function on_collision(dt, shape_a, shape_b, shape_c)
--end

--function collision_stop(dt, shape_a, shape_b, shape_c)
--end

function game:init()
	------ VARIABLES ------
	
	--- PLAYER ---
	-- Player postion and movement
	self.PlayerY = 400
	self.PlayerX = 800
	self.PlayerMovementStop = false
	
	-- Player sprint
	self.Tired = false
	self.TiredTime = 0 
	self.Sprint = false
	self.PlayerSpeed = 70
	self.SprintTime = 0
	
	-- If players hit
	self.PlayerHit1 = false
	self.PlayerHit2 = false
	self.PlayerHit3 = false
	self.PlayerHit4 = false
	self.PlayerHit5 = false
	self.PlayerHit6 = false
	self.PlayerHit7 = false
	self.PlayerHit8 = false
	self.PlayerHit9 = false
	
	-- Player health
	self.PlayerHealth = 100
	self.HealthX = 107
	self.HealthY = 7
	--- PLAYER ---

	--- GUN ---
	-- Bullet
	self.ShotTime = 0
	self.ShotTimePlus = 0
	self.Bullets = { }
	self.GunShot = false
	self.GunShot1 = false
	
	-- Gun postions
	self.GunY = self.PlayerY
	self.GunX = self.PlayerX
	self.HaveGun = false
	self.GunItemX = 750
	self.GunItemY = 380
	--- GUN ---

	--- SHIP ---
	-- Ship postion
	self.ShipX = 456
	self.ShipY = 490
	
	-- Ship boost
	self.BoostTired = false
	self.BoostTiredTime = 0 
	self.Boost = false
	self.BoostTime = 0
	
	-- If ship hit
	self.ShipHit = false
	self.ShipHit1 = false
	self.ShipHit2 = false
	self.ShipHit3 = false
	self.ShipHit4 = false
	self.ShipHit5 = false
	self.ShipHit6 = false
	self.ShipHit7 = false
	self.ShipHit8 = false
	self.ShipHit9 = false
	
	-- Ship health
	self.ShipHealthX = 215
	self.ShipHealthY = 7
	self.ShipHealth = 200
	
	-- Ship states
	self.InShip = false
	self.ShipYes = false
	self.ShipYours = false
	self.ExitShip = false
	self.ShipDead = false
	--- SHIP ---

	--- ROCK ---
	-- Rock postions with a random x and y number
	self.RockX1 = love.math.random(-0, 2000)
	self.RockY1 = love.math.random(-0, 2000)
	self.RockX2 = love.math.random(-0, 2000)
	self.RockY2 = love.math.random(-0, 2000)
	self.RockX3 = love.math.random(-0, 2000)
	self.RockY3 = love.math.random(-0, 2000)
	self.RockX4 = love.math.random(-0, 2000)
	self.RockY4 = love.math.random(-0, 2000)
	self.RockX5 = love.math.random(-0, 2000)
	self.RockY5 = love.math.random(-0, 2000)
	self.RockX6 = love.math.random(-0, 2000)
	self.RockY6 = love.math.random(-0, 2000)
	self.RockX7 = love.math.random(-0, 2000)
	self.RockY7 = love.math.random(-0, 2000)
	self.RockX8 = love.math.random(-0, 2000)
	self.RockY8 = love.math.random(-0, 2000)
	self.RockX9 = love.math.random(-0, 2000)
	self.RockY9 = love.math.random(-0, 2000)
	
	-- Rock health
	self.RockHealth1 = 10
	self.RockHealth2 = 10
	self.RockHealth3 = 10
	self.RockHealth4 = 10
	self.RockHealth5 = 10
	self.RockHealth6 = 10
	self.RockHealth7 = 10
	self.RockHealth8 = 10
	self.RockHealth9 = 10
	
	-- If rocks are hit
	self.RockHit1 = false
	self.RockHit2 = false
	self.RockHit3 = false
	self.RockHit4 = false
	self.RockHit5 = false
	self.RockHit6 = false
	self.RockHit7 = false
	self.RockHit8 = false
	self.RockHit9 = false

	-- If rocks are dead
	self.RockDead1 = false
	self.RockDead2 = false
	self.RockDead3 = false
	self.RockDead4 = false
	self.RockDead5 = false
	self.RockDead6 = false
	self.RockDead7 = false
	self.RockDead8 = false
	self.RockDead9 = false
	--- ROCK ---

	-- Camera and zoom vars
	self.Cam = camera(self.PlayerX, self.PlayerY, 2.5)
	self.ZoomCam = false

	-- Other vars
	Paused = false
	
	-- Button and arrow areas
	self.BtnY = 440	
	self.BtnX = 530
	self.ArrowX = 480

	-- Welcome message vars
	self.WelcomeButtonArea = false
	self.WelcomeMouseDetect = 0
	self.WelcomeMouseOnBtn = false
	self.Welcome = true

	-- GameOver vars
	self.GameOver = false
	self.GameOverMouseBackArea = false
	self.GameOverMouseDetect = 0
	self.GameOverMouseOnBtn = false
	self.GameOverArrowX = 450
	------ VARIABLES ------

	------ IMAGES ------
	self.GameBG = love.graphics.newImage("images/largespacebg.png")
	self.Player = love.graphics.newImage("images/man.png")
	self.Shot = love.graphics.newImage("images/shot.png")
	self.GunInv = love.graphics.newImage("images/gunitem.png")
	self.Gun = love.graphics.newImage("images/gun.png")
	self.GunItem = love.graphics.newImage("images/gunitem.png")
	self.Ship = love.graphics.newImage("images/ship1.png")
	self.Rock1 = love.graphics.newImage("images/rock.png")
	self.Rock2 = love.graphics.newImage("images/rock.png")
	self.Rock3 = love.graphics.newImage("images/rock.png")
	self.Rock4 = love.graphics.newImage("images/rock.png")
	self.Rock5 = love.graphics.newImage("images/rock.png")
	self.Rock6 = love.graphics.newImage("images/rock.png")
	self.Rock7 = love.graphics.newImage("images/rock.png")
	self.Rock8 = love.graphics.newImage("images/rock.png")
	self.Rock9 = love.graphics.newImage("images/rock.png")
	------ IMAGES ------

	------ AUDIO ------
	GameMusic = love.audio.newSource("audio/gamemusic.ogg")
	self.GunSound = love.audio.newSource("audio/gun.ogg")
	self.GunSound1 = love.audio.newSource("audio/gun.ogg")
	self.BoostSound = love.audio.newSource("audio/boost.ogg")
	self.ThrustSound = love.audio.newSource("audio/thrust.ogg")
	self.IdleSound = love.audio.newSource("audio/idle.ogg")
	self.GameSelect1M = love.audio.newSource("audio/sel.ogg")
	self.GameEnter = love.audio.newSource("audio/enter.ogg")
	------ AUDIO ------

	------ FONTS ------
	self.InteractFont = love.graphics.newFont("fonts/xen3.ttf", 10)
	self.BtnFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	self.GameOverText = love.graphics.newFont("fonts/xen3.ttf", 40)
	self.GameOverTitleFont = love.graphics.newFont("fonts/xen3.ttf", 90)
	self.WelcomeFont = love.graphics.newFont("fonts/xen3.ttf", 20)
	------ FONTS ------

	------ COLLISION BoxES ------
	self.Collider = HC(300, on_collision , collision_stop)
	self.BulletHitBox = self.Collider:addRectangle(self.PlayerX, self.PlayerY, 2, 2)
	self.ShipHitBox = self.Collider:addRectangle(self.ShipX,self.ShipY,78,48)
	self.PlayerHitBox = self.Collider:addRectangle(self.PlayerX, self.PlayerY,16,16)
	self.ShipHitBox1 = self.Collider:addRectangle(self.ShipX,self.ShipY,78,48)
	self.RockHitBox1 = self.Collider:addRectangle(self.RockX1,self.RockY1,22,22)
	self.RockHitBox2 = self.Collider:addRectangle(self.RockX2,self.RockY2,22,22)
	self.RockHitBox3 = self.Collider:addRectangle(self.RockX3,self.RockY3,22,22)
	self.RockHitBox4 = self.Collider:addRectangle(self.RockX4,self.RockY4,22,22)
	self.RockHitBox5 = self.Collider:addRectangle(self.RockX5,self.RockY5,22,22)
	self.RockHitBox6 = self.Collider:addRectangle(self.RockX6,self.RockY6,22,22)
	self.RockHitBox7 = self.Collider:addRectangle(self.RockX7,self.RockY7,22,22)
	self.RockHitBox8 = self.Collider:addRectangle(self.RockX8,self.RockY8,22,22)
	self.RockHitBox9 = self.Collider:addRectangle(self.RockX9,self.RockY9,22,22)
	self.GunItemHitBox = self.Collider:addRectangle(self.GunItemX, self.GunItemY,24,24)
	------ COLLISION BOXES ------
end

function game:keypressed(key)

  	if key == "return" and game.Welcome == true then
  		
  		-- turn game reset off
  		GameReset = false
  		
  		-- turn welcome screen off
  		game.Welcome = false
  		
  		-- play sound effect for enter
  		love.audio.play(game.GameEnter)
  	end

  	if key == "return" and game.GameOver == true then
  		
  		-- play sound effect for enter
  		love.audio.play(game.GameEnter)
    	
  		-- Tells the game script to switch to the menu script
    	Gamestate.switch(menu)
    	
    	-- Stops game music and plays menu music
    	love.audio.play(MenuMusic)
    	MenuMusic:setLooping(true)
   		love.audio.stop(GameMusic)
    	
   		-- Reset the game
    	GameReset = true
  	end

  	-- Pause the game
  	if key == "escape" and Paused == false and game.Welcome == false then
   		Paused = true
   		Resume = false
   		love.mouse.setCursor(cursor)
  	end

  	-- Zoom game camera in by 1
    if key == "x" and game.ZoomCam == false and game.GameOver == false then
		game.Cam:zoom(2)
		game.ZoomCam = true
	end

	-- Zoom game camera back to default
	if key == "z" and game.ZoomCam == true and game.GameOver == false then
		game.Cam:zoom(0.5)
		game.ZoomCam = false
	end

	-- If you are near the ship and you push "e" enter the ship
	if key == "e" and game.ShipYes == true then
		game.InShip = true
		game.ShipYours = true
		
		-- change cursor back to pointer
		love.mouse.setCursor(cursor)
	end

	-- If you are in the ship and you push "e" exit the ship
	if key == "e" and game.InShip == true and game.ExitShip == true then
		game.InShip = false
		game.ExitShip = false
		
		-- change cursor back to pointer
		love.mouse.setCursor(cursor)
		
		-- Stop all ship sounds
		love.audio.stop(game.IdleSound)
		love.audio.stop(game.ThrustSound)
		love.audio.stop(game.BoostSound)
	end

	-- If you are near the gun and you push "e" pick up the gun
	if key == "e" and game.GunYes == true then
		game.HaveGun = true
	end

	-- If you have the gun and you push "q" then drop the gun
	if key == "q" and game.HaveGun == true and game.GunDown == true and game.InShip == false then
		game.HaveGun = false
		game.GunDown = false
	end
end

function game:mousepressed(mx, my, button)

	------ GUN ------
	if button == "l" and game.ShotTime <= 0 and game.InShip == false and game.HaveGun == true then
		
		-- The bullet direction
		game.Direction = math.atan2(my1 - game.GunY, mx1 - game.GunX)
		
		-- shot bullet when left click
		table.insert(game.Bullets, {
			x = game.GunX,
			y = game.GunY,
			Dir = game.Direction,
			Speed = 400
		})
		
		-- Reset shot timer
		game.ShotTime = game.ShotTimePlus
	end

	-- Gun Sounds
	if button == "l" and game.GunShot == true and game.Welcome == false and game.GameOver == false and game.InShip == false and game.HaveGun == true then
		love.audio.play(game.GunSound)
		love.audio.stop(game.GunSound1)
		game.GunShot1 = false
	end

	-- Gun Sounds
	if button == "l" and game.GunShot1 == false and game.Welcome == false and game.GameOver == false and game.InShip == false and game.HaveGun == true then
		love.audio.play(game.GunSound1)
		love.audio.stop(game.GunSound)
		game.GunShot = true
	end
	------ GUN ------

	------ WELCOME AND GAMEOVER BUTTONS ------
	-- Tells welcome to continue onto the game
	if button == "l" and game.WelcomeButtonArea == true and game.Welcome == true then
		
		-- turn game reset off
		GameReset = false
  		
  		-- turn welcome screen off
  		game.Welcome = false
  		
  		-- play sound effect for enter
  		love.audio.play(game.GameEnter)
  	end

  	-- Tells game to continue onto the main menu
  	if button == "l" and game.GameOverMouseBackArea == true and game.GameOver == true then
		
		-- play sound effect for enter
		love.audio.play(game.GameEnter)
    	
    	-- Tells the game script to switch to the menu script
    	Gamestate.switch(menu)
    	
    	-- Stops game music and plays menu music
    	love.audio.play(MenuMusic)
    	MenuMusic:setLooping(true)
   		love.audio.stop(GameMusic)
    	
    	-- Reset the game
    	GameReset = true
  	end
  	------ WELCOME AND GAMEOVER BUTTONS ------
end

function game:update(dt)

	------ CAMERA ------
	dx,dy = (game.PlayerX) - game.Cam.x, (game.PlayerY) - game.Cam.y
	game.Cam:move(dx/2, dy/2)
	mx1,my1 = game.Cam:mousepos()
	------ CAMERA ------

	------ PLAYER ------
	if love.keyboard.isDown("a") and game.InShip == false and game.PlayerMovementStop == false then
		
		-- Move the player left
		game.PlayerX = game.PlayerX - game.PlayerSpeed * dt
		
		-- If the player has the gun it follows the player
		game.GunX = game.GunX - game.PlayerSpeed * dt
		game.GunX = game.PlayerX
		game.GunY = game.PlayerY
    end

	if love.keyboard.isDown("d") and game.InShip == false and game.PlayerMovementStop == false then
		
		-- Move the player right
		game.PlayerX = game.PlayerX + game.PlayerSpeed * dt
		
		-- If the player has the gun it follows the player
		game.GunX = game.GunX + game.PlayerSpeed * dt
		game.GunX = game.PlayerX
		game.GunY = game.PlayerY
    end

	if love.keyboard.isDown("w") and game.InShip == false and game.PlayerMovementStop == false then
		
		-- Move the player up
		game.PlayerY = game.PlayerY - game.PlayerSpeed * dt
		
		-- If the player has the gun it follows the player
		game.GunY = game.GunY - game.PlayerSpeed * dt
		game.GunY = game.PlayerY
		game.GunX = game.PlayerX
    end

	if love.keyboard.isDown("s") and game.InShip == false and game.PlayerMovementStop == false then
		
		-- Move the player down
		game.PlayerY = game.PlayerY + game.PlayerSpeed * dt
		
		-- If the player has the gun it follows the player
		game.GunY = game.GunY + game.PlayerSpeed * dt
		game.GunY = game.PlayerY
		game.GunX = game.PlayerX
    end

	-- Player rotation with the mouse pointer
	game.PlayerRot = math.atan2(mx1 - game.PlayerX, game.PlayerY - my1) - math.pi / 2

	-- Start sprint timer
    game.SprintTime = game.SprintTime + dt

    -- If holding shift then player sprints
    if love.keyboard.isDown("lshift") and game.InShip == false and game.PlayerMovementStop == false then
		
		-- Set player speed
		game.PlayerSpeed = 130
		
		-- Sprint is enabled
		game.Sprint = true
    end

    -- If not holding down shift then dont sprint
    if not love.keyboard.isDown("lshift") and game.InShip == false and game.PlayerMovementStop == false then
		
    	-- Set player speed
		game.PlayerSpeed = 70
		
		-- Sprint is enabled
		game.Sprint = false
    end

    -- If you have been sprinting for over 5 seconds then sprinting false
    if game.Sprint == true and game.SprintTime > 5 and game.InShip == false then
    	game.Tired = true
    	game.PlayerSpeed = 70
    end

    -- Reset the sprint timer if your not sprinting
    if game.Sprint == false then
    	game.SprintTime = 0
    end

    -- If your tired and you stop sprinting start the tried timer
    if game.Tired == true and game.Sprint == false and game.InShip == false then
    	game.PlayerSpeed = 70
    	game.TiredTime = game.TiredTime + dt
    	game.SprintTime = 0
    end

    -- If the tired timer goes over 1.7 seconds tired turns off and you can sprint again
    if game.TiredTime > 1.7 then
    	game.Tired = false
    	game.TiredTime = 0
    end

    -- Resets timers and set player back to default speed
    if game.Tired == true and game.Sprint == true and game.InShip == false then
    	game.PlayerSpeed = 70
    	game.SprintTime = 0
    	game.TiredTime = 0
    end
    ------ PLAYER ------

	------ GUN ------
	-- Shot time
	game.ShotTime = math.max(0, game.ShotTime - dt)
	 	
	for i, o in ipairs(game.Bullets) do
		
		-- Set bullet speed, rotation and postion
		o.x = o.x + math.cos(o.Dir) * o.Speed * dt
		o.y = o.y + math.sin(o.Dir) * o.Speed * dt
		
		if (o.x > (game.PlayerX + love.graphics.getWidth()) or (o.x < (game.PlayerX - love.graphics.getWidth()))) or (o.y > (game.PlayerY + love.graphics.getHeight()) or (o.y < (game.PlayerY - love.graphics.getHeight()))) then
			
			-- if the bullet goes off screen undraw it and move the bullet hit box (Temporally) to 4000, 4000
			table.remove(game.Bullets, i)
			game.BulletHitBox:moveTo(4000, 4000)
		end
	end
	------ GUN ------

	------ BULLET AND ROCK HIT BOXES ------
	if game.BulletHitBox:collidesWith(game.RockHitBox1) and game.RockDead1 == false then
		game.RockHit1 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox1) then
    	game.RockHit1 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox2) and game.RockDead2 == false then
		game.RockHit2 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox2) then
    	game.RockHit2 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox3) and game.RockDead3 == false then
		game.RockHit3 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox3) then
    	game.RockHit3 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox4) and game.RockDead4 == false then
		game.RockHit4 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox4) then
    	game.RockHit4 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox5) and game.RockDead5 == false then
		game.RockHit5 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox5) then
    	game.RockHit5 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox6) and game.RockDead6 == false then
		game.RockHit6 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox6) then
    	game.RockHit6 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox7) and game.RockDead7 == false then
		game.RockHit7 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox7) then
    	game.RockHit7 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox8) and game.RockDead8 == false then
		game.RockHit8 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox8) then
    	game.RockHit8 = false
	end

	if game.BulletHitBox:collidesWith(game.RockHitBox9) and game.RockDead9 == false then
		game.RockHit9 = true
    elseif not game.BulletHitBox:collidesWith(game.RockHitBox9) then
    	game.RockHit9 = false
	end
	------ BULLET AND ROCK HIT BOXES ------

	------ PLAYER AND ROCK HIT BOXES ------
	if game.PlayerHitBox:collidesWith(game.RockHitBox1) and game.InShip == false and game.RockDead1 == false then
    	game.PlayerHit1 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox1) then
    	game.PlayerHit1 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox2) and game.InShip == false and game.RockDead2 == false then
    	game.PlayerHit2 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox2) then
    	game.PlayerHit2 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox3) and game.InShip == false and game.RockDead3 == false then
    	game.PlayerHit3 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox3) then
    	game.PlayerHit3 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox4) and game.InShip == false and game.RockDead4 == false then
    	game.PlayerHit4 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox4) then
    	game.PlayerHit4 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox5) and game.InShip == false and game.RockDead5 == false then
    	game.PlayerHit5 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox5) then
    	game.PlayerHit5 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox6) and game.InShip == false and game.RockDead6 == false then
    	game.PlayerHit6 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox6) then
    	game.PlayerHit6 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox7) and game.InShip == false and game.RockDead7 == false then
    	game.PlayerHit7 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox7) then
    	game.PlayerHit7 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox8) and game.InShip == false and game.RockDead8 == false then
    	game.PlayerHit8 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox8) then
    	game.PlayerHit8 = false
	end

	if game.PlayerHitBox:collidesWith(game.RockHitBox9) and game.InShip == false and game.RockDead9 == false then
    	game.PlayerHit9 = true
	elseif not game.PlayerHitBox:collidesWith(game.RockHitBox9) then
    	game.PlayerHit9 = false
	end
	------ PLAYER AND ROCK HIT BOXES ------

	------ SHIP AND ROCK HIT BOXES ------
	if game.ShipHitBox:collidesWith(game.RockHitBox1) and game.ShipHealth > 0 and game.RockDead1 == false then
    	game.ShipHit = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox1) then
    	game.ShipHit = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox2) and game.ShipHealth > 0 and game.RockDead2 == false then
    	game.ShipHit2 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox2) then
    	game.ShipHit2 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox3) and game.ShipHealth > 0 and game.RockDead3 == false then
    	game.ShipHit3 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox3) then
    	game.ShipHit3 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox4) and game.ShipHealth > 0 and game.RockDead4 == false then
    	game.ShipHit4 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox4) then
    	game.ShipHit4 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox5) and game.ShipHealth > 0 and game.RockDead5 == false then
    	game.ShipHit5 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox5) then
    	game.ShipHit5 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox6) and game.ShipHealth > 0 and game.RockDead6 == false then
    	game.ShipHit6 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox6) then
    	game.ShipHit6 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox7) and game.ShipHealth > 0 and game.RockDead7 == false then
    	game.ShipHit7 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox7) then
    	game.ShipHit7 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox8) and game.ShipHealth > 0 and game.RockDead8 == false then
    	game.ShipHit8 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox8) then
    	game.ShipHit8 = false
	end

	if game.ShipHitBox:collidesWith(game.RockHitBox9) and game.ShipHealth > 0 and game.RockDead9 == false then
    	game.ShipHit9 = true
	elseif not game.ShipHitBox:collidesWith(game.RockHitBox9) then
    	game.ShipHit9 = false
	end
	------ SHIP AND ROCK HIT BOXES ------
	
	-- If the player hits the ship enable getting in
    if game.PlayerHitBox:collidesWith(game.ShipHitBox) then
    	game.ShipYes = true
	elseif not game.PlayerHitBox:collidesWith(game.ShipHitBox) then
    	game.ShipYes = false
	end

	-- If the ship is hit by a bullet damage it
	if game.BulletHitBox:collidesWith(game.ShipHitBox1) then
    	game.ShipHit1 = true
	elseif not game.BulletHitBox:collidesWith(game.ShipHitBox1) then
    	game.ShipHit1 = false
   	end

   	-- If the player hits the gun then enable picking it up
   	if game.PlayerHitBox:collidesWith(game.GunItemHitBox) then
    	game.GunYes = true
	elseif not game.PlayerHitBox:collidesWith(game.GunItemHitBox) then
    	game.GunYes = false
	end

	if game.HaveGun == true then
		
		-- gun follows the player
		game.GunX = game.PlayerX
    	game.GunY = game.PlayerY
    	
    	-- gun item follows the player
    	game.GunItemX = game.PlayerX
    	game.GunItemY = game.PlayerY
    	
    	-- enable putting the gun down
    	game.GunDown = true
    end

    if game.HaveGun == true and Paused == false then
		
		-- If you have the gun then change the cursor to the crosshair
		love.mouse.setCursor(crosshair)
	elseif game.HaveGun == false and Paused == false then
		
		-- If you dont have the gun then set the cursor to the pointer
		love.mouse.setCursor(cursor)
	end

	if game.InShip == true and Paused == false then
		
		-- If your in the ship set the cursor to the pointer
		love.mouse.setCursor(cursor)
	elseif game.InShip == false and game.HaveGun == true and Paused == false then
		
		-- If your not in the ship and have the gun then set the cursor to crosshair
		love.mouse.setCursor(crosshair)
	end

	------ PLAYER HEALTH ------
	if game.PlayerHit1 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit2 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit3 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit4 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit5 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit6 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit7 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit8 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end

	if game.PlayerHit9 == true and game.GameOver == false then
		game.PlayerHealth = game.PlayerHealth - 1
		game.HealthX = game.HealthX - 58 * dt
	end
	------ PLAYER HEALTH ------

	-- Anything between the "PLAYER HEALTH" comments:
	-- If the player is hit move the player health down by 1 also move the health bar across 


	------ SHIP HEALTH ------
	if game.ShipHit1 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit2 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit3 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit4 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit5 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit6 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit7 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit8 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end

	if game.ShipHit9 == true and game.ShipDead == false then
		game.ShipHealth = game.ShipHealth - 1
		game.ShipHealthX = game.ShipHealthX - 30 * dt
	end
	------ SHIP HEALTH ------

	-- Anything between the "SHIP HEALTH" comments:
	-- If the ship is hit move the ship health down by 1 also move the health bar across 


	------ ROCK HEALTH ------
	if game.RockHit1 == true then
		game.RockHealth1 = game.RockHealth1 - 1
	end

	if game.RockHit2 == true then
		game.RockHealth2 = game.RockHealth2 - 1
	end

	if game.RockHit3 == true then
		game.RockHealth3 = game.RockHealth3 - 1
	end

	if game.RockHit4 == true then
		game.RockHealth4 = game.RockHealth4 - 1
	end

	if game.RockHit5 == true then
		game.RockHealth5 = game.RockHealth5 - 1
	end

	if game.RockHit6 == true then
		game.RockHealth6 = game.RockHealth6 - 1
	end

	if game.RockHit7 == true then
		game.RockHealth7 = game.RockHealth7 - 1
	end

	if game.RockHit8 == true then
		game.RockHealth8 = game.RockHealth8 - 1
	end

	if game.RockHit9 == true then
		game.RockHealth9 = game.RockHealth9 - 1
	end
	------ ROCK HEALTH ------

	-- Anything between the "ROCK HEALTH" comments:
	-- If the rock is hit move the rock health down by 1
	

	------ ROCK DEAD ------ 
	if game.RockHealth1 == 0 then
		game.RockDead1 = true
	end

	if game.RockHealth2 == 0 then
		game.RockDead2 = true
	end

	if game.RockHealth3 == 0 then
		game.RockDead3 = true
	end

	if game.RockHealth4 == 0 then
		game.RockDead4 = true
	end

	if game.RockHealth5 == 0 then
		game.RockDead5 = true
	end

	if game.RockHealth6 == 0 then
		game.RockDead6 = true
	end

	if game.RockHealth7 == 0 then
		game.RockDead7 = true
	end

	if game.RockHealth8 == 0 then
		game.RockDead8 = true
	end

	if game.RockHealth9 == 0 then
		game.RockDead9 = true
	end
	------ ROCK DEAD ------

	-- Anything between the "ROCK DEAD" comments:
	-- If the rock health reaches 0 then rocks are dead


	-- If the player health reaches 0 then game over
	if game.PlayerHealth == 0 then
		game.GameOver = true
	end

	-- If the ship health reaches 0 then ship is dead
	if game.ShipHealth == 0 then
		game.ShipDead = true
	end
	
	if game.ShipDead == true then
		
		-- Set the postion for when the ship dies to its current postion and lock it
		game.ShipX = game.ShipX + math.cos(game.ShipDir) * 10 * dt
		game.ShipY = game.ShipY + math.sin(game.ShipDir) * 10 * dt
	end

	-- If your in ship and its dead stop all the audio and set player and gun to the ship
  	if game.InShip == true and game.ShipDead == true and Paused == false then
  		game.ExitShip = true
  		game.PlayerX = game.ShipX
    	game.PlayerY = game.ShipY
    	game.GunX = game.ShipX
    	game.GunY = game.ShipY
    	love.audio.stop(game.IdleSound)
    	love.audio.stop(game.ThrustSound)
		love.audio.stop(game.BoostSound)
  	end
	
	-- If your in ship play idle audio and set player and gun to the ship
	if game.InShip == true and game.ShipHealth > 0 and Paused == false then
		game.PlayerX = game.ShipX
    	game.PlayerY = game.ShipY
    	game.GunX = game.ShipX
    	game.GunY = game.ShipY
    	game.ExitShip = true
    	love.audio.play(game.IdleSound)
    end

    -- If your not in the ship stop audio
    if game.InShip == false then
    	love.audio.stop(game.IdleSound)
    end

    -- Move ship direction with the mouse
    if game.ShipHealth > 0 then
		game.ShipDir = math.atan2(my1 - game.PlayerY, mx1 - game.PlayerX)
	end

	if love.keyboard.isDown("w") and game.InShip == true and game.ShipHealth > 0 and Paused == false then
		
		-- Move ship
		game.ShipX = game.ShipX + math.cos(game.ShipDir) * game.PlayerSpeed * dt
		game.ShipY = game.ShipY + math.sin(game.ShipDir) * game.PlayerSpeed * dt
		
		-- Set ship speed
		game.PlayerSpeed = 350
		
		-- Play thrust sound
		love.audio.play(game.ThrustSound)
	end

	if not love.keyboard.isDown("w") and game.InShip == true and game.ShipHealth > 0 then
		
		-- Stop audio if your not moving
		love.audio.stop(game.ThrustSound)
		love.audio.stop(game.BoostSound)
	end

	if love.keyboard.isDown("s") and game.InShip == true and not love.keyboard.isDown("w") and game.ShipHealth > 0 then
		
		-- Move ship
		game.ShipX = game.ShipX - math.cos(game.ShipDir) * game.PlayerSpeed * dt
		game.ShipY = game.ShipY - math.sin(game.ShipDir) * game.PlayerSpeed * dt
		
		-- set ship speed to slower in reverse
		game.PlayerSpeed = 100
		
		-- stop trust sound in reverse
		love.audio.stop(game.ThrustSound)
	end
	
	-- Start boost timer
    game.BoostTime = game.BoostTime + dt

    -- If holding shift and in ship then ship boosts
    if love.keyboard.isDown("lshift") and game.InShip == true and not love.keyboard.isDown("s") and game.ShipHealth > 0 and love.keyboard.isDown("w") and Paused == false then
		
    	-- Set ship speed
		game.PlayerSpeed = 600
		
		-- Boost is enabled
		game.Boost = true
		
		-- play boost sound effect
		love.audio.play(game.BoostSound)
    end

     -- If not holding down shift and in ship then dont boost
    if not love.keyboard.isDown("lshift") and game.InShip == true and not love.keyboard.isDown("s") and game.ShipHealth > 0 and love.keyboard.isDown("w") and Paused == false then
		
    	-- Sprint is enabled
		game.Boost = false
		
		-- stop boost sound effect
		love.audio.stop(game.BoostSound)
    end

    -- If you have been boosting for over 5 seconds then boosting false
    if game.Boost == true and game.BoostTime > 5 and game.InShip == true and game.ShipHealth > 0 then
    	game.BoostTired = true
    	game.PlayerSpeed = 350
    end

    -- Reset the boost timer if your not boosting
    if game.Boost == false and game.InShip == true and game.ShipHealth > 0 then
    	game.BoostTime = 0
    end

    -- If your tired and you stop boosting start the tried timer
    if game.BoostTired == true and game.Boost == false and game.InShip == true and game.ShipHealth > 0 then
    	game.PlayerSpeed = 350
    	game.BoostTiredTime = game.BoostTiredTime + dt
    	game.BoostTime = 0
    end

    -- If the tired timer goes over 1.7 seconds tired turns off and you can boost again
    if game.BoostTiredTime > 1.7 and game.InShip == true and game.ShipHealth > 0 then
    	game.BoostTired = false
    	game.BoostTiredTime = 0
    end

     -- Resets timers and set ship back to default speed
    if game.BoostTired == true and game.Boost == true and game.InShip == true and game.ShipHealth > 0 then
    	game.PlayerSpeed = 350
    	game.BoostTime = 0
    	game.BoostTiredTime = 0
    	love.audio.stop(game.BoostSound)
    end

    -- Update collisions
    game.Collider:update(dt)

    -- if game is paused switch to the pause screen
	if Paused == true then
		Gamestate.switch(pause)
		
		-- Stop the ship idle sound for when you go to pause screen
		love.audio.stop(game.IdleSound)
	end 

	-- Reset the game back to default for when you start a new game
	if GameReset == true then
	




		PlaySelected = false




		------ VARIABLES ------
	
		--- PLAYER ---
		-- Player postion and movement
		self.PlayerY = 400
		self.PlayerX = 800
		self.PlayerMovementStop = false
	
		-- Player sprint
		self.Tired = false
		self.TiredTime = 0 
		self.Sprint = false
		self.PlayerSpeed = 70
		self.SprintTime = 0
	
		-- If players hit
		self.PlayerHit1 = false
		self.PlayerHit2 = false
		self.PlayerHit3 = false
		self.PlayerHit4 = false
		self.PlayerHit5 = false
		self.PlayerHit6 = false
		self.PlayerHit7 = false
		self.PlayerHit8 = false
		self.PlayerHit9 = false
	
		-- Player health
		self.PlayerHealth = 100
		self.HealthX = 107
		self.HealthY = 7
		--- PLAYER ---

		--- GUN ---
		-- Bullet
		self.ShotTime = 0
		self.ShotTimePlus = 0
		self.Bullets = { }
		self.GunShot = false
		self.GunShot1 = false
	
		-- Gun postions
		self.GunY = self.PlayerY
		self.GunX = self.PlayerX
		self.HaveGun = false
		self.GunItemX = 750
		self.GunItemY = 380
		--- GUN ---

		--- SHIP ---
		-- Ship postion
		self.ShipX = 456
		self.ShipY = 490
	
		-- Ship boost
		self.BoostTired = false
		self.BoostTiredTime = 0 
		self.Boost = false
		self.BoostTime = 0
	
		-- If ship hit
		self.ShipHit = false
		self.ShipHit1 = false
		self.ShipHit2 = false
		self.ShipHit3 = false
		self.ShipHit4 = false
		self.ShipHit5 = false
		self.ShipHit6 = false
		self.ShipHit7 = false
		self.ShipHit8 = false
		self.ShipHit9 = false
	
		-- Ship health
		self.ShipHealthX = 215
		self.ShipHealthY = 7
		self.ShipHealth = 200
	
		-- Ship states
		self.InShip = false
		self.ShipYes = false
		self.ShipYours = false
		self.ExitShip = false
		self.ShipDead = false
		--- SHIP ---

		--- ROCK ---
		-- Rock postions with a random x and y number
		self.RockX1 = love.math.random(-0, 2000)
		self.RockY1 = love.math.random(-0, 2000)
		self.RockX2 = love.math.random(-0, 2000)
		self.RockY2 = love.math.random(-0, 2000)
		self.RockX3 = love.math.random(-0, 2000)
		self.RockY3 = love.math.random(-0, 2000)
		self.RockX4 = love.math.random(-0, 2000)
		self.RockY4 = love.math.random(-0, 2000)
		self.RockX5 = love.math.random(-0, 2000)
		self.RockY5 = love.math.random(-0, 2000)
		self.RockX6 = love.math.random(-0, 2000)
		self.RockY6 = love.math.random(-0, 2000)
		self.RockX7 = love.math.random(-0, 2000)
		self.RockY7 = love.math.random(-0, 2000)
		self.RockX8 = love.math.random(-0, 2000)
		self.RockY8 = love.math.random(-0, 2000)
		self.RockX9 = love.math.random(-0, 2000)
		self.RockY9 = love.math.random(-0, 2000)
	
		-- Rock health
		self.RockHealth1 = 10
		self.RockHealth2 = 10
		self.RockHealth3 = 10
		self.RockHealth4 = 10
		self.RockHealth5 = 10
		self.RockHealth6 = 10
		self.RockHealth7 = 10
		self.RockHealth8 = 10
		self.RockHealth9 = 10
	
		-- If rocks are hit
		self.RockHit1 = false
		self.RockHit2 = false
		self.RockHit3 = false
		self.RockHit4 = false
		self.RockHit5 = false
		self.RockHit6 = false
		self.RockHit7 = false
		self.RockHit8 = false
		self.RockHit9 = false

		-- If rocks are dead
		self.RockDead1 = false
		self.RockDead2 = false
		self.RockDead3 = false
		self.RockDead4 = false
		self.RockDead5 = false
		self.RockDead6 = false
		self.RockDead7 = false
		self.RockDead8 = false
		self.RockDead9 = false
		--- ROCK ---

		-- Camera and zoom vars
		self.Cam = camera(self.PlayerX, self.PlayerY, 2.5)
		self.ZoomCam = false

		-- Other vars
		Paused = false

		-- Welcome message vars
		game.Welcome = true

		-- GameOver vars
		self.GameOver = false
		self.GameOverMouseBackArea = false
		self.GameOverMouseDetect = 0
		self.GameOverMouseOnBtn = false
		self.GameOverArrowX = 450
		------ VARIABLES ------

		------ COLLISION BoxES ------
		self.Collider = HC(300, on_collision , collision_stop)
		self.BulletHitBox = self.Collider:addRectangle(self.PlayerX, self.PlayerY, 2, 2)
		self.ShipHitBox = self.Collider:addRectangle(self.ShipX,self.ShipY,78,48)
		self.PlayerHitBox = self.Collider:addRectangle(self.PlayerX, self.PlayerY,16,16)
		self.ShipHitBox1 = self.Collider:addRectangle(self.ShipX,self.ShipY,78,48)
		self.RockHitBox1 = self.Collider:addRectangle(self.RockX1,self.RockY1,22,22)
		self.RockHitBox2 = self.Collider:addRectangle(self.RockX2,self.RockY2,22,22)
		self.RockHitBox3 = self.Collider:addRectangle(self.RockX3,self.RockY3,22,22)
		self.RockHitBox4 = self.Collider:addRectangle(self.RockX4,self.RockY4,22,22)
		self.RockHitBox5 = self.Collider:addRectangle(self.RockX5,self.RockY5,22,22)
		self.RockHitBox6 = self.Collider:addRectangle(self.RockX6,self.RockY6,22,22)
		self.RockHitBox7 = self.Collider:addRectangle(self.RockX7,self.RockY7,22,22)
		self.RockHitBox8 = self.Collider:addRectangle(self.RockX8,self.RockY8,22,22)
		self.RockHitBox9 = self.Collider:addRectangle(self.RockX9,self.RockY9,22,22)
		self.GunItemHitBox = self.Collider:addRectangle(self.GunItemX, self.GunItemY,24,24)
		------ COLLISION BOXES ------
	end

	------ WELCOME MOUSE ------
	-- MOUSE WELCOME AUDIO ONCE
	if game.WelcomeMouseOnBtn == false and game.Welcome == true then
		game.WelcomeMouseDetect = 0
		love.audio.stop(game.GameSelect1M)
	end

	if game.WelcomeMouseDetect == 1 and SetMute == false and game.Welcome == true then
		love.audio.play(game.GameSelect1M)
	end
	-- MOUSE WELCOME AUDIO ONCE
	
	-- Anything between the "MOUSE WELCOME AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for the welcome button when the mouse is moving over it


	-- MOUSE WELCOME OUT OF AREA	
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 320/2) + 320) and game.Welcome == true then
		game.WelcomeButtonArea = false
		game.WelcomeMouseOnBtn = false
	end

	if love.mouse.getX() < (love.graphics.getWidth()/2 - 320/2) and game.Welcome == true then
		game.WelcomeButtonArea = false
		game.WelcomeMouseOnBtn = false
	end

	if love.mouse.getY() < 440 and game.Welcome == true then
		game.WelcomeButtonArea = false
		game.WelcomeMouseOnBtn = false
	end

	if love.mouse.getY() > 485 and game.Welcome == true then
		game.WelcomeButtonArea = false
		game.WelcomeMouseOnBtn = false
	end
	-- MOUSE WELCOME OUT OF AREA

	-- Anything between the "MOUSE WELCOME OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE WELCOME BUTTON AREA
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 320/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 320/2) + 320) and love.mouse.getY() > 440 and love.mouse.getY() < 485 and game.Welcome == true then
		game.WelcomeButtonArea = true
		game.WelcomeMouseOnBtn = true
		game.WelcomeMouseDetect = game.WelcomeMouseDetect + 1
	end
	-- MOUSE WELCOME BUTTON AREA

	-- Anything between the "MOUSE WELCOME BUTTON AREA" comments:
	-- This tells the game if the mouse is over a certain button
	------ WELCOME MOUSE ------

	------ GAME OVER MOUSE ------
	-- MOUSE GAME OVER AUDIO ONCE
	if game.GameOverMouseOnBtn == false and game.GameOver == true then
		game.GameOverMouseDetect = 0
		love.audio.stop(game.GameSelect1M)
	end

	if game.GameOverMouseDetect == 1 and SetMute == false and game.GameOver == true then
		love.audio.play(game.GameSelect1M)
	end
	-- MOUSE GAME OVER AUDIO ONCE
	
	-- Anything between the "MOUSE GAME OVER AUDIO ONCE" comments:
	-- Ensures that the select audio only plays once for the game over button when the mouse is moving over it


	-- MOUSE GAME OVER OUT OF AREA
	if love.mouse.getX() > ((love.graphics.getWidth()/2 - 410/2) + 410) and game.GameOver == true then
		game.GameOverMouseBackArea = false
		game.GameOverMouseOnBtn = false
	end

	if love.mouse.getX() < (love.graphics.getWidth()/2 - 410/2) and game.GameOver == true then
		game.GameOverMouseBackArea = false
		game.GameOverMouseOnBtn = false
	end

	if love.mouse.getY() < 440 and game.GameOver == true then
		game.GameOverMouseBackArea = false
		game.GameOverMouseOnBtn = false
	end

	if love.mouse.getY() > 485 and game.GameOver == true then
		game.GameOverMouseBackArea = false
		game.GameOverMouseOnBtn = false
	end
	-- MOUSE GAME OVER OUT OF AREA

	-- Anything between the "MOUSE GAME OVER OUT OF AREA" comments:
	-- makes sure that if the mouse goes out of a button area the button area is turned back to false


	-- MOUSE GAME OVER BUTTON AREA
	if love.mouse.getX() > (love.graphics.getWidth()/2 - 410/2) and love.mouse.getX() < ((love.graphics.getWidth()/2 - 410/2) + 410) and love.mouse.getY() > 440 and love.mouse.getY() < 485 and game.GameOver == true then
		game.GameOverMouseBackArea = true
		game.GameOverMouseOnBtn = true
		game.GameOverMouseDetect = game.GameOverMouseDetect + 1
	end
	-- MOUSE GAME OVER BUTTON AREA

	-- Anything between the "MOUSE GAME OVER BUTTON AREA" comments:
	-- This tells the game if the mouse is over a certain button
	------ GAME OVER MOUSE ------
end

function love.focus(f)
	
	-- If the mouse loses focus from the game window pause the game
	if not f and not Paused and not game.Welcome then
		Paused = true
		Resume = false
   		love.mouse.setCursor(cursor)
	end
end

function game:draw()
	
	------ FILTERS ------
	game.GameBG:setFilter( 'nearest', 'nearest' )
	game.Player:setFilter( 'nearest', 'nearest' )
	game.Shot:setFilter( 'nearest', 'nearest' )
	game.Ship:setFilter( 'nearest', 'nearest' )
	game.Gun:setFilter( 'nearest', 'nearest' )
	game.GunItem:setFilter( 'nearest', 'nearest' )
	game.GunInv:setFilter( 'nearest', 'nearest' )
	game.Rock1:setFilter( 'nearest', 'nearest' )
	game.Rock2:setFilter( 'nearest', 'nearest' )
	game.Rock3:setFilter( 'nearest', 'nearest' )
	game.Rock4:setFilter( 'nearest', 'nearest' )
	game.Rock5:setFilter( 'nearest', 'nearest' )
	game.Rock6:setFilter( 'nearest', 'nearest' )
	game.Rock7:setFilter( 'nearest', 'nearest' )
	game.Rock8:setFilter( 'nearest', 'nearest' )
	game.Rock9:setFilter( 'nearest', 'nearest' )
	game.InteractFont:setFilter( 'nearest', 'nearest' )
	DebugFont:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	------ IN CAMERA ------
	-- Start of camera
	game.Cam:attach()
	
	-- Draws space background
	love.graphics.draw(game.GameBG, -2000, -2000)

	--- GUN DRAWS ---
	for i, o in ipairs(game.Bullets) do
		
		-- Gun bullet graphic
		love.graphics.draw(game.Shot, o.x, o.y, o.Dir)

		-- Moves the bullet hit box with the bullet graphic
		game.BulletHitBox:moveTo(o.x, o.y)
	end
	--- GUN DRAWS ---

	--- PLAYER, SHIP AND GUN ---
	if game.InShip == true then
		
		-- Ships graphic for when the player is in the ship
		love.graphics.draw(game.Ship, game.ShipX, game.ShipY, game.ShipDir, 1, 1, game.Ship:getWidth()/2, game.Ship:getHeight()/2)
		
		-- Moves the ship hit box with the ship graphic
		game.ShipHitBox:moveTo(game.ShipX, game.ShipY)
		game.ShipHitBox1:moveTo(game.ShipX, game.ShipY)
		
		-- Rotates the ship hit box with the ship graphic
		game.ShipHitBox1:setRotation(game.ShipDir)
		game.ShipHitBox:setRotation(game.ShipDir)

		-- Moves the player and player hit box with the ship
		game.PlayerHitBox:moveTo(game.PlayerX, game.PlayerY)
	
	elseif game.InShip == false then 
		
		-- Ships graphic for when the player is out of the ship
		love.graphics.draw(game.Ship, game.ShipX, game.ShipY, game.ShipHitBox:rotation(), 1, 1, game.Ship:getWidth()/2, game.Ship:getHeight()/2)

		-- Player graphic
		love.graphics.draw(game.Player, game.PlayerX, game.PlayerY, game.PlayerRot, 1, 1, game.Player:getWidth()/2, game.Player:getHeight()/2)
		
		-- Leaves the ship hit box with the ship graphic
		game.ShipHitBox1:moveTo(game.ShipX, game.ShipY)
		game.ShipHitBox:moveTo(game.ShipX, game.ShipY)

		-- Moves the player hit box with the player graphic
		game.PlayerHitBox:moveTo(game.PlayerX, game.PlayerY)
		
		-- Rotates the player hit box with the player graphic
		game.PlayerHitBox:setRotation(game.PlayerRot)
		
		if game.HaveGun == true then
			
			-- Draws gun graphic in hand
			love.graphics.draw(game.Gun, game.GunX, game.GunY, game.PlayerRot, 1, 1, game.Player:getWidth() - 40, game.Player:getHeight() - 25)
		end
	end

	if game.ShipYes == true and game.InShip == false then 
		
		-- Prints interact key for if you can get in the ship
		love.graphics.setFont( game.InteractFont )
		love.graphics.print('[ e ]', game.ShipX + 30, game.ShipY + 30)
	end
	
	if game.GunYes == true and game.HaveGun == false then 
		
		-- Prints interact key for if you can pick up the gun
		love.graphics.setFont( game.InteractFont )
		love.graphics.print('[ e ]', game.GunItemX + 10, game.GunItemY + 10)
	end

	if game.HaveGun == false then
		
		-- Draws the gun item grpahic for if the player doesnt hold the gun
		love.graphics.draw(game.GunItem, game.GunItemX, game.GunItemY, 0, 1, 1, game.GunItem:getWidth()/2, game.GunItem:getHeight()/2)
		
		-- Moves the gun item hit box with the gun grpahic
		game.GunItemHitBox:moveTo(game.GunItemX, game.GunItemY)
	end
	--- PLAYER, SHIP AND GUN ---
	
	--- ROCK ---
   	-- Draw rock 1 if rock is not dead
   	if game.RockDead1 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock1, game.RockX1, game.RockY1, 0, 1, 1, game.Rock1:getWidth()/2, game.Rock1:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox1:moveTo(game.RockX1, game.RockY1)
	end

	-- Draw rock 2 if rock is not dead
	if game.RockDead2 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock2, game.RockX2, game.RockY2, 0, 1, 1, game.Rock2:getWidth()/2, game.Rock2:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox2:moveTo(game.RockX2, game.RockY2)
	end
	
	-- Draw rock 3 if rock is not dead
	if game.RockDead3 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock3, game.RockX3, game.RockY3, 0, 1, 1, game.Rock3:getWidth()/2, game.Rock3:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox3:moveTo(game.RockX3, game.RockY3)
	end

	-- Draw rock 4 if rock is not dead
	if game.RockDead4 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock4, game.RockX4, game.RockY4, 0, 1, 1, game.Rock4:getWidth()/2, game.Rock4:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox4:moveTo(game.RockX4, game.RockY4)
	end

	-- Draw rock 5 if rock is not dead
	if game.RockDead5 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock5, game.RockX5, game.RockY5, 0, 1, 1, game.Rock5:getWidth()/2, game.Rock5:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox5:moveTo(game.RockX5, game.RockY5)
	end

	-- Draw rock 6 if rock is not dead
	if game.RockDead6 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock6, game.RockX6, game.RockY6, 0, 1, 1, game.Rock6:getWidth()/2, game.Rock6:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox6:moveTo(game.RockX6, game.RockY6)
	end

	-- Draw rock 7 if rock is not dead
	if game.RockDead7 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock7, game.RockX7, game.RockY7, 0, 1, 1, game.Rock7:getWidth()/2, game.Rock7:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox7:moveTo(game.RockX7, game.RockY7)
	end

	-- Draw rock 8 if rock is not dead
	if game.RockDead8 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock8, game.RockX8, game.RockY8, 0, 1, 1, game.Rock8:getWidth()/2, game.Rock8:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox8:moveTo(game.RockX8, game.RockY8)
	end

	-- Draw rock 9 if rock is not dead
	if game.RockDead9 == false and GameReset == false then
		
		-- Draw rock grpahic
		love.graphics.draw(game.Rock9, game.RockX9, game.RockY9, 0, 1, 1, game.Rock9:getWidth()/2, game.Rock9:getHeight()/2)
		
		-- Move the rock hit box with the rock graphic
		game.RockHitBox9:moveTo(game.RockX9, game.RockY9)
	end
	--- ROCK ---

	-- Prints game hit boxes if debug mode is active
	if Deb == true then
		game.BulletHitBox:draw('line')
		game.ShipHitBox:draw('line')
		game.PlayerHitBox:draw('line')
		game.ShipHitBox1:draw('line')
		game.RockHitBox1:draw('line')
		game.RockHitBox2:draw('line')
		game.RockHitBox3:draw('line')
		game.RockHitBox4:draw('line')
		game.RockHitBox5:draw('line')
		game.RockHitBox6:draw('line')
		game.RockHitBox7:draw('line')
		game.RockHitBox8:draw('line')
		game.RockHitBox9:draw('line')
		game.GunItemHitBox:draw('line')
	end

	-- End of camera
	game.Cam:detach()
	------ IN CAMERA -----

	-- Draws Player Health and game hud
	love.graphics.setFont( game.WelcomeFont )
	love.graphics.setColor(25, 25, 25)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 30 )
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 0, 30, love.graphics.getWidth(), 2 )
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 6, 5, 104, 18 )
	love.graphics.setColor(0, 90, 255)
	love.graphics.rectangle("fill", 9, 7, 100, 14 )
	love.graphics.setColor(25, 25, 25)
	love.graphics.rectangle("fill", game.HealthX, game.HealthY, 100, 14 )
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 107, 5, 3, 18 )
	love.graphics.print('Health', 23, 5)

	-- Draws ship health once you have obtained it
	if game.ShipYours == true then
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 112, 5, 104, 18 )
		love.graphics.setColor(0, 255, 0)
		love.graphics.rectangle("fill", 115, 7, 100, 14 )
		love.graphics.setColor(25, 25, 25)
		love.graphics.rectangle("fill", game.ShipHealthX, game.ShipHealthY, 100, 14 )
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 215, 5, 3, 18 )
		love.graphics.print('Ship', 148, 5)
	end

	-- Draws game inventory hot bar
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 804/2), love.graphics.getHeight() - 62, 804, 64 )
	love.graphics.setColor(25, 25, 25)
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 + 2 - 804/2), love.graphics.getHeight() - 60, 800, 60 )
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 2 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 102 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 202 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 302 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 + 102 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 + 202 - 2/2), love.graphics.getHeight() - 60, 2, 60 )
	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 + 302 - 2/2), love.graphics.getHeight() - 60, 2, 60 )

	if game.HaveGun == true then
		
		-- Put the gun item grpahic in the hot bar if you have obtained it
		love.graphics.draw(game.GunInv, love.graphics.getWidth()/2 - 348 - 2/2, love.graphics.getHeight() - 28, 0, 8, 8, game.GunItem:getWidth()/2, game.GunItem:getHeight()/2)
	end

	if game.GameOver == true then
		
		-- If you get a game over limt these varibles from change
		game.ShotTime = 0
		game.ShotTimePlus = 0
		game.Bullets = { }
		game.GunShot = false
		game.GunShot1 = false
		game.PlayerMovementStop = true
		game.InShip = false
		game.ShipYes = false
		game.ExitShip = false
		game.HaveGun = false

		-- Game over text, box and button
		love.mouse.setCursor(cursor)
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 910/2), 55, 910, 510 )
    	love.graphics.setColor(0, 0, 0)
    	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 900/2), 60, 900, 500 )
    	love.graphics.setColor(255,255,255)
    	love.graphics.setFont( game.GameOverTitleFont )
    	love.graphics.print('GAME OVER', (love.graphics.getWidth()/2 - game.GameOverTitleFont:getWidth( "GAME OVER" )/2), 120)
    	love.graphics.setFont( game.GameOverText )
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 410/2), game.BtnY + 5, 29, 35 )
  		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 410/2) + 381, game.BtnY + 5, 29, 35 )
		love.graphics.print("Good game, well played,", (love.graphics.getWidth()/2 - game.GameOverText:getWidth( "Good game, well played," )/2), 230)
		love.graphics.print("my friend, however you", (love.graphics.getWidth()/2 - game.GameOverText:getWidth( "my friend, however you" )/2), 270)
		love.graphics.print("were utterly obliterated", (love.graphics.getWidth()/2 - game.GameOverText:getWidth( "were utterly obliterated" )/2), 310)
		love.graphics.print("in these circumstances", (love.graphics.getWidth()/2 - game.GameOverText:getWidth( "in these circumstances" )/2), 350)
		love.graphics.setFont( game.BtnFont )
		love.graphics.print('Main Menu', (love.graphics.getWidth()/2 - game.BtnFont:getWidth( "Main Menu" )/2), game.BtnY)
	end


    if game.Welcome == true then
    	
    	-- Welcome text, box and button
    	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 910/2), 55, 910, 510 )
    	love.graphics.setColor(0, 0, 0)
    	love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 900/2), 60, 900, 500 )
    	love.graphics.setColor(255,255,255)
    	love.graphics.setFont( game.WelcomeFont )
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2), game.BtnY + 5, 29, 35 )
		love.graphics.rectangle("fill", (love.graphics.getWidth()/2 - 320/2) + 291, game.BtnY + 5, 29, 35 )
		love.graphics.print('Welcome!', (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Welcome!" )/2), 110)
		love.graphics.print("Thank you for taking the time to test Piquant Interactive's project, Space Game.", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Thank you for taking the time to test Piquant Interactive's project, Space Game." )/2), 176)
		love.graphics.print("The current version solely involves a minigame which has you battle inanimate", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "The current version solely involves a minigame which has you battle inanimate!" )/2), 194)
		love.graphics.print("asteroids in a star field. Exhilarating, right??", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "asteroids in a star field. Exhilarating, right??" )/2), 212)
		love.graphics.print("Leave any feedback you may have at [http://www.reddit.com/r/piquant2013/]", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Leave any feedback you may have at [http://www.reddit.com/r/piquant2013/]" )/2), 248)
		love.graphics.print("as we love player interaction.", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "as we love player interaction." )/2), 266)
		love.graphics.print("Controls:", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Controls:" )/2), 302)
		love.graphics.print("Movement - W = Up, S = Down, A = Left, D = Right", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Movement - W = Up, S = Down, A = Left, D = Right" )/2), 320)
		love.graphics.print("Gun - Mouse = Aim, LeftClick = Shoot", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Gun - Mouse = Aim, LeftClick = Shoot" )/2), 338)
		love.graphics.print("Camera - X = Zoom In, Z = Zoom Out", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Camera - X = Zoom In, Z = Zoom Out" )/2), 356)
		love.graphics.print("Interaction - E = Activate, Q = Drop", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Interaction - E = Activate, Q = Drop" )/2), 374)
		love.graphics.print("Other - Esc = Pause, LeftShift = Sprint/Boost", (love.graphics.getWidth()/2 - game.WelcomeFont:getWidth( "Other - Esc = Pause, LeftShift = Sprint/Boost" )/2), 392)
		love.graphics.setFont( game.BtnFont )
		love.graphics.print('Continue', (love.graphics.getWidth()/2 - game.BtnFont:getWidth( "Continue" )/2), game.BtnY)
	end

	if Deb == true then
		
		-- Print all of the game vars for when debug mode is active

		-- Font, boxes, color
		love.graphics.setFont( DebugFont )
		love.graphics.setColor(0,0,0,160)
		love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 1010, 455)
		love.graphics.rectangle("fill", 1010, love.graphics.getHeight( ) - 50, 280, 50)		
		love.graphics.setColor(255,255,255,160)

		-- Box 1
		love.graphics.print("Game", 5, love.graphics.getHeight( ) - 450)
		love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 435)
		love.graphics.print("PlayerY: "..tostring(game.PlayerY), 5, love.graphics.getHeight( ) - 420)
		love.graphics.print("PlayerX: "..tostring(game.PlayerX), 5, love.graphics.getHeight( ) - 405)
		love.graphics.print("PlayerMovementStop: "..tostring(game.PlayerMovementStop), 5, love.graphics.getHeight( ) - 390)
		love.graphics.print("Tired: "..tostring(game.Tired), 5, love.graphics.getHeight( ) - 375)
		love.graphics.print("TiredTime: "..tostring(game.TiredTime), 5, love.graphics.getHeight( ) - 360)
		love.graphics.print("Sprint: "..tostring(game.Sprint), 5, love.graphics.getHeight( ) - 345)
		love.graphics.print("PlayerSpeed: "..tostring(game.PlayerSpeed), 5, love.graphics.getHeight( ) - 330)
		love.graphics.print("SprintTime: "..tostring(game.SprintTime), 5, love.graphics.getHeight( ) - 315)
		love.graphics.print("PlayerHit1: "..tostring(game.PlayerHit1), 5, love.graphics.getHeight( ) - 300)
		love.graphics.print("PlayerHit2: "..tostring(game.PlayerHit2), 5, love.graphics.getHeight( ) - 285)
		love.graphics.print("PlayerHit3: "..tostring(game.PlayerHit3), 5, love.graphics.getHeight( ) - 270)
		love.graphics.print("PlayerHit4: "..tostring(game.PlayerHit4), 5, love.graphics.getHeight( ) - 255)
		love.graphics.print("PlayerHit5: "..tostring(game.PlayerHit5), 5, love.graphics.getHeight( ) - 240)
		love.graphics.print("PlayerHit6: "..tostring(game.PlayerHit6), 5, love.graphics.getHeight( ) - 225)
		love.graphics.print("PlayerHit7: "..tostring(game.PlayerHit7), 5, love.graphics.getHeight( ) - 210)
		love.graphics.print("PlayerHit8: "..tostring(game.PlayerHit8), 5, love.graphics.getHeight( ) - 195)
		love.graphics.print("PlayerHit9: "..tostring(game.PlayerHit9), 5, love.graphics.getHeight( ) - 180)
		love.graphics.print("PlayerHealth: "..tostring(game.PlayerHealth), 5, love.graphics.getHeight( ) - 165)
		love.graphics.print("HealthX: "..tostring(game.HealthX), 5, love.graphics.getHeight( ) - 150) 
		love.graphics.print("ShotTime: "..tostring(game.ShotTime), 5, love.graphics.getHeight( ) - 135)
		love.graphics.print("ShotTimePlus: "..tostring(game.ShotTimePlus), 5, love.graphics.getHeight( ) - 120)
		love.graphics.print("GunShot: "..tostring(game.GunShot), 5, love.graphics.getHeight( ) - 105)
		love.graphics.print("GunShot1: "..tostring(game.GunShot1), 5, love.graphics.getHeight( ) - 90)
		love.graphics.print("GunY: "..tostring(game.GunY), 5, love.graphics.getHeight( ) - 75)
		love.graphics.print("GunX: "..tostring(game.GunX), 5, love.graphics.getHeight( ) - 60)
		love.graphics.print("HaveGun: "..tostring(game.HaveGun), 5, love.graphics.getHeight( ) - 45)
		love.graphics.print("GunItemX: "..tostring(game.GunItemX), 5, love.graphics.getHeight( ) - 30)
		
		-- Box 2
		love.graphics.print("GunItemY: "..tostring(game.GunItemY), 275, love.graphics.getHeight( ) - 420)
		love.graphics.print("ShipX: "..tostring(game.ShipX), 275, love.graphics.getHeight( ) - 405)
		love.graphics.print("ShipY: "..tostring(game.ShipY), 275, love.graphics.getHeight( ) - 390)
		love.graphics.print("BoostTired: "..tostring(game.BoostTired), 275, love.graphics.getHeight( ) - 375)
		love.graphics.print("BoostTiredTime: "..tostring(game.BoostTiredTime), 275, love.graphics.getHeight( ) - 360)
		love.graphics.print("Boost: "..tostring(game.Boost), 275, love.graphics.getHeight( ) - 345)
		love.graphics.print("BoostTime: "..tostring(game.BoostTime), 275, love.graphics.getHeight( ) - 330)
		love.graphics.print("ShipHit: "..tostring(game.ShipHit), 275, love.graphics.getHeight( ) - 315)
		love.graphics.print("ShipHit1: "..tostring(game.ShipHit1), 275, love.graphics.getHeight( ) - 300)
		love.graphics.print("ShipHit2: "..tostring(game.ShipHit2), 275, love.graphics.getHeight( ) - 285)
		love.graphics.print("ShipHit3: "..tostring(game.ShipHit3), 275, love.graphics.getHeight( ) - 270)
		love.graphics.print("ShipHit4: "..tostring(game.ShipHit4), 275, love.graphics.getHeight( ) - 255)
		love.graphics.print("ShipHit5: "..tostring(game.ShipHit5), 275, love.graphics.getHeight( ) - 240)
		love.graphics.print("ShipHit6: "..tostring(game.ShipHit6), 275, love.graphics.getHeight( ) - 225)
		love.graphics.print("ShipHit7: "..tostring(game.ShipHit7), 275, love.graphics.getHeight( ) - 210)
		love.graphics.print("ShipHit8: "..tostring(game.ShipHit8), 275, love.graphics.getHeight( ) - 195)
		love.graphics.print("ShipHit9: "..tostring(game.ShipHit9), 275, love.graphics.getHeight( ) - 180)
		love.graphics.print("ShipHealthX: "..tostring(game.ShipHealthX), 275, love.graphics.getHeight( ) - 165)
		love.graphics.print("ShipHealth: "..tostring(game.ShipHealth), 275, love.graphics.getHeight( ) - 150)
		love.graphics.print("InShip: "..tostring(game.InShip), 275, love.graphics.getHeight( ) - 135)
		love.graphics.print("ShipYes: "..tostring(game.ShipYes), 275, love.graphics.getHeight( ) - 120)
		love.graphics.print("ShipYours: "..tostring(game.ShipYours), 275, love.graphics.getHeight( ) - 105)
		love.graphics.print("ExitShip: "..tostring(game.ExitShip), 275, love.graphics.getHeight( ) - 90)
		love.graphics.print("ShipDead: "..tostring(game.ShipDead), 275, love.graphics.getHeight( ) - 75)
		love.graphics.print("RockX1: "..tostring(game.RockX1), 275, love.graphics.getHeight( ) - 60)
		love.graphics.print("RockY1: "..tostring(game.RockY1), 275, love.graphics.getHeight( ) - 45)
		love.graphics.print("RockX2: "..tostring(game.RockX2), 275, love.graphics.getHeight( ) - 30)
		
		-- Box 3
		love.graphics.print("RockY2: "..tostring(game.RockY2), 545, love.graphics.getHeight( ) - 420)
		love.graphics.print("RockX3: "..tostring(game.RockX3), 545, love.graphics.getHeight( ) - 405)
		love.graphics.print("RockY3: "..tostring(game.RockY3), 545, love.graphics.getHeight( ) - 390)
		love.graphics.print("RockX4: "..tostring(game.RockX4), 545, love.graphics.getHeight( ) - 375)
		love.graphics.print("RockY4: "..tostring(game.RockY4), 545, love.graphics.getHeight( ) - 360)
		love.graphics.print("RockX5: "..tostring(game.RockX5), 545, love.graphics.getHeight( ) - 345)
		love.graphics.print("RockY5: "..tostring(game.RockY5), 545, love.graphics.getHeight( ) - 330)
		love.graphics.print("RockX6: "..tostring(game.RockX6), 545, love.graphics.getHeight( ) - 315)
		love.graphics.print("RockY6: "..tostring(game.RockY6), 545, love.graphics.getHeight( ) - 300)
		love.graphics.print("RockX7: "..tostring(game.RockX7), 545, love.graphics.getHeight( ) - 285)
		love.graphics.print("RockY7: "..tostring(game.RockY7), 545, love.graphics.getHeight( ) - 270)
		love.graphics.print("RockX8: "..tostring(game.RockX8), 545, love.graphics.getHeight( ) - 255)
		love.graphics.print("RockY8: "..tostring(game.RockY8), 545, love.graphics.getHeight( ) - 240)
		love.graphics.print("RockX9: "..tostring(game.RockX9), 545, love.graphics.getHeight( ) - 225)
		love.graphics.print("RockY9: "..tostring(game.RockY9), 545, love.graphics.getHeight( ) - 210)
		love.graphics.print("RockHealth1: "..tostring(game.RockHealth1), 545, love.graphics.getHeight( ) - 195)
		love.graphics.print("RockHealth2: "..tostring(game.RockHealth2), 545, love.graphics.getHeight( ) - 180)
		love.graphics.print("RockHealth3: "..tostring(game.RockHealth3), 545, love.graphics.getHeight( ) - 165)
		love.graphics.print("RockHealth4: "..tostring(game.RockHealth4), 545, love.graphics.getHeight( ) - 150)
		love.graphics.print("RockHealth5: "..tostring(game.RockHealth5), 545, love.graphics.getHeight( ) - 135)
		love.graphics.print("RockHealth6: "..tostring(game.RockHealth6), 545, love.graphics.getHeight( ) - 120)
		love.graphics.print("RockHealth7: "..tostring(game.RockHealth7), 545, love.graphics.getHeight( ) - 105)
		love.graphics.print("RockHealth8: "..tostring(game.RockHealth8), 545, love.graphics.getHeight( ) - 90)
		love.graphics.print("RockHealth9: "..tostring(game.RockHealth9), 545, love.graphics.getHeight( ) - 75)
		love.graphics.print("RockHit1: "..tostring(game.RockHit1), 545, love.graphics.getHeight( ) - 60)
		love.graphics.print("RockHit2: "..tostring(game.RockHit2), 545, love.graphics.getHeight( ) - 45)
		love.graphics.print("RockHit3: "..tostring(game.RockHit3), 545, love.graphics.getHeight( ) - 30)

		-- Box 4
		love.graphics.print("RockHit4: "..tostring(game.RockHit4), 715, love.graphics.getHeight( ) - 420)
		love.graphics.print("RockHit5: "..tostring(game.RockHit5), 715, love.graphics.getHeight( ) - 405)
		love.graphics.print("RockHit6: "..tostring(game.RockHit6), 715, love.graphics.getHeight( ) - 390)
		love.graphics.print("RockHit7: "..tostring(game.RockHit7), 715, love.graphics.getHeight( ) - 375)
		love.graphics.print("RockHit8: "..tostring(game.RockHit8), 715, love.graphics.getHeight( ) - 360)
		love.graphics.print("RockHit9: "..tostring(game.RockHit9), 715, love.graphics.getHeight( ) - 345)
		love.graphics.print("RockDead1: "..tostring(game.RockDead1), 715, love.graphics.getHeight( ) - 330)
		love.graphics.print("RockDead2: "..tostring(game.RockDead2), 715, love.graphics.getHeight( ) - 315)
		love.graphics.print("RockDead3: "..tostring(game.RockDead3), 715, love.graphics.getHeight( ) - 300)
		love.graphics.print("RockDead4: "..tostring(game.RockDead4), 715, love.graphics.getHeight( ) - 285)
		love.graphics.print("RockDead5: "..tostring(game.RockDead5), 715, love.graphics.getHeight( ) - 270)
		love.graphics.print("RockDead6: "..tostring(game.RockDead6), 715, love.graphics.getHeight( ) - 255)
		love.graphics.print("RockDead7: "..tostring(game.RockDead7), 715, love.graphics.getHeight( ) - 240)
		love.graphics.print("RockDead8: "..tostring(game.RockDead8), 715, love.graphics.getHeight( ) - 225)
		love.graphics.print("RockDead9: "..tostring(game.RockDead9), 715, love.graphics.getHeight( ) - 210)
		love.graphics.print("Cam: "..tostring(game.Cam), 715, love.graphics.getHeight( ) - 195)
		love.graphics.print("ZoomCam: "..tostring(game.ZoomCam), 715, love.graphics.getHeight( ) - 180)
		love.graphics.print("ArrowX: "..tostring(game.ArrowX), 715, love.graphics.getHeight( ) - 165)
		love.graphics.print("WelcomeButtonArea: "..tostring(game.WelcomeButtonArea), 715, love.graphics.getHeight( ) - 150)
		love.graphics.print("WelcomeMouseDetect: "..tostring(game.WelcomeMouseDetect), 715, love.graphics.getHeight( ) - 135)
		love.graphics.print("WelcomeMouseOnBtn: "..tostring(game.WelcomeMouseOnBtn), 715, love.graphics.getHeight( ) - 120)
		love.graphics.print("Welcome: "..tostring(game.Welcome), 715, love.graphics.getHeight( ) - 105)
		love.graphics.print("GameOver: "..tostring(game.GameOver), 715, love.graphics.getHeight( ) - 90)
		love.graphics.print("GameOverMouseBackArea: "..tostring(game.GameOverMouseBackArea), 715, love.graphics.getHeight( ) - 75)
		love.graphics.print("GameOverMouseDetect: "..tostring(game.GameOverMouseDetect), 715, love.graphics.getHeight( ) - 60)
		love.graphics.print("GameOverMouseOnBtn: "..tostring(game.GameOverMouseOnBtn), 715, love.graphics.getHeight( ) - 45)
		love.graphics.print("GameOverArrowX: "..tostring(game.GameOverArrowX), 715, love.graphics.getHeight( ) - 30)
	
		-- Box 5
		love.graphics.print("PlayerRot: "..tostring(game.PlayerRot), 1010, love.graphics.getHeight( ) - 30)

		love.graphics.setColor(255,255,255,255)
	end
end

return game