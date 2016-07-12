-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Loads Hardon Collider script
local HC = require 'libs/hardoncollider'

-- Loads gamestate script
game = require 'game/game'

-- Creates endless as a new gamestate
spacestation = Gamestate.new()


function spacestation:init()

	------ VARIABLES ------
	game:init()
	------ VARIABLES ------

	------ IMAGES ------
	self.bg = love.graphics.newImage("images/maps/spacestation.png")
	------ IMAGES ------
end

function spacestation:keypressed(key)
	game:keypressed(key)
end

function spacestation:mousepressed(mx, my, button)
	game:mousepressed(mx, my, button)
end

function spacestation:update(dt)

	-- update main game mechanics
	game:update(dt)

	-- SET UP GAME --
	-- Reset the game
	if setendless == true then

		-- Player
		plyr.y = 2000
		plyr.x = 1000
		plyr.speed = 28
		plyr.health = 100
		plyr.hurt = false
		plyr.colliding = false
		player.hurttimer = 0
		player.flashred = false
		player.autoheal = true
		player.maxhealth = 100

		-- Pistol
		crpistol.crp.y = plyr.y
		crpistol.crp.x = plyr.x
		crpistol.cooldown = 0
		crpistol.cooldownplus = 0
		crpistol.bullets = {}

		-- gameover or welcome screens
		welcomescreen = true
		gameover = false

		-- Globals
		paused = false
		
		-- hardon collider
		Collider = HC(100, on_collision, collision_stop)
		plyr.bb = Collider:addRectangle(plyr.x, plyr.y, plyr.w, plyr.h)
		self.wallT = Collider:addRectangle(188, 120, 850, 16)
    	self.wallB = Collider:addRectangle(188, 580, 850, 16)
    	self.wallL = Collider:addRectangle(170, 120, 16, 476)
    	self.wallR = Collider:addRectangle(1040, 120, 16, 476)
    	self.tree1 = Collider:addCircle(334, 282, 10)
    	self.tree2 = Collider:addCircle(817, 259, 10)
    	self.tree3 = Collider:addCircle(900, 457, 10)
    	self.tree4 = Collider:addCircle(610, 356, 80)
	end
	-- SET UP GAME --
end

function spacestation:draw()

	------ FILTERS ------
	self.bg:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	------ CAMERA ------
	game.Cam:attach()
	
	love.graphics.draw(self.bg, 0, 0)
	game:draw()

	game.Cam:detach()
	------ CAMERA ------

	game:drawhud()
	game:drawwelcome()
end

return spacestation