-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates moregames as a new gamestate
moregames = Gamestate.new()


function moregames:init()

	------ VARIABLES ------
	-- mouse button state
	self.nextstatemouse = false
	self.backstatemouse = false

	-- Mouse Dectect vars for sound
	self.mouseovernext = false
	self.mouseoverback = false
	self.mousedetect1 = 0
	self.mousedetect2 = 0

	-- Page vars
	self.zomb = true
	self.dig = false
	self.page2 = false

	-- fade
	self.fade = 100
	------ VARIABLES ------

	------ IMAGES ------
	self.logodig = love.graphics.newImage("images/menu/logodig.png")
	self.screendig = love.graphics.newImage("images/menu/screendig.png")
	self.logozombie = love.graphics.newImage("images/menu/logozombie.png")	
	self.screenzombie1 = love.graphics.newImage("images/menu/screenspace1.png")
	self.screenzombie2 = love.graphics.newImage("images/menu/screenspace2.png")
	self.zombiebg = love.graphics.newImage("images/menu/zombiebg.png")
	------ IMAGES ------

	------ AUDIO ------
	self.select1 = love.audio.newSource("audio/buttons/select.ogg")
	self.select2 = love.audio.newSource("audio/buttons/select.ogg")
	self.entersound = love.audio.newSource("audio/buttons/enter.ogg")
	self.backsound = love.audio.newSource("audio/buttons/enter.ogg")
	self.mouseover1 = love.audio.newSource("audio/buttons/select.ogg")
	self.mouseover2 = love.audio.newSource("audio/buttons/select.ogg")
	------ AUDIO ------
end

function moregames:keypressed(key)

	-- Go to right page
	if key == "right" and self.page2 == false or key == "d" and self.page2 == false then
		love.audio.play(self.select1)
		love.audio.stop(self.select2)
		self.page2 = true
	end

	-- go to left page
	if key == "left" and self.page2 == true or key == "a" and self.page2 == true then
		love.audio.stop(self.select1)
		love.audio.play(self.select2)
		self.page2 = false
	end
	
	-- Takes you back to the main menu
	if key == "escape" or key == "return" or key == " " then
		Gamestate.pop()
		love.audio.play(self.backsound)
		love.audio.stop(options.entersound1)
		self.fade = 100
	end
end

function moregames:mousepressed(mx, my, button)

	-- Takes you back to the main menu
	if button == "r" then
		Gamestate.pop()
		love.audio.play(self.backsound)
		love.audio.stop(options.entersound1)
		self.fade = 100
	end

	-- Go to the next page
	if button == "l" and self.mouseovernext == true and self.dig == false then
		love.audio.stop(self.select1)
		love.audio.play(self.select2)
		self.page2 = true
	end

	-- go to the next page
	if button == "l" and self.mouseovernext == true and self.zomb == false then
		love.audio.play(self.select1)
		love.audio.stop(self.select2)
		self.page2 = false
	end
	
	-- Takes you back to the main menu
	if button == "l" and self.mouseoverback == true then
		Gamestate.pop()
		love.audio.play(self.backsound)
		love.audio.stop(options.entersound1)
	end
end

