-- Loads gamestate script
local Gamestate = require 'vendors/gamestate'

-- Creates game as a new gamestate
local game = Gamestate.new()

-- Loads camera script
local camera = require "vendors/camera"


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
end

function game:keypressed(key)
    if key == 'escape' then

    	-- Set system cursor
    	love.mouse.setCursor(cursor)

        -- Tells the game script to unload itslef and go back to previous gamestate in stack
        -- JUST PAUSES FOR NOW
        Gamestate.pop()
    	
    	-- Stops game music and plays menu music
    	love.audio.play(MenuMusic)
		MenuMusic:setLooping(true)
		love.audio.stop(GameMusic)
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
				Speed = 350
			})
			game.ShotTime = game.ShotTimePlus
	end

	-- Gun Sounds
	if button == "l" and game.GunShot == true then
		love.audio.play(game.GunSound)
		love.audio.stop(game.GunSound1)
		game.GunShot1 = false
	end

	-- Gun Sounds
	if button == "l" and game.GunShot1 == false then
		love.audio.play(game.GunSound1)
		love.audio.stop(game.GunSound)
		game.GunShot = true
	end
end

function game:update(dt)

	------ CAMERA ------
	dx,dy = (game.PlayerX + 8) - game.Cam.x, (game.PlayerY + 10) - game.Cam.y
	game.Cam:move(dx/2, dy/2)
	mx1,my1 = game.Cam:mousepos()
	------ CAMERA ------

	------ PLAYER MOVEMENT ------
	if love.keyboard.isDown("a") then
		game.PlayerX = game.PlayerX - 50 * dt
    end

	if love.keyboard.isDown("d") then
		game.PlayerX = game.PlayerX + 50 * dt
    end

	if love.keyboard.isDown("w") then
		game.PlayerY = game.PlayerY - 50 * dt
    end

	if love.keyboard.isDown("s") then
		game.PlayerY = game.PlayerY + 50 * dt
    end
    ------ PLAYER MOVEMENT ------

	------ GUN ------
	game.ShotTime = math.max(0, game.ShotTime - dt)
		
	for i, o in ipairs(game.Bullets) do
		o.x = o.x + math.cos(o.Dir) * o.Speed * dt
		o.y = o.y + math.sin(o.Dir) * o.Speed * dt
			if (o.x > (game.PlayerX + 280) or (o.x < (game.PlayerX - 280)))
			or (o.y > (game.PlayerY + 280) or (o.y < (game.PlayerY - 280))) then
				table.remove(game.Bullets, i)
			end
	end
	------ GUN ------

	-- Player rotation with the mouse pointer
	PlayerRot = math.atan2(mx1 - game.PlayerX, game.PlayerY - my1) - math.pi / 2
end

function game:draw()
	
	------ FILTERS ------
	game.GameBG:setFilter( 'nearest', 'nearest' )
	game.Player:setFilter( 'nearest', 'nearest' )
	game.Shot:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	------ IN CAMERA ------
	game.Cam:attach()
	
	-- Images
	love.graphics.draw(game.GameBG, -2000, -2000)

	-- Gun
	for i, o in ipairs(game.Bullets) do
		love.graphics.draw(game.Shot, o.x, o.y)
	end
	
	-- Player
	love.graphics.draw(game.Player, game.PlayerX, game.PlayerY, PlayerRot, 1, 1, game.Player:getWidth()/3, game.Player:getHeight()/2)
	
	game.Cam:detach()
	------ IN CAMERA ------

	-- Temporary message to help the player get back to the main menu
	love.graphics.print("Press Esc to return to the menu", 5, 5)
end

return game