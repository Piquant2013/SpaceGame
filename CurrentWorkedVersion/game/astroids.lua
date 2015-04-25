-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Loads Hardon Collider script
local HC = require 'libs/hardoncollider'

-- Creates game as a new gamestate
astroids = Gamestate.new()


function astroids:initialize()

	rocks = {}

end

function astroids:collision(dt, shape_a, shape_b)

	for i, o in ipairs(rocks) do
		for c, v in ipairs(gun.Bullets) do

			local other

			if shape_a == o.bb then
				other = shape_b
			elseif shape_b == o.bb then
				other = shape_a
			end

			if other == v.bb then
				o.health = o.health - 10
				table.remove(gun.Bullets, c)

				if o.health < 0 then
					o.health = 0
					table.remove(rocks, i)
				end
			end
		
		end
	end

end

function astroids:collisionstopped(dt, shape_a, shape_b)

end

function astroids:spawn()

	rock = {}    

	rock.sprite = love.graphics.newImage("images/rock.png")
	rock.health = 50
	rock.x = love.math.random(-0, 2000)
	rock.y = love.math.random(-0, 2000)
	rock.bb = Collider:addRectangle(rock.x, rock.y, 23, 23)

	table.insert(rocks, rock)

end

function astroids:draw()

	for i,v in ipairs(rocks) do
		
		love.graphics.setColor(255, 255, 255)
		v.sprite:setFilter( 'nearest', 'nearest' )
		love.graphics.draw(v.sprite, v.x, v.y)
	end

end

return astroids