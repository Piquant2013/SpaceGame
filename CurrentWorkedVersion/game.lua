-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates game as a new gamestate
game = Gamestate.new()

-- Loads camera script
local camera = require "vendors/camera"





HC = require 'vendors/hardoncollider'






pause = require 'pause'






function on_collision(dt, shape_a, shape_b)
end

function collision_stop(dt, shape_a, shape_b)
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




	Tired = false
	TiredTime = 0 
	Sprint = false
	PlayerSpeed = 70
	SprintTime = 0

	BackFont = love.graphics.newFont("fonts/xen3.ttf", 50)
	welcomefont = love.graphics.newFont("fonts/xen3.ttf", 20)
	
	welcome = true
	zoomcam = false
	paused = false
	
	BackBtnY = 440	
	BackBtnX = 530
	GameArrowX = 480
	GameSelect1M = love.audio.newSource("audio/sel.ogg")
	EnterGame = love.audio.newSource("audio/enter.ogg")

	Collider = HC(100,on_collision , collision_stop)

	rockcol = true
	rockx = 800
	rocky = 300
	rock = love.graphics.newImage("images/rock.png")
	rockhitbox = Collider:addRectangle(rockx,rocky,22,22)

	rockcol2 = true
	rock2x = 500
	rock2y = 350
	rock2 = love.graphics.newImage("images/rock.png")
	rock2hitbox = Collider:addRectangle(rock2x,rock2y,22,22)

	rockcol3 = true
	rock3x = 100
	rock3y = 900
	rock3 = love.graphics.newImage("images/rock.png")
	rock3hitbox = Collider:addRectangle(rock3x,rock3y,22,22)

	rockcol4 = true
	rock4x = 470
	rock4y = 780
	rock4 = love.graphics.newImage("images/rock.png")
	rock4hitbox = Collider:addRectangle(rock4x,rock4y,22,22)

	rockcol5 = true
	rock5x = 200
	rock5y = 500
	rock5 = love.graphics.newImage("images/rock.png")
	rock5hitbox = Collider:addRectangle(rock5x,rock5y,22,22)

	rockcol6 = true
	rock6x = 1000
	rock6y = 700
	rock6 = love.graphics.newImage("images/rock.png")
	rock6hitbox = Collider:addRectangle(rock6x,rock6y,22,22)

	rockcol7 = true
	rock7x = 150
	rock7y = 480
	rock7 = love.graphics.newImage("images/rock.png")
	rock7hitbox = Collider:addRectangle(rock7x,rock7y,22,22)

	rockcol8 = true
	rock8x = 340
	rock8y = 650
	rock8 = love.graphics.newImage("images/rock.png")
	rock8hitbox = Collider:addRectangle(rock8x,rock8y,22,22)

	rockcol9 = true
	rock9x = 660
	rock9y = 700
	rock9 = love.graphics.newImage("images/rock.png")
	rock9hitbox = Collider:addRectangle(rock9x,rock9y,22,22)

	rockcol10 = true
	rock10x = 940
	rock10y = 40
	rock10 = love.graphics.newImage("images/rock.png")
	rock10hitbox = Collider:addRectangle(rock10x,rock10y,22,22)

	rockcol11 = true
	rock11x = 1100
	rock11y = 780
	rock11 = love.graphics.newImage("images/rock.png")
	rock11hitbox = Collider:addRectangle(rock11x,rock11y,22,22)

	rockcol12 = true
	rock12x = 230
	rock12y = 850
	rock12 = love.graphics.newImage("images/rock.png")
	rock12hitbox = Collider:addRectangle(rock12x,rock12y,22,22)

	mouse12 = Collider:addRectangle(400,500, 1, 1)


	playerhitbox = Collider:addRectangle(game.PlayerX, game.PlayerY,16,16)


	ShipX = 270
	ShipY = 890
	Ship = love.graphics.newImage("images/ship1.png")
	shiphitbox = Collider:addRectangle(ShipX,ShipY,78,48)





	GameMouseBackArea = false
	GameMouseDetect = 0
	GameMouseOnBtn = false






end

function game:keypressed(key)










	if key == "escape" and paused == false then
   		paused = true
   		ht = false
   		love.mouse.setCursor(cursor)
  	end





  	if key =="return" and welcome == true then
  		Restart = false
  		welcome = false
  		love.mouse.setCursor(crosshair)
  		love.audio.play(EnterGame)
  	end




    if key == "x" and zoomcam == false then
		game.Cam:zoom(2)
		zoomcam = true
	end

	if key == "z" and zoomcam == true then
		game.Cam:zoom(0.5)
		zoomcam = false
	end




	if key == "e" and shipyes == true then
		PlayerSpeed = 250
	end