function moregames:update(dt)

	-- FLASH WHITE --
	self.fade = self.fade + dt - 2

	if self.fade < 0 then
		self.fade = 0
	end
	-- FLASH WHITE --

	-- Set the current page
	if self.page2 == true then
		self.zomb = false
		self.dig = true
	elseif self.page2 == false then
		self.dig = false
		self.zomb = true
	end

	-- MOUSE AREAS --
	-- Mouse area of next button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font7:getWidth( "< 1/2 >" )/2 + 565) + start.font7:getWidth( "< 1/2 >" ) and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font7:getWidth( "< 1/2 >" )/2 + 565) and love.mouse.getY() > (love.graphics.getHeight()/2 - 25/2 + 322) and love.mouse.getY() < (love.graphics.getHeight()/2 - 25/2 + 322) + start.font7:getHeight( "< 1/2 >" ) then
		self.nextstatemouse = true
		self.backstatemouse = false
		self.scaleback = 1
		self.scalenext = 1.2
		self.mouseovernext = true
		self.mouseoverback = false
		self.mousedetect1 = self.mousedetect1 + 1
		self.mousedetect2 = 0
	end

	-- Mouse area of back button
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font7:getWidth( "< BACK" )/2 - 565 + start.font7:getWidth( "< BACK" )) and love.mouse.getX() > (love.graphics.getWidth()/2 - start.font7:getWidth( "< BACK" )/2) - 565 and love.mouse.getY() > (love.graphics.getHeight()/2 - 25/2 - 322) and love.mouse.getY() < (love.graphics.getHeight()/2 - 25/2 - 322) + start.font7:getHeight( "< BACK" ) then
		self.nextstatemouse = false
		self.backstatemouse = true
		self.scaleback = 1.2
		self.scalenext = 1
		self.mouseovernext = false
		self.mouseoverback = true
		self.mousedetect1 = 0
		self.mousedetect2 = self.mousedetect2 + 1
	end
	-- MOUSE AREAS --

	-- MOUSE OUT OF AREA --
	-- Out of areas for the back button
	if love.mouse.getX() > (love.graphics.getWidth()/2 - start.font7:getWidth( "< BACK" )/2) - 565 + start.font7:getWidth( "< BACK" ) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end 
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font7:getWidth( "< BACK" )/2) - 565 then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end

	if love.mouse.getY() < (love.graphics.getHeight()/2 - 25/2 - 322) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end 

	if love.mouse.getY() > (love.graphics.getHeight()/2 - 25/2 - 322) + start.font7:getHeight( "< BACK" ) then
		self.backstatemouse = false
		self.mouseoverback = false
		self.scaleback = 1
	end

	-- Out of areas for the next button
	if love.mouse.getX() > (love.graphics.getWidth()/2 - start.font7:getWidth( "< 1/2 >" )/2 + 565) + start.font7:getWidth( "< 1/2 >" ) then
		self.nextstatemouse = false
		self.mouseovernext = false
		self.scalenext = 1
	end 
	
	if love.mouse.getX() < (love.graphics.getWidth()/2 - start.font7:getWidth( "< 1/2 >" )/2 + 565) then
		self.nextstatemouse = false
		self.mouseovernext = false
		self.scalenext = 1
	end

	if love.mouse.getY() < (love.graphics.getHeight()/2 - 25/2 + 322) then
		self.nextstatemouse = false
		self.mouseovernext = false
		self.scalenext = 1
	end 

	if love.mouse.getY() > (love.graphics.getHeight()/2 - 25/2 + 322) + start.font7:getHeight( "< 1/2 >" ) then
		self.nextstatemouse = false
		self.mouseovernext = false
		self.scalenext = 1
	end
	-- MOUSE OUT OF AREA --

	-- MOUSE DECTECTS --
	if self.mouseovernext == false then
		self.mousedetect1 = 0
		love.audio.stop(self.mouseover1)
	end

	if self.mouseoverback == false then
		self.mousedetect2 = 0
		love.audio.stop(self.mouseover2)
	end

	if self.mousedetect1 == 1 then
		love.audio.play(self.mouseover1)
		love.audio.stop(self.mouseover2)
	end

	if self.mousedetect2 == 1 then
		love.audio.stop(self.mouseover1)
		love.audio.play(self.mouseover2)
	end
	-- MOUSE DECTECTS --
end

