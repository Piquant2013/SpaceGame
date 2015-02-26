-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates game as a new gamestate
game = Gamestate.new()

-- Loads camera script
local camera = require "vendors/camera"





HC = require 'vendors/hardoncollider'
pause = require 'pause'






function on_collision(dt, shape_a, shape_b, shape_c)
end

function collision_stop(dt, shape_a, shape_b, shape_c)
end






function game:init()
	------ VARIABLES ------
	-- Player postion
	self.PlayerY = 400
	self.PlayerX = 800

	-- Gun vars
	self.ShotTime = 0
	self.ShotTimePlus = 0
	self.Bullets = { }
	self.GunShot = false
	self.GunShot1 = false

	-- Tells the camera to follow the player and have a zoom of 2.5
	self.Cam = camera(self.PlayerX, self.PlayerY, 2.5)
	------ VARIABLES ------

	------ IMAGES ------
	self.GameBG = love.graphics.newImage("images/largespacebg.png")
	self.Player = love.graphics.newImage("images/man.png")
	self.Shot = love.graphics.newImage("images/shot.png")
	------ IMAGES ------

	------ AUDIO ------
	GameMusic = love.audio.newSource("audio/gamemusic.ogg")
	self.GunSound = love.audio.newSource("audio/gun.ogg")
	self.GunSound1 = love.audio.newSource("audio/gun.ogg")
	------ AUDIO ------




	BoostTired = false
	BoostTiredTime = 0 
	Boost = false
	BoostTime = 0

	Tired = false
	TiredTime = 0 
	Sprint = false
	PlayerSpeed = 70
	SprintTime = 0

	InteractFont = love.graphics.newFont("fonts/xen3.ttf", 10)
	BackFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	gameovertextfont = love.graphics.newFont("fonts/xen3.ttf", 40)
	gameoverfont = love.graphics.newFont("fonts/xen3.ttf", 90)
	welcomefont = love.graphics.newFont("fonts/xen3.ttf", 20)
	
	welcome = true
	zoomcam = false
	paused = false
	
	BackBtnY = 440	
	BackBtnX = 530
	GameArrowX = 480
	GameSelect1M = love.audio.newSource("audio/sel.ogg")
	EnterGame = love.audio.newSource("audio/enter.ogg")

	Collider = HC(300, on_collision , collision_stop)
	
	mouse12 = Collider:addPoint(game.PlayerX, game.PlayerY)

	ShipX = 456
	ShipY = 490
	Ship = love.graphics.newImage("images/ship1.png")
	shiphitbox = Collider:addRectangle(ShipX,ShipY,78,48)
	InShip = false
	ShipYes = false

	playerhitbox = Collider:addRectangle(game.PlayerX, game.PlayerY,16,16)
	playerhit1 = false
	playerhit2 = false
	playerhit3 = false
	playerhit4 = false
	playerhit5 = false
	playerhit6 = false
	playerhit7 = false
	playerhit8 = false
	playerhit9 = false
	shiphit = false

	GameMouseBackArea = false
	GameMouseDetect = 0
	GameMouseOnBtn = false

	gameover = false

	GameOverMouseBackArea = false
	GameOverMouseDetect = 0
	GameOverMouseOnBtn = false
	GameOverArrowX = 450

	shiphealth = 200
	playerhealth = 100
	HealthX = 107
	HealthY = 7
	ShipHealthX = 215
	ShipHealthY = 7
	shiphitbox1 = Collider:addRectangle(ShipX,ShipY,78,48)
	shiphit1 = false
	shiphit2 = false
	shiphit3 = false
	shiphit4 = false
	shiphit5 = false
	shiphit6 = false
	shiphit7 = false
	shiphit8 = false
	shiphit9 = false

	Random1x = love.math.random(-0, 2000)
	Random1y = love.math.random(-0, 2000)
	Random2x = love.math.random(-0, 2000)
	Random2y = love.math.random(-0, 2000)
	Random3x = love.math.random(-0, 2000)
	Random3y = love.math.random(-0, 2000)
	Random4x = love.math.random(-0, 2000)
	Random4y = love.math.random(-0, 2000)
	Random5x = love.math.random(-0, 2000)
	Random5y = love.math.random(-0, 2000)
	Random6x = love.math.random(-0, 2000)
	Random6y = love.math.random(-0, 2000)
	Random7x = love.math.random(-0, 2000)
	Random7y = love.math.random(-0, 2000)
	Random8x = love.math.random(-0, 2000)
	Random8y = love.math.random(-0, 2000)
	Random9x = love.math.random(-0, 2000)
	Random9y = love.math.random(-0, 2000)

	rock1 = love.graphics.newImage("images/rock.png")
	rock2 = love.graphics.newImage("images/rock.png")
	rock3 = love.graphics.newImage("images/rock.png")
	rock4 = love.graphics.newImage("images/rock.png")
	rock5 = love.graphics.newImage("images/rock.png")
	rock6 = love.graphics.newImage("images/rock.png")
	rock7 = love.graphics.newImage("images/rock.png")
	rock8 = love.graphics.newImage("images/rock.png")
	rock9 = love.graphics.newImage("images/rock.png")

	rockx1 = Random1x
	rocky1 = Random1y
	rockx2 = Random2x
	rocky2 = Random2y
	rockx3 = Random3x
	rocky3 = Random3y
	rockx4 = Random4x
	rocky4 = Random4y
	rockx5 = Random5x
	rocky5 = Random5y
	rockx6 = Random6x
	rocky6 = Random6y
	rockx7 = Random7x
	rocky7 = Random7y
	rockx8 = Random8x
	rocky8 = Random8y
	rockx9 = Random9x
	rocky9 = Random9y

	rockbox1 = Collider:addRectangle(rockx1,rocky1,22,22)
	rockbox2 = Collider:addRectangle(rockx2,rocky2,22,22)
	rockbox3 = Collider:addRectangle(rockx3,rocky3,22,22)
	rockbox4 = Collider:addRectangle(rockx4,rocky4,22,22)
	rockbox5 = Collider:addRectangle(rockx5,rocky5,22,22)
	rockbox6 = Collider:addRectangle(rockx6,rocky6,22,22)
	rockbox7 = Collider:addRectangle(rockx7,rocky7,22,22)
	rockbox8 = Collider:addRectangle(rockx8,rocky8,22,22)
	rockbox9 = Collider:addRectangle(rockx9,rocky9,22,22)
	
	rockhit1 = false
	rockhit2 = false
	rockhit3 = false
	rockhit4 = false
	rockhit5 = false
	rockhit6 = false
	rockhit7 = false
	rockhit8 = false
	rockhit9 = false

	rockhealth1 = 10
	rockhealth2 = 10
	rockhealth3 = 10
	rockhealth4 = 10
	rockhealth5 = 10
	rockhealth6 = 10
	rockhealth7 = 10
	rockhealth8 = 10
	rockhealth9 = 10
	
	rockdestroyed1 = false
	rockdestroyed2 = false
	rockdestroyed3 = false
	rockdestroyed4 = false
	rockdestroyed5 = false
	rockdestroyed6 = false
	rockdestroyed7 = false
	rockdestroyed8 = false
	rockdestroyed9 = false

	ShipYours = false
	ExitShip = false
	shipdead = false