end


function game:mousepressed(mx, my, button)

	-- Gun
	if button == "l" and game.ShotTime <= 0 then
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
	if button == "l" and game.GunShot == true and welcome == false then
		love.audio.play(game.GunSound)
		love.audio.stop(game.GunSound1)
		game.GunShot1 = false
	end

	-- Gun Sounds
	if button == "l" and game.GunShot1 == false and welcome == false then
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



end

function game:update(dt)

	------ CAMERA ------
	dx,dy = (game.PlayerX) - game.Cam.x, (game.PlayerY) - game.Cam.y
	game.Cam:move(dx/2, dy/2)
	mx1,my1 = game.Cam:mousepos()
	------ CAMERA ------

	------ PLAYER MOVEMENT ------
	if love.keyboard.isDown("a") then
		game.PlayerX = game.PlayerX - PlayerSpeed * dt
    end

	if love.keyboard.isDown("d") then
		game.PlayerX = game.PlayerX + PlayerSpeed * dt
    end

	if love.keyboard.isDown("w") then
		game.PlayerY = game.PlayerY - PlayerSpeed * dt
    end

	if love.keyboard.isDown("s") then
		game.PlayerY = game.PlayerY + PlayerSpeed * dt
    end







    SprintTime = SprintTime + dt

    if love.keyboard.isDown("lshift") then
		PlayerSpeed = 130
		Sprint = true
    end

    if not love.keyboard.isDown("lshift") then
		PlayerSpeed = 70
		Sprint = false
    end

    if Sprint == true and SprintTime > 5 then
    	Tired = true
    	PlayerSpeed = 70
    end

    if Sprint == false then
    	SprintTime = 0
    end

    if Tired == true and Sprint == false then
    	PlayerSpeed = 70
    	TiredTime = TiredTime + dt
    	SprintTime = 0
    end

    if TiredTime > 1.7 then
    	Tired = false
    	TiredTime = 0
    end

    if Tired == true and Sprint == true then
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
			end
	end
	------ GUN ------

	-- Player rotation with the mouse pointer
	PlayerRot = math.atan2(mx1 - game.PlayerX, game.PlayerY - my1) - math.pi / 2
	










	if rockhitbox:collidesWith(mouse12) then
    	Collider:remove(rockhitbox)
    	rockcol = false
    	--table.remove(game.Bullets, i)
	end

	if rock2hitbox:collidesWith(mouse12) then
    	Collider:remove(rock2hitbox)
    	rockcol2 = false
    	--table.remove(game.Bullets, i)
	end

	if rock3hitbox:collidesWith(mouse12) then
    	Collider:remove(rock3hitbox)
    	rockcol3 = false
    	--table.remove(game.Bullets, i)
	end

	if rock4hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol4 = false
    	--table.remove(game.Bullets, i)
	end

	if rock5hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol5 = false
    	--table.remove(game.Bullets, i)
	end

	if rock6hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol6 = false
    	--table.remove(game.Bullets, i)
	end

	if rock7hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol7 = false
    	--table.remove(game.Bullets, i)
	end

	if rock8hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol8 = false
    	--table.remove(game.Bullets, i)
	end

	if rock9hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol9 = false
    	--table.remove(game.Bullets, i)
	end

	if rock10hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol10 = false
    	--table.remove(game.Bullets, i)
	end

	if rock11hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol11 = false
    	--table.remove(game.Bullets, i)
	end

	if rock12hitbox:collidesWith(mouse12) then
    	Collider:remove(rock4hitbox)
    	rockcol12 = false
    	--table.remove(game.Bullets, i)
	end





	if shiphitbox:collidesWith(playerhitbox) then
    	--shipyes = true
    	PlayerSpeed = 250
    	ShipX = game.PlayerX
    	ShipY = game.PlayerY
	end





    Collider:update(dt)








	if paused == true then
		Gamestate.switch(pause)
	end 








	if Restart == true then
	welcome = true
	zoomcam = false
	paused = false
	game.PlayerY = 400
	game.PlayerX = 800
	game.ShotTime = 0
	game.ShotTimePlus = 0
	game.Bullets = { }
	game.GunShot = false
	game.GunShot1 = false
	game.Cam = camera(game.PlayerX, game.PlayerY, 2.5)
	Tired = false
	TiredTime = 0 
	Sprint = false
	PlayerSpeed = 70
	SprintTime = 0
	Collider = HC(100,on_collision , collision_stop)
	rockcol = true
	rockx = 800
	rocky = 300
	rockhitbox = Collider:addRectangle(rockx,rocky,22,22)
	rockcol2 = true
	rock2x = 500
	rock2y = 350
	rock2hitbox = Collider:addRectangle(rock2x,rock2y,22,22)
	rockcol3 = true
	rock3x = 100
	rock3y = 900
	rock3hitbox = Collider:addRectangle(rock3x,rock3y,22,22)
	rockcol4 = true
	rock4x = 470
	rock4y = 780
	rock4hitbox = Collider:addRectangle(rock4x,rock4y,22,22)
	rockcol5 = true
	rock5x = 200
	rock5y = 500
	rock5hitbox = Collider:addRectangle(rock5x,rock5y,22,22)
	rockcol6 = true
	rock6x = 1000
	rock6y = 700
	rock6hitbox = Collider:addRectangle(rock6x,rock6y,22,22)
	rockcol7 = true
	rock7x = 150
	rock7y = 480
	rock7hitbox = Collider:addRectangle(rock7x,rock7y,22,22)
	rockcol8 = true
	rock8x = 340
	rock8y = 650
	rock8hitbox = Collider:addRectangle(rock8x,rock8y,22,22)
	rockcol9 = true
	rock9x = 660
	rock9y = 700
	rock9hitbox = Collider:addRectangle(rock9x,rock9y,22,22)
	rockcol10 = true
	rock10x = 940
	rock10y = 40
	rock10hitbox = Collider:addRectangle(rock10x,rock10y,22,22)
	rockcol11 = true
	rock11x = 1100
	rock11y = 780
	rock11hitbox = Collider:addRectangle(rock11x,rock11y,22,22)
	rockcol12 = true
	rock12x = 230
	rock12y = 850
	rock12hitbox = Collider:addRectangle(rock12x,rock12y,22,22)
	mouse12 = Collider:addRectangle(400,500, 1, 1)
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



	rock:setFilter( 'nearest', 'nearest' )
	Ship:setFilter( 'nearest', 'nearest' )



	------ FILTERS ------
	
	------ IN CAMERA ------
	game.Cam:attach()
	
	-- Images
	love.graphics.draw(game.GameBG, -2000, -2000)




	-- Gun
	for i, o in ipairs(game.Bullets) do
		love.graphics.draw(game.Shot, o.x, o.y, o.Dir)
		mouse12:moveTo(o.x, o.y)
		--mouse12:draw('line')
		--mouse12:setRotation(o.Dir - 300)
	end
	-- Player
	love.graphics.draw(game.Player, game.PlayerX, game.PlayerY, PlayerRot, 1, 1, game.Player:getWidth()/2, game.Player:getHeight()/2)
	




	if rockcol == true then
	love.graphics.draw(rock, rockx, rocky)
    --rockhitbox:draw('line')
    end

    if rockcol2 == true then
    love.graphics.draw(rock, rock2x, rock2y)
    --rock2hitbox:draw('line')
    end

    if rockcol3 == true then
    love.graphics.draw(rock, rock3x, rock3y)
    --rock3hitbox:draw('line')
    end

    if rockcol4 == true then
    love.graphics.draw(rock, rock4x, rock4y)
    --rock4hitbox:draw('line')
	end

	if rockcol5 == true then
    love.graphics.draw(rock, rock5x, rock5y)
    --rock4hitbox:draw('line')
	end

	if rockcol6 == true then
    love.graphics.draw(rock, rock6x, rock6y)
    --rock4hitbox:draw('line')
	end

	if rockcol7 == true then
    love.graphics.draw(rock, rock7x, rock7y)
    --rock4hitbox:draw('line')
	end

	if rockcol8 == true then
    love.graphics.draw(rock, rock8x, rock8y)
    --rock4hitbox:draw('line')
	end

	if rockcol9 == true then
    love.graphics.draw(rock, rock9x, rock9y)
    --rock4hitbox:draw('line')
	end

	if rockcol10 == true then
    love.graphics.draw(rock, rock10x, rock10y)
    --rock4hitbox:draw('line')
	end

	if rockcol11 == true then
    love.graphics.draw(rock, rock11x, rock11y)
    --rock4hitbox:draw('line')
	end

	if rockcol12 == true then
    love.graphics.draw(rock, rock12x, rock12y)
    --rock4hitbox:draw('line')
	end




	love.graphics.draw(Ship, ShipX, ShipY)
	shiphitbox:draw('line')

	playerhitbox:draw('line')
	playerhitbox:moveTo(game.PlayerX, game.PlayerY)
	shiphitbox:moveTo(ShipX, ShipY)






	game.Cam:detach()
	------ IN CAMERA ------

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