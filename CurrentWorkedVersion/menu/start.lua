-- USING --
local Gamestate = require 'libs/hump/gamestate'
menu = require 'menu/menu'

-- This gamestate
start = Gamestate.new()


function start:init()

	------ VARIABLES ------
	self.movelogo = 128
	self.eggtimer = 0
	self.easteregg = false
	self.eggcount = 0
	self.bgx = -2
	self.bgscroll = 50
	self.skiptimer = 0
	self.entermenu = false
	------ VARIABLES ------

	------ IMAGES ------
	self.gamelogo = love.graphics.newImage("images/menu/gamelogo.png")
	self.bg = love.graphics.newImage("images/menu/menubg.png")
	------ IMAGES ------

	------ FONTS ------
	self.font0 = love.graphics.newFont("fonts/xen3.ttf", 15) --10
	self.font1 = love.graphics.newFont("fonts/xen3.ttf", 20) --15
	self.font2 = love.graphics.newFont("fonts/xen3.ttf", 30) --20
	self.font3 = love.graphics.newFont("fonts/xen3.ttf", 40) --30
	self.font4 = love.graphics.newFont("fonts/xen3.ttf", 50) --40
	self.font5 = love.graphics.newFont("fonts/xen3.ttf", 50) --50
	self.font6 = love.graphics.newFont("fonts/xen3.ttf", 20) --60
	self.font7 = love.graphics.newFont("fonts/xen3.ttf", 25) --70
	self.font8 = love.graphics.newFont("fonts/xen3.ttf", 60) --80
	self.font9 = love.graphics.newFont("fonts/xen3.ttf", 80) --90
	------ FONTS ------

	------ FILTERS ------
	self.gamelogo:setFilter( 'nearest', 'nearest' )
	self.bg:setFilter( 'nearest', 'nearest' )
	self.font0:setFilter( 'nearest', 'nearest' )
	self.font1:setFilter( 'nearest', 'nearest' )
	self.font2:setFilter( 'nearest', 'nearest' )
	self.font3:setFilter( 'nearest', 'nearest' )
	self.font4:setFilter( 'nearest', 'nearest' )
	self.font5:setFilter( 'nearest', 'nearest' )
	self.font6:setFilter( 'nearest', 'nearest' )
	self.font7:setFilter( 'nearest', 'nearest' )
	self.font8:setFilter( 'nearest', 'nearest' )
	self.font9:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------
	
	------ AUDIO ------
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.music = love.audio.newSource("audio/music/menu.ogg")
	self.colorgoeshere = love.audio.newSource("audio/music/colorgoeshere.ogg")
	------ AUDIO ------

	-- Play music
	love.audio.play(self.music)
	self.music:setLooping(true)

	-- Set mouse visibility
	love.mouse.setVisible(true)
end

function start:update(dt)

	--- SKIP TEXT ---
	self.skiptimer = self.skiptimer + dt
	
	if self.skiptimer > 4 then
		Gamestate.push(menu)
		paused = false
	end

	if self.skiptimer > 4.5 then
		self.skiptimer = 0
	end
	--- SKIP TEXT ---

	-- Skip to menu
	if self.entermenu == true then
		Gamestate.push(menu)
		love.audio.play(self.entersound)
		paused = false
		self.entermenu = false
	end

	-- Update easter egg
	start:colorupdate(dt)
end

function start:colorupdate(dt)

-- COLOR GOES HERE EASTER EGG --
	if self.easteregg == true then
		love.audio.play(self.colorgoeshere)
		love.audio.stop(self.music)
		self.eggtimer = 0
		self.eggcount = 0
	end

	if self.easteregg == false then
		love.audio.stop(self.colorgoeshere)
	end

	self.eggtimer = self.eggtimer + dt

	if self.eggtimer > 4 then
		self.eggtimer = 0
		self.eggcount = 0
	end
	-- COLOR GOES HERE EASTER EGG --
end

function start:colorkeypressed(key)

	-- SEQUENCE FOR EASTER EGG --
	if key == "c" then
		self.eggcount = self.eggcount + 1
		self.eggtimer = 0
	end

	if key == "g" and self.eggcount == 1 and self.eggtimer < 2 then
		self.eggcount = self.eggcount + 1
	end

	if key == "h" and self.eggcount == 2 and self.eggtimer < 4 then
		self.easteregg = true
		self.eggcount = 0
	end
	-- SEQUENCE FOR EASTER EGG --
end

function start:keypressed(key)

	-- Move on to menu
	if key == "space" or key == "return" or key == "esc" then
		self.entermenu = true
	end

	start:colorkeypressed(key)
end

function start:mousepressed(mx, my, button)

	-- Move on to menu
	if button == 1 or button == 2 then
		self.entermenu = true
	end
end

function start:draw()

	------ TEXT ------
	love.graphics.setFont( self.font3 )
	love.graphics.setColor(255, 255, 255)
	love.graphics.print('A FEW YEARS FROM NOW IN THE CURRENT GALAXY,', (love.graphics.getWidth( )/2-self.font3:getWidth("A FEW YEARS FROM NOW IN THE CURRENT GALAXY,")/2), (love.graphics.getHeight( )/2 - self.font3:getHeight( "PUSH START BUTTON" )/2 - 20))
	love.graphics.print('BUT FAR FAR BETTER....', (love.graphics.getWidth( )/2-self.font3:getWidth("BUT FAR FAR BETTER....")/2) - 260, (love.graphics.getHeight( )/2 - self.font3:getHeight( "PUSH START BUTTON" )/2 + 30))
	love.graphics.setColor(255, 255, 255, 255)
	------ TEXT ------
end

return start