end






function game:keypressed(key)
	if key == "escape" and paused == false then
   		paused = true
   		ht = false
   		love.mouse.setCursor(cursor)
  	end

  	if key == "return" and welcome == true then
  		Restart = false
  		welcome = false
  		love.mouse.setCursor(crosshair)
  		love.audio.play(EnterGame)
  	end

  	if key == "return" and gameover == true then
  		love.audio.play(EnterGame)
    	Gamestate.switch(menu)
    	love.audio.play(MenuMusic)
    	MenuMusic:setLooping(true)
   		love.audio.stop(GameMusic)
    	Restart = true
  	end

    if key == "x" and zoomcam == false then
		game.Cam:zoom(2)
		zoomcam = true
	end

	if key == "z" and zoomcam == true then
		game.Cam:zoom(0.5)
		zoomcam = false
	end

	if key == "e" and ShipYes == true then
		InShip = true
		ShipYours = true
	end

	if key == "e" and InShip == true and ExitShip == true then
		InShip = false
		ExitShip = false
	end
end








function game:mousepressed(mx, my, button)

	-- Gun
	if button == "l" and game.ShotTime <= 0 and InShip == false then
		game.Direction = math.atan2(my1 - game.PlayerY, mx1 - game.PlayerX)
			table.insert(game.Bullets, {
				x = game.PlayerX,
				y = game.PlayerY,
				Dir = game.Direction,
				Speed = 400
			})
			game.ShotTime = game.ShotTimePlus
	end

	-- Gun Sounds
	if button == "l" and game.GunShot == true and welcome == false and gameover == false and InShip == false then
		love.audio.play(game.GunSound)
		love.audio.stop(game.GunSound1)
		game.GunShot1 = false
	end

	-- Gun Sounds
	if button == "l" and game.GunShot1 == false and welcome == false and gameover == false and InShip == false then
		love.audio.play(game.GunSound1)
		love.audio.stop(game.GunSound)
		game.GunShot = true
	end





	if button == "l" and GameMouseBackArea == true and welcome == true then
		Restart = false
  		welcome = false
  		love.mouse.setCursor(crosshair)
  		love.audio.play(EnterGame)
  	end

  	if button == "l" and GameOverMouseBackArea == true and gameover == true then
		love.audio.play(EnterGame)
    	Gamestate.switch(menu)
    	love.audio.play(MenuMusic)
    	MenuMusic:setLooping(true)
   		love.audio.stop(GameMusic)
    	Restart = true
  	end


end

