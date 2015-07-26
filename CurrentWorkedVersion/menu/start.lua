-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Loads menu script
menu = require 'menu/menu'

-- Creates start as a new gamestate
start = Gamestate.new()


function start:init()

	------ VARIABLES ------
	-- logo
	self.movelogo = 128

	-- Color goes here easter egg variables
	self.eggtimer = 0
	self.easteregg = false
	self.eggcount = 0

	-- Backgrounds x and scroll speed
	self.bgx = -2
	self.bgscroll = 50

	-- skip timer
	self.skiptimer = 0
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
	
	------ AUDIO ------
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.music = love.audio.newSource("audio/music/menu.ogg")
	self.colorgoeshere = love.audio.newSource("audio/music/colorgoeshere.ogg")
	------ AUDIO ------

	-- play menu music and set to loop
	love.audio.play(self.music)
	self.music:setLooping(true)

	-- Set mouse visibility to true
	love.mouse.setVisible(true)
end

function start:update(dt)

	--- SKIP TEXT ---
	-- start skip timer
	self.skiptimer = self.skiptimer + dt
	
	-- skip times
	if self.skiptimer > 4 then
		Gamestate.push(menu)
		paused = false
	end

	if self.skiptimer > 4.5 then
		self.skiptimer = 0
	end
	--- SKIP TEXT ---

	-- Update easter egg
	start:colorupdate(dt)
end

function start:colorupdate(dt)

-- COLOR GOES HERE EASTER EGG --
	-- Activate the easter egg
	if self.easteregg == true then
		love.audio.play(self.colorgoeshere)
		love.audio.stop(self.music)
		self.eggtimer = 0
		self.eggcount = 0
	end

	-- If egg is false stop audio
	if self.easteregg == false then
		love.audio.stop(self.colorgoeshere)
	end

	-- Starts the egg timer
	self.eggtimer = self.eggtimer + dt

	-- Reset timer if over a certain time
	if self.eggtimer > 4 then
		self.eggtimer = 0
		self.eggcount = 0
	end
	-- COLOR GOES HERE EASTER EGG --
end

function start:colorkeypressed(key)

	-- SEQUENCE FOR EASTER EGG --
	-- Starts easter eggs sequence and resets it
	if key == "c" then
		self.eggcount = self.eggcount + 1
		self.eggtimer = 0
	end

	-- Only works if pressed within time of pressing previous
	if key == "g" and self.eggcount == 1 and self.eggtimer < 2 then
		self.eggcount = self.eggcount + 1
	end

	-- Only works if pressed within time of pressing previous
	if key == "h" and self.eggcount == 2 and self.eggtimer < 4 then
		self.easteregg = true
		self.eggcount = 0
	end
	-- SEQUENCE FOR EASTER EGG --
end

function start:keypressed(key)

	-- move onto the menu script
	if key == " " or key == "return" or key == "esc" then
		Gamestate.push(menu)
		love.audio.play(self.entersound)
		paused = false
	end

	-- Keypressed for easter egg
	start:colorkeypressed(key)
end

function start:mousepressed(mx, my, button)

	-- move onto the menu script
	if button == "l" or button == "r" then
		Gamestate.push(menu)
		love.audio.play(self.entersound)
		paused = false
	end
end

function start:draw()

	------ FILTERS ------
	self.font3:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ TEXT ------
	love.graphics.setFont( self.font3 )
	love.graphics.setColor(255, 255, 255)
	love.graphics.print('A FEW YEARS FROM NOW IN THE CURRENT GALAXY,', (love.graphics.getWidth( )/2-self.font3:getWidth("A FEW YEARS FROM NOW IN THE CURRENT GALAXY,")/2), (love.graphics.getHeight( )/2 - self.font3:getHeight( "PUSH START BUTTON" )/2 - 20))
	love.graphics.print('BUT FAR FAR MUCH BETTER....', (love.graphics.getWidth( )/2-self.font3:getWidth("BUT FAR FAR MUCH BETTER....")/2) - 200, (love.graphics.getHeight( )/2 - self.font3:getHeight( "PUSH START BUTTON" )/2 + 30))
	love.graphics.setColor(255, 255, 255, 255)
	------ TEXT ------
end

return start