function moregames:draw()
	
	------ FILTERS ------
	self.logozombie:setFilter( 'nearest', 'nearest' )
	self.logodig:setFilter( 'nearest', 'nearest' )
	self.zombiebg:setFilter( 'nearest', 'nearest' )
	self.screenzombie1:setFilter( 'nearest', 'nearest' )
	self.screenzombie2:setFilter( 'nearest', 'nearest' )
	self.screendig:setFilter( 'nearest', 'nearest' )
	start.bg:setFilter( 'nearest', 'nearest' )
	start.font7:setFilter( 'nearest', 'nearest' )
	------ FILTERS ------

	------ IMAGE ------
	love.graphics.draw(start.bg, -500, -1000, 0, 3)
	------ IMAGE ------

	-- Display ZombieGame page
	if self.page2 == false then
		
		------ IMAGE ------
		love.graphics.draw(self.zombiebg, (love.graphics.getWidth()/2 - self.zombiebg:getWidth()/2), (love.graphics.getHeight()/2 - self.zombiebg:getHeight()/2), 0)
		love.graphics.draw(self.logozombie, (love.graphics.getWidth()/2 - 300/2) - 440, (love.graphics.getHeight()/2 - 300/2) - 160, 0, 0.2)
		love.graphics.draw(self.screenzombie1, (love.graphics.getWidth()/2 - self.screenzombie1:getWidth()/2) - 400, (love.graphics.getHeight()/2 - self.screenzombie1:getHeight()/2) + 193)
		love.graphics.draw(self.screenzombie2, (love.graphics.getWidth()/2 - self.screenzombie2:getWidth()/2) - 117, (love.graphics.getHeight()/2 - self.screenzombie2:getHeight()/2) + 193)
		------ IMAGE ------

		------ TEXT ------
		love.graphics.setFont( start.font7 )
		love.graphics.print('Zombie Game is the story of a nameless survivor in an empty', (love.graphics.getWidth()/2 - start.font7:getWidth( "Zombie Game is the story of a nameless survivor in an empty" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 210)
		love.graphics.print('world with nothing but the clothes on his back and a', (love.graphics.getWidth()/2 - start.font7:getWidth( "world with nothing but the clothes on his back and a" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 185)
		love.graphics.print('loaded pistol to make it through the day. Also, everyone', (love.graphics.getWidth()/2 - start.font7:getWidth( "loaded pistol to make it through the day. Also, everyone" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 160)
		love.graphics.print('else became zombies somehow and he has to fight them, or', (love.graphics.getWidth()/2 - start.font7:getWidth( "else became zombies somehow and he has to fight them, or" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 135)
		love.graphics.print("they'll eat him or something. You know the drill.", (love.graphics.getWidth()/2 - start.font7:getWidth( "they'll eat him or something. You know the drill." )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 110)
		love.graphics.print('Try it out here:', (love.graphics.getWidth()/2 - start.font7:getWidth( "Try it out here:" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 152)
		love.graphics.print('http://teampiquant.com/games', (love.graphics.getWidth()/2 - start.font7:getWidth( "http://teampiquant.com/games" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 177)
		love.graphics.print('http://reddit/r/piquant2013', (love.graphics.getWidth()/2 - start.font7:getWidth( "http://reddit/r/piquant2013" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 202)
		love.graphics.print('< 1/2 >', (love.graphics.getWidth()/2 - start.font7:getWidth( "< 1/2 >" )/2) + 565, (love.graphics.getHeight()/2 - 25/2) + 322, 0, self.scalenext)
		love.graphics.setColor(255, 255, 255, 255)
		------ TEXT ------
	end

	-- Display Digging Sim page
	if self.page2 == true then
		
		------ IMAGE ------
		love.graphics.draw(self.screendig, (love.graphics.getWidth()/2 - self.screendig:getWidth()/2), (love.graphics.getHeight()/2 - self.screendig:getHeight()/2), 0)
		love.graphics.draw(self.logodig, (love.graphics.getWidth()/2 - 300/2) - 440, (love.graphics.getHeight()/2 - 300/2) - 160, 0, 0.2)
		------ IMAGE ------

		------ TEXT ------
		love.graphics.setFont( start.font7 )
		love.graphics.print('As some of you may know, we do the BaconGameJam', (love.graphics.getWidth()/2 - start.font7:getWidth( "As some of you may know, we do the BaconGameJam" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 210)
		love.graphics.print('sometimes, and as a result we have a brand new game to', (love.graphics.getWidth()/2 - start.font7:getWidth( "sometimes, and as a result we have a brand new game to" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 185)
		love.graphics.print('showcase! Say hello, to Digging Simulator! Join the', (love.graphics.getWidth()/2 - start.font7:getWidth( "showcase! Say hello, to Digging Simulator! Join the" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 160)
		love.graphics.print('protagonist and his shovel on an epic journey to Bejing,', (love.graphics.getWidth()/2 - start.font7:getWidth( "protagonist and his shovel on an epic journey to Bejing," )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 135)
		love.graphics.print('China. Along the way youll meet absolutely nobody, do', (love.graphics.getWidth()/2 - start.font7:getWidth( "China. Along the way youll meet absolutely nobody, do" )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 110)
		love.graphics.print('absolutely nothing exciting, and probably get a splinter.', (love.graphics.getWidth()/2 - start.font7:getWidth( "absolutely nothing exciting, and probably get a splinter." )/2) + 170, (love.graphics.getHeight()/2 - 25/2) - 85)
		love.graphics.print('Try it out here:', (love.graphics.getWidth()/2 - start.font7:getWidth( "Try it out here:" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 152)
		love.graphics.print('http://teampiquant.com/jams', (love.graphics.getWidth()/2 - start.font7:getWidth( "http://teampiquant.com/jams" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 177)
		love.graphics.print('http://reddit/r/piquant2013', (love.graphics.getWidth()/2 - start.font7:getWidth( "http://reddit/r/piquant2013" )/2) + 300, (love.graphics.getHeight()/2 - 25/2) + 202)
		love.graphics.print('< 2/2 >', (love.graphics.getWidth()/2 - start.font7:getWidth( "< 2/2 >" )/2) + 565, (love.graphics.getHeight()/2 - 25/2) + 322, 0, self.scalenext)
		love.graphics.setColor(255, 255, 255, 255)
		------ TEXT ------
	end

	------ TEXT ------
	love.graphics.print('< BACK', (love.graphics.getWidth()/2 - start.font7:getWidth( "< BACK" )/2) - 565, (love.graphics.getHeight()/2 - 25/2) - 322, 0, self.scaleback)
	love.graphics.setColor(255, 255, 255, 255)
	------ TEXT ------

	------ SHAPES ------
	-- Flash white
	love.graphics.setColor(255, 255, 255, self.fade)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(255, 255, 255, 255)
	------ SHAPES ------
end

return moregames