function game:update(dt)

	------ CAMERA ------
	dx,dy = (game.PlayerX) - game.Cam.x, (game.PlayerY) - game.Cam.y
	game.Cam:move(dx/2, dy/2)
	mx1,my1 = game.Cam:mousepos()
	------ CAMERA ------

	------ PLAYER MOVEMENT ------
	if love.keyboard.isDown("a") and InShip == false then
		game.PlayerX = game.PlayerX - PlayerSpeed * dt
    end

	if love.keyboard.isDown("d") and InShip == false then
		game.PlayerX = game.PlayerX + PlayerSpeed * dt
    end

	if love.keyboard.isDown("w") and InShip == false then
		game.PlayerY = game.PlayerY - PlayerSpeed * dt
    end

	if love.keyboard.isDown("s") and InShip == false then
		game.PlayerY = game.PlayerY + PlayerSpeed * dt
    end







    SprintTime = SprintTime + dt

    if love.keyboard.isDown("lshift") and InShip == false then
		PlayerSpeed = 130
		Sprint = true
    end

    if not love.keyboard.isDown("lshift") and InShip == false then
		PlayerSpeed = 70
		Sprint = false
    end

    if Sprint == true and SprintTime > 5 and InShip == false then
    	Tired = true
    	PlayerSpeed = 70
    end

    if Sprint == false then
    	SprintTime = 0
    end

    if Tired == true and Sprint == false and InShip == false then
    	PlayerSpeed = 70
    	TiredTime = TiredTime + dt
    	SprintTime = 0
    end

    if TiredTime > 1.7 then
    	Tired = false
    	TiredTime = 0
    end

    if Tired == true and Sprint == true and InShip == false then
    	PlayerSpeed = 70
    	SprintTime = 0
    	TiredTime = 0
    end





    ------ PLAYER MOVEMENT ------

	------ GUN ------
	game.ShotTime = math.max(0, game.ShotTime - dt)
		
	for i, o in ipairs(game.Bullets) do
		o.x = o.x + math.cos(o.Dir) * o.Speed * dt
		o.y = o.y + math.sin(o.Dir) * o.Speed * dt
			if (o.x > (game.PlayerX + 245) or (o.x < (game.PlayerX - 245)))
			or (o.y > (game.PlayerY + 135) or (o.y < (game.PlayerY - 135))) then
				table.remove(game.Bullets, i)
				Collider:remove(mouse12)
				mouse12:moveTo(4000, 4000)
			end
	end
	------ GUN ------

	-- Player rotation with the mouse pointer
	PlayerRot = math.atan2(mx1 - game.PlayerX, game.PlayerY - my1) - math.pi / 2
	









	if mouse12:collidesWith(rockbox1) and rockdestroyed1 == false then
		rockhit1 = true
    elseif not mouse12:collidesWith(rockbox1) then
    	rockhit1 = false
	end

	if mouse12:collidesWith(rockbox2) and rockdestroyed2 == false then
		rockhit2 = true
    elseif not mouse12:collidesWith(rockbox2) then
    	rockhit2 = false
	end

	if mouse12:collidesWith(rockbox3) and rockdestroyed3 == false then
		rockhit3 = true
    elseif not mouse12:collidesWith(rockbox3) then
    	rockhit3 = false
	end

	if mouse12:collidesWith(rockbox4) and rockdestroyed4 == false then
		rockhit4 = true
    elseif not mouse12:collidesWith(rockbox4) then
    	rockhit4 = false
	end

	if mouse12:collidesWith(rockbox5) and rockdestroyed5 == false then
		rockhit5 = true
    elseif not mouse12:collidesWith(rockbox5) then
    	rockhit5 = false
	end

	if mouse12:collidesWith(rockbox6) and rockdestroyed6 == false then
		rockhit6 = true
    elseif not mouse12:collidesWith(rockbox6) then
    	rockhit6 = false
	end

	if mouse12:collidesWith(rockbox7) and rockdestroyed7 == false then
		rockhit7 = true
    elseif not mouse12:collidesWith(rockbox7) then
    	rockhit7 = false
	end

	if mouse12:collidesWith(rockbox8) and rockdestroyed8 == false then
		rockhit8 = true
    elseif not mouse12:collidesWith(rockbox8) then
    	rockhit8 = false
	end

	if mouse12:collidesWith(rockbox9) and rockdestroyed9 == false then
		rockhit9 = true
    elseif not mouse12:collidesWith(rockbox9) then
    	rockhit9 = false
	end

	if rockhit1 == true then
		rockhealth1 = rockhealth1 - 1
	end

	if rockhit2 == true then
		rockhealth2 = rockhealth2 - 1
	end

	if rockhit3 == true then
		rockhealth3 = rockhealth3 - 1
	end

	if rockhit4 == true then
		rockhealth4 = rockhealth4 - 1
	end

	if rockhit5 == true then
		rockhealth5 = rockhealth5 - 1
	end

	if rockhit6 == true then
		rockhealth6 = rockhealth6 - 1
	end

	if rockhit7 == true then
		rockhealth7 = rockhealth7 - 1
	end

	if rockhit8 == true then
		rockhealth8 = rockhealth8 - 1
	end

	if rockhit9 == true then
		rockhealth9 = rockhealth9 - 1
	end

	if rockhealth1 == 0 then
		rockdestroyed1 = true
	end

	if rockhealth2 == 0 then
		rockdestroyed2 = true
	end

	if rockhealth3 == 0 then
		rockdestroyed3 = true
	end

	if rockhealth4 == 0 then
		rockdestroyed4 = true
	end

	if rockhealth5 == 0 then
		rockdestroyed5 = true
	end

	if rockhealth6 == 0 then
		rockdestroyed6 = true
	end

	if rockhealth7 == 0 then
		rockdestroyed7 = true
	end

	if rockhealth8 == 0 then
		rockdestroyed8 = true
	end

	if rockhealth9 == 0 then
		rockdestroyed9 = true
	end





	if playerhitbox:collidesWith(rockbox1) and InShip == false and rockdestroyed1 == false then
    	playerhit1 = true
	elseif not playerhitbox:collidesWith(rockbox1) then
    	playerhit1 = false
	end

	if playerhitbox:collidesWith(rockbox2) and InShip == false and rockdestroyed2 == false then
    	playerhit2 = true
	elseif not playerhitbox:collidesWith(rockbox2) then
    	playerhit2 = false
	end

	if playerhitbox:collidesWith(rockbox3) and InShip == false and rockdestroyed3 == false then
    	playerhit3 = true
	elseif not playerhitbox:collidesWith(rockbox3) then
    	playerhit3 = false
	end

	if playerhitbox:collidesWith(rockbox4) and InShip == false and rockdestroyed4 == false then
    	playerhit4 = true
	elseif not playerhitbox:collidesWith(rockbox4) then
    	playerhit4 = false
	end

	if playerhitbox:collidesWith(rockbox5) and InShip == false and rockdestroyed5 == false then
    	playerhit5 = true
	elseif not playerhitbox:collidesWith(rockbox5) then
    	playerhit5 = false
	end

	if playerhitbox:collidesWith(rockbox6) and InShip == false and rockdestroyed6 == false then
    	playerhit6 = true
	elseif not playerhitbox:collidesWith(rockbox6) then
    	playerhit6 = false
	end

	if playerhitbox:collidesWith(rockbox7) and InShip == false and rockdestroyed7 == false then
    	playerhit7 = true
	elseif not playerhitbox:collidesWith(rockbox7) then
    	playerhit7 = false
	end

	if playerhitbox:collidesWith(rockbox8) and InShip == false and rockdestroyed8 == false then
    	playerhit8 = true
	elseif not playerhitbox:collidesWith(rockbox8) then
    	playerhit8 = false
	end

	if playerhitbox:collidesWith(rockbox9) and InShip == false and rockdestroyed9 == false then
    	playerhit9 = true
	elseif not playerhitbox:collidesWith(rockbox9) then
    	playerhit9 = false
	end






	if shiphitbox:collidesWith(rockbox1) and shiphealth > 0 and rockdestroyed1 == false then
    	shiphit = true
	elseif not shiphitbox:collidesWith(rockbox1) then
    	shiphit = false
	end

	if shiphitbox:collidesWith(rockbox2) and shiphealth > 0 and rockdestroyed2 == false then
    	shiphit2 = true
	elseif not shiphitbox:collidesWith(rockbox2) then
    	shiphit2 = false
	end

	if shiphitbox:collidesWith(rockbox3) and shiphealth > 0 and rockdestroyed3 == false then
    	shiphit3 = true
	elseif not shiphitbox:collidesWith(rockbox3) then
    	shiphit3 = false
	end

	if shiphitbox:collidesWith(rockbox4) and shiphealth > 0 and rockdestroyed4 == false then
    	shiphit4 = true
	elseif not shiphitbox:collidesWith(rockbox4) then
    	shiphit4 = false
	end

	if shiphitbox:collidesWith(rockbox5) and shiphealth > 0 and rockdestroyed5 == false then
    	shiphit5 = true
	elseif not shiphitbox:collidesWith(rockbox5) then
    	shiphit5 = false
	end

	if shiphitbox:collidesWith(rockbox6) and shiphealth > 0 and rockdestroyed6 == false then
    	shiphit6 = true
	elseif not shiphitbox:collidesWith(rockbox6) then
    	shiphit6 = false
	end

	if shiphitbox:collidesWith(rockbox7) and shiphealth > 0 and rockdestroyed7 == false then
    	shiphit7 = true
	elseif not shiphitbox:collidesWith(rockbox7) then
    	shiphit7 = false
	end

	if shiphitbox:collidesWith(rockbox8) and shiphealth > 0 and rockdestroyed8 == false then
    	shiphit8 = true
	elseif not shiphitbox:collidesWith(rockbox8) then
    	shiphit8 = false
	end

	if shiphitbox:collidesWith(rockbox9) and shiphealth > 0 and rockdestroyed9 == false then
    	shiphit9 = true
	elseif not shiphitbox:collidesWith(rockbox9) then
    	shiphit9 = false
	end

	







    if playerhitbox:collidesWith(shiphitbox) then
    	ShipYes = true
	elseif not playerhitbox:collidesWith(shiphitbox) then
    	ShipYes = false
	end

	if mouse12:collidesWith(shiphitbox1) then
    	shiphit1 = true
	elseif not mouse12:collidesWith(shiphitbox1) then
    	shiphit1 = false
   	end

   	






	if playerhit1 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit2 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit3 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit4 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit5 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit6 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit7 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit8 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end

	if playerhit9 == true then
		playerhealth = playerhealth - 1
		HealthX = HealthX - 58 * dt
	end







	if shiphit1 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit2 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit3 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit4 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit5 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit6 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit7 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit8 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end

	if shiphit9 == true and shipdead == false then
		shiphealth = shiphealth - 1
		ShipHealthX = ShipHealthX - 30 * dt
	end





	if playerhealth == 0 then
		gameover = true
	end

	if shiphealth == 0 then
		shipdead = true
	end






  

	
	if shipdead == true then
		ShipX = ShipX + math.cos(ShipDir) * 10 * dt
		ShipY = ShipY + math.sin(ShipDir) * 10 * dt
	end

  	if InShip == true and shipdead == true then
  		ExitShip = true
  		game.PlayerX = ShipX
    	game.PlayerY = ShipY
  	end
	
	if InShip == true and shiphealth > 0 then
		game.PlayerX = ShipX
    	game.PlayerY = ShipY
    	ExitShip = true
    end

    if shiphealth > 0 then
		ShipDir = math.atan2(my1 - game.PlayerY, mx1 - game.PlayerX)
	end

	if love.keyboard.isDown("w") and InShip == true and shiphealth > 0 then
		ShipX = ShipX + math.cos(ShipDir) * PlayerSpeed * dt
		ShipY = ShipY + math.sin(ShipDir) * PlayerSpeed * dt
		PlayerSpeed = 350
	end

	if love.keyboard.isDown("s") and InShip == true and not love.keyboard.isDown("w") and shiphealth > 0 then
		ShipX = ShipX - math.cos(ShipDir) * PlayerSpeed * dt
		ShipY = ShipY - math.sin(ShipDir) * PlayerSpeed * dt
		PlayerSpeed = 100
	end

    BoostTime = BoostTime + dt

    if love.keyboard.isDown("lshift") and InShip == true and not love.keyboard.isDown("s") and shiphealth > 0 then
		PlayerSpeed = 600
		Boost = true
    end

    if not love.keyboard.isDown("lshift") and InShip == true and not love.keyboard.isDown("s") and shiphealth > 0 then
		Boost = false
    end

    if Boost == true and BoostTime > 5 and InShip == true and shiphealth > 0 then
    	BoostTired = true
    	PlayerSpeed = 350
    end

    if Boost == false and InShip == true and shiphealth > 0 then
    	BoostTime = 0
    end

    if BoostTired == true and Boost == false and InShip == true and shiphealth > 0 then
    	PlayerSpeed = 350
    	BoostTiredTime = BoostTiredTime + dt
    	BoostTime = 0
    end

    if BoostTiredTime > 1.7 and InShip == true and shiphealth > 0 then
    	BoostTired = false
    	BoostTiredTime = 0
    end

    if BoostTired == true and Boost == true and InShip == true and shiphealth > 0 then
    	PlayerSpeed = 350
    	BoostTime = 0
    	BoostTiredTime = 0
    end










    Collider:update(dt)








	if paused == true then
		Gamestate.switch(pause)
	end 








	if Restart == true then
		game.PlayerY = 400
		game.PlayerX = 800
		game.ShotTime = 0
		game.ShotTimePlus = 0
		game.Bullets = { }
		game.GunShot = false
		game.GunShot1 = false
		game.Cam = camera(game.PlayerX, game.PlayerY, 2.5)
		BoostTired = false
		BoostTiredTime = 0 
		Boost = false
		BoostTime = 0
		Tired = false
		TiredTime = 0 
		Sprint = false
		PlayerSpeed = 70
		SprintTime = 0
		welcome = true
		zoomcam = false
		paused = false
		Collider = HC(300,on_collision , collision_stop)
		mouse12 = Collider:addPoint(game.PlayerX, game.PlayerY, 1, 1)
		ShipX = 456
		ShipY = 490
		shiphitbox = Collider:addRectangle(ShipX,ShipY,78,48)
		InShip = false
		ShipYes = false
		playerhitbox = Collider:addRectangle(game.PlayerX, game.PlayerY,16,16)
		playerhit = false
		shiphealth = 200
		playerhit1 = false
		playerhit2 = false
		playerhit3 = false
		playerhit4 = false
		playerhit5 = false
		playerhit6 = false
		playerhit7 = false
		playerhit8 = false
		playerhit9 = false
		gameover = false
		GameOverMouseBackArea = false
		GameOverMouseDetect = 0
		GameOverMouseOnBtn = false
		GameOverArrowX = 450
		shiphealth = 200
		playerhealth = 100
		HealthX = 107
		HealthY = 7
		ShipHealthX = 215
		ShipHealthY = 7
		shiphitbox1 = Collider:addRectangle(ShipX,ShipY,78,48)
		shiphit1 = false
		Random1x = love.math.random(-0, 2000)
		Random1y = love.math.random(-0, 2000)
		Random2x = love.math.random(-0, 2000)
		Random2y = love.math.random(-0, 2000)
		Random3x = love.math.random(-0, 2000)
		Random3y = love.math.random(-0, 2000)
		Random4x = love.math.random(-0, 2000)
		Random4y = love.math.random(-0, 2000)
		Random5x = love.math.random(-0, 2000)
		Random5y = love.math.random(-0, 2000)
		Random6x = love.math.random(-0, 2000)
		Random6y = love.math.random(-0, 2000)
		Random7x = love.math.random(-0, 2000)
		Random7y = love.math.random(-0, 2000)
		Random8x = love.math.random(-0, 2000)
		Random8y = love.math.random(-0, 2000)
		Random9x = love.math.random(-0, 2000)
		Random9y = love.math.random(-0, 2000)
		rockx1 = Random1x
		rocky1 = Random1y
		rockx2 = Random2x
		rocky2 = Random2y
		rockx3 = Random3x
		rocky3 = Random3y
		rockx4 = Random4x
		rocky4 = Random4y
		rockx5 = Random5x
		rocky5 = Random5y
		rockx6 = Random6x
		rocky6 = Random6y
		rockx7 = Random7x
		rocky7 = Random7y
		rockx8 = Random8x
		rocky8 = Random8y
		rockx9 = Random9x
		rocky9 = Random9y
		rockbox1 = Collider:addRectangle(rockx1,rocky1,22,22)
		rockbox2 = Collider:addRectangle(rockx2,rocky2,22,22)
		rockbox3 = Collider:addRectangle(rockx3,rocky3,22,22)
		rockbox4 = Collider:addRectangle(rockx4,rocky4,22,22)
		rockbox5 = Collider:addRectangle(rockx5,rocky5,22,22)
		rockbox6 = Collider:addRectangle(rockx6,rocky6,22,22)
		rockbox7 = Collider:addRectangle(rockx7,rocky7,22,22)
		rockbox8 = Collider:addRectangle(rockx8,rocky8,22,22)
		rockbox9 = Collider:addRectangle(rockx9,rocky9,22,22)
		rockhit1 = false
		rockhit2 = false
		rockhit3 = false
		rockhit4 = false
		rockhit5 = false
		rockhit6 = false
		rockhit7 = false
		rockhit8 = false
		rockhit9 = false
		rockhealth1 = 10
		rockhealth2 = 10
		rockhealth3 = 10
		rockhealth4 = 10
		rockhealth5 = 10
		rockhealth6 = 10
		rockhealth7 = 10
		rockhealth8 = 10
		rockhealth9 = 10
		rockdestroyed1 = false
		rockdestroyed2 = false
		rockdestroyed3 = false
		rockdestroyed4 = false
		rockdestroyed5 = false
		rockdestroyed6 = false
		rockdestroyed7 = false
		rockdestroyed8 = false
		rockdestroyed9 = false
		ShipYours = false
		ExitShip = false
		shipdead = false
	end







	if GameMouseOnBtn == false and welcome == true then
		GameMouseDetect = 0
		love.audio.stop(GameSelect1M)
	end

	if GameMouseDetect == 1 and SetMute == false and welcome == true then
		love.audio.play(GameSelect1M)
	end

	if love.mouse.getX() > (GameArrowX + 326) and welcome == true then
		GameMouseBackArea = false
		GameMouseOnBtn = false
	end

	if love.mouse.getX() < GameArrowX and welcome == true then
		GameMouseBackArea = false
		GameMouseOnBtn = false
	end

	if love.mouse.getY() < 440 and welcome == true then
		GameMouseBackArea = false
		GameMouseOnBtn = false
	end

	if love.mouse.getY() > 485 and welcome == true then
		GameMouseBackArea = false
		GameMouseOnBtn = false
	end

	if love.mouse.getX() > GameArrowX and love.mouse.getX() < (GameArrowX + 326) and love.mouse.getY() > 440 and love.mouse.getY() < 485 and welcome == true then
		GameMouseBackArea = true
		GameMouseOnBtn = true
		GameMouseDetect = GameMouseDetect + 1
	end





	if GameOverMouseOnBtn == false and gameover == true then
		GameOverMouseDetect = 0
		love.audio.stop(GameSelect1M)
	end

	if GameOverMouseDetect == 1 and SetMute == false and gameover == true then
		love.audio.play(GameSelect1M)
	end

	if love.mouse.getX() > (GameOverArrowX + 385) and gameover == true then
		GameOverMouseBackArea = false
		GameOverMouseOnBtn = false
	end

	if love.mouse.getX() < GameOverArrowX and gameover == true then
		GameOverMouseBackArea = false
		GameOverMouseOnBtn = false
	end

	if love.mouse.getY() < 440 and gameover == true then
		GameOverMouseBackArea = false
		GameOverMouseOnBtn = false
	end

	if love.mouse.getY() > 485 and gameover == true then
		GameOverMouseBackArea = false
		GameOverMouseOnBtn = false
	end

	if love.mouse.getX() > GameOverArrowX and love.mouse.getX() < (GameOverArrowX + 385) and love.mouse.getY() > 440 and love.mouse.getY() < 485 and gameover == true then
		GameOverMouseBackArea = true
		GameOverMouseOnBtn = true
		GameOverMouseDetect = GameOverMouseDetect + 1
	end
end




	




function love.focus(f)
	if not f and not paused and not welcome then
		paused = true
		ht = false
   		love.mouse.setCursor(cursor)
	end
end







function game:draw()
	
	------ FILTERS ------
	game.GameBG:setFilter( 'nearest', 'nearest' )
	game.Player:setFilter( 'nearest', 'nearest' )
	game.Shot:setFilter( 'nearest', 'nearest' )

	Ship:setFilter( 'nearest', 'nearest' )
	
	rock1:setFilter( 'nearest', 'nearest' )
	rock2:setFilter( 'nearest', 'nearest' )
	rock3:setFilter( 'nearest', 'nearest' )
	rock4:setFilter( 'nearest', 'nearest' )
	rock5:setFilter( 'nearest', 'nearest' )
	rock6:setFilter( 'nearest', 'nearest' )
	rock7:setFilter( 'nearest', 'nearest' )
	rock8:setFilter( 'nearest', 'nearest' )
	rock9:setFilter( 'nearest', 'nearest' )



	------ FILTERS ------
	
	------ IN CAMERA ------
	game.Cam:attach()
	
	-- Images
	love.graphics.draw(game.GameBG, -2000, -2000)




	-- Gun
	for i, o in ipairs(game.Bullets) do
		love.graphics.draw(game.Shot, o.x, o.y, o.Dir)
		mouse12:moveTo(o.x, o.y)
	end
	-- Player
	
	






	if InShip == true then
		love.graphics.draw(Ship, ShipX, ShipY, ShipDir, 1, 1, Ship:getWidth()/2, Ship:getHeight()/2)
		shiphitbox:moveTo(ShipX, ShipY)
		shiphitbox1:moveTo(ShipX, ShipY)
		shiphitbox1:setRotation(ShipDir)
		shiphitbox:setRotation(ShipDir)

		playerhitbox:moveTo(game.PlayerX, game.PlayerY)
	elseif InShip == false then 
		shiphitbox1:moveTo(ShipX, ShipY)
		shiphitbox:moveTo(ShipX, ShipY)
		love.graphics.draw(Ship, ShipX, ShipY, shiphitbox:rotation(), 1, 1, Ship:getWidth()/2, Ship:getHeight()/2)

		love.graphics.draw(game.Player, game.PlayerX, game.PlayerY, PlayerRot, 1, 1, game.Player:getWidth()/2, game.Player:getHeight()/2)
		playerhitbox:moveTo(game.PlayerX, game.PlayerY)
		playerhitbox:setRotation(PlayerRot)
	end

	if ShipYes == true and InShip == false then 
		love.graphics.setFont( InteractFont )
		love.graphics.print('[ e ]', ShipX + 30, ShipY + 30)
	end
	
	--[[
	if playerhit == true then
		love.graphics.print('PLAYER HIT', game.PlayerX + 70, game.PlayerY + 70)
	end

	if playerhit == false then
		love.graphics.print('PLAYER NOT HIT', game.PlayerX + 70, game.PlayerY + 50)
	end

	if ShipYes == true then
		love.graphics.print('CAN GET IN SHIP', game.PlayerX + 70, game.PlayerY + 10)
	end

	if InShip == true then
		love.graphics.print('IN SHIP', game.PlayerX + 70, game.PlayerY + 30)
	end

	if shiphit == true then
		love.graphics.print('SHIP HIT', game.PlayerX + 70, game.PlayerY + 90)
	end

	if shiphit1 == true then
		love.graphics.print('SHIP HIT', game.PlayerX + 70, game.PlayerY + 90)
	end

	if shiphealth < 0 then
		love.graphics.print('SHIP DESTROYED', game.PlayerX + 70, game.PlayerY + 110)
	end

	if rockhit == true then
		love.graphics.print('ROCK HIT', game.PlayerX + 70, game.PlayerY - 10)
	end 

	playerhitbox:draw('line')
	shiphitbox:draw('line')
	shiphitbox1:draw('line')
	rockbox1:draw('line')
	rockbox2:draw('line')
	rockbox3:draw('line')
	rockbox4:draw('line')
	rockbox5:draw('line')
	rockbox6:draw('line')
	rockbox7:draw('line')
	rockbox8:draw('line')
	rockbox9:draw('line')

	]]--	


   	if rockdestroyed1 == false and Restart == false then
		love.graphics.draw(rock1, rockx1, rocky1, 0, 1, 1, rock1:getWidth()/2, rock1:getHeight()/2)
		rockbox1:moveTo(rockx1, rocky1)
	end

	if rockdestroyed2 == false and Restart == false then
		love.graphics.draw(rock2, rockx2, rocky2, 0, 1, 1, rock2:getWidth()/2, rock2:getHeight()/2)
		rockbox2:moveTo(rockx2, rocky2)
	end
	
	if rockdestroyed3 == false and Restart == false then
		love.graphics.draw(rock3, rockx3, rocky3, 0, 1, 1, rock3:getWidth()/2, rock3:getHeight()/2)
		rockbox3:moveTo(rockx3, rocky3)
	end

	if rockdestroyed4 == false and Restart == false then
		love.graphics.draw(rock4, rockx4, rocky4, 0, 1, 1, rock4:getWidth()/2, rock4:getHeight()/2)
		rockbox4:moveTo(rockx4, rocky4)
	end

	if rockdestroyed5 == false and Restart == false then
		love.graphics.draw(rock5, rockx5, rocky5, 0, 1, 1, rock5:getWidth()/2, rock5:getHeight()/2)
		rockbox5:moveTo(rockx5, rocky5)
	end

	if rockdestroyed6 == false and Restart == false then
		love.graphics.draw(rock6, rockx6, rocky6, 0, 1, 1, rock6:getWidth()/2, rock6:getHeight()/2)
		rockbox6:moveTo(rockx6, rocky6)
	end

	if rockdestroyed7 == false and Restart == false then
		love.graphics.draw(rock7, rockx7, rocky7, 0, 1, 1, rock7:getWidth()/2, rock7:getHeight()/2)
		rockbox7:moveTo(rockx7, rocky7)
	end

	if rockdestroyed8 == false and Restart == false then
		love.graphics.draw(rock8, rockx8, rocky8, 0, 1, 1, rock8:getWidth()/2, rock8:getHeight()/2)
		rockbox8:moveTo(rockx8, rocky8)
	end

	if rockdestroyed9 == false and Restart == false then
		love.graphics.draw(rock9, rockx9, rocky9, 0, 1, 1, rock9:getWidth()/2, rock9:getHeight()/2)
		rockbox9:moveTo(rockx9, rocky9)
	end
	



	game.Cam:detach()
	------ IN CAMERA -----

	love.graphics.setFont( welcomefont )
	
	love.graphics.setColor(20, 20, 20)
	love.graphics.rectangle("fill", 0, 0, 1280, 30 )
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 0, 30, 1280, 2 )
	
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 6, 5, 104, 18 )
	
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 9, 7, 100, 14 )
	
	love.graphics.setColor(20, 20, 20)
	love.graphics.rectangle("fill", HealthX, HealthY, 100, 14 )
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 107, 5, 3, 18 )
	love.graphics.print('Health', 23, 5)


	if ShipYours == true then
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 112, 5, 104, 18 )
		
		love.graphics.setColor(255, 0, 0)
		love.graphics.rectangle("fill", 115, 7, 100, 14 )

		love.graphics.setColor(20, 20, 20)
		love.graphics.rectangle("fill", ShipHealthX, ShipHealthY, 100, 14 )
	
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 215, 5, 3, 18 )
		love.graphics.print('Ship', 148, 5)
	end


	if gameover == true then
		
		game.PlayerY = 400
		game.PlayerX = 800
		game.ShotTime = 0
		game.ShotTimePlus = 0
		game.Bullets = { }
		game.GunShot = false
		game.GunShot1 = false

		love.mouse.setCursor(cursor)
		love.graphics.rectangle("fill", 185, 55, 910, 510 )
    	love.graphics.setColor(0, 0, 0)
    	love.graphics.rectangle("fill", 190, 60, 900, 500 )
    	love.graphics.setColor(255,255,255)
    	love.graphics.setFont( gameoverfont )
    	love.graphics.print('GAME OVER', 400, 120)
    	love.graphics.setFont( gameovertextfont )
		love.graphics.rectangle("fill", 450, BackBtnY + 5, 29, 35 )
  		love.graphics.rectangle("fill", 450 + 350, BackBtnY + 5, 29, 35 )
		love.graphics.print("Good game, well played,", 365, 230)
		love.graphics.print("my friend, however you", 365, 270)
		love.graphics.print("were utterly obliterated", 365, 310)
		love.graphics.print("in these circumstances", 365, 350)
		love.graphics.setFont( BackFont )
		love.graphics.print('Main Menu', 512, BackBtnY)
	end


    if welcome == true then
    	love.graphics.rectangle("fill", 185, 55, 910, 510 )
    	love.graphics.setColor(0, 0, 0)
    	love.graphics.rectangle("fill", 190, 60, 900, 500 )
    	love.graphics.setColor(255,255,255)
    	love.graphics.setFont( welcomefont )
		love.graphics.rectangle("fill", GameArrowX, BackBtnY + 5, 29, 35 )
		love.graphics.rectangle("fill", GameArrowX + 291, BackBtnY + 5, 29, 35 )
		love.graphics.print('Welcome!', 593, 110)
		love.graphics.print("Thank you for taking the time to test Piquant Interactive's project, Space Game.", 215, 176)
		love.graphics.print("The current version solely involves a minigame which has you battle inanimate", 215, 194)
		love.graphics.print("asteroids in a star field. Exhilarating, right??", 215, 212)
		love.graphics.print("Leave any feedback you may have at [http://www.reddit.com/r/piquant2013/]", 215, 248)
		love.graphics.print("as we love player interaction.", 215, 266)
		love.graphics.print("Controls:", 215, 302)
		love.graphics.print("Movement - W = Up, S = Down, A = Left, D = Right", 215, 320)
		love.graphics.print("Gun - Mouse = Aim, LeftClick = Shoot", 215, 338)
		love.graphics.print("Camera - X = Zoom In, Z = Zoom Out", 215, 356)
		love.graphics.print("Other - Esc = Pause, LeftShift = Sprint", 215, 374)
		love.graphics.setFont( BackFont )
		love.graphics.print('Continue', BackBtnX, BackBtnY)
	end
end

return game