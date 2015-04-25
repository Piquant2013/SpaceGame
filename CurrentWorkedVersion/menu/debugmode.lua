-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates debug as a new gamestate
debugmode = Gamestate.new()


function debugmode:drawmain()

	-- Prints all of the global vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, 0, 375, 265)	
	love.graphics.setColor(255,255,255,160)
		
	-- Box 1
	love.graphics.print("Global Variables", 5, 5)
	love.graphics.print("--------------------------", 5, 25)
	love.graphics.print("Global SetFPS: "..tostring(SetFPS), 5, 45)
	love.graphics.print("Global SetMute: "..tostring(SetMute), 5, 65)
	love.graphics.print("Global SetWin: "..tostring(SetWin), 5, 85)
	love.graphics.print("Global SetDeb: "..tostring(SetDeb), 5, 105)
	love.graphics.print("Global SetMou: "..tostring(SetMou), 5, 125)
	love.graphics.print("Global RightSide: "..tostring(RightSide), 5, 145)
	love.graphics.print("Global GameReset: "..tostring(GameReset), 5, 165)
	love.graphics.print("Global QuitActive: "..tostring(QuitActive), 5, 185)
	love.graphics.print("Global Paused: "..tostring(Paused), 5, 205)
	love.graphics.print("Global Resume: "..tostring(Resume), 5, 225)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawmenu()
	
	-- Print all of the menu vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 310, 455)
	love.graphics.rectangle("fill", 310, love.graphics.getHeight( ) - 180, 375, 180)	
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Menu", 5, love.graphics.getHeight( ) - 435)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 415)
	love.graphics.print("menu.PlayBtnY: "..tostring(menu.PlayBtnY), 5, love.graphics.getHeight( ) - 395)
	love.graphics.print("menu.PlayBtnX: "..tostring(menu.PlayBtnX), 5, love.graphics.getHeight( ) - 375)
	love.graphics.print("menu.OptBtnY: "..tostring(menu.OptBtnY), 5, love.graphics.getHeight( ) - 355)
	love.graphics.print("menu.OptBtnX: "..tostring(menu.OptBtnX), 5, love.graphics.getHeight( ) - 335)
	love.graphics.print("menu.QuitBtnY: "..tostring(menu.QuitBtnY), 5, love.graphics.getHeight( ) - 315)
	love.graphics.print("menu.QuitBtnX: "..tostring(menu.QuitBtnX), 5, love.graphics.getHeight( ) - 295)
	love.graphics.print("menu.ArrowY: "..tostring(menu.ArrowY), 5, love.graphics.getHeight( ) - 275)
	love.graphics.print("menu.ArrowX: "..tostring(menu.ArrowX), 5, love.graphics.getHeight( ) - 255)
	love.graphics.print("menu.BGx: "..tostring(menu.BGx), 5, love.graphics.getHeight( ) - 235)
	love.graphics.print("menu.Scrl: "..tostring(menu.Scrl), 5, love.graphics.getHeight( ) - 215)
	love.graphics.print("menu.PlayState: "..tostring(menu.PlayState), 5, love.graphics.getHeight( ) - 195)
	love.graphics.print("menu.OptState: "..tostring(menu.OptState), 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("menu.MousePlayArea: "..tostring(menu.MousePlayArea), 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("menu.MouseOptArea: "..tostring(menu.MouseOptArea), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("menu.MouseQuitArea: "..tostring(menu.MouseQuitArea), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("menu.MouseDetect: "..tostring(menu.MouseDetect), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("menu.MouseDetect2: "..tostring(menu.MouseDetect2), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("menu.MouseOnBtn: "..tostring(menu.MouseOnBtn), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("menu.MousePlayYTop: "..tostring(menu.MousePlayYTop), 5, love.graphics.getHeight( ) - 35)
		
	-- Box 2
	love.graphics.print("menu.MousePlayY: "..tostring(menu.MousePlayY), 325, love.graphics.getHeight( ) - 155)
	love.graphics.print("menu.MouseQuitY: "..tostring(menu.MouseQuitY), 325, love.graphics.getHeight( ) - 135)
	love.graphics.print("menu.MouseQuitYTop: "..tostring(menu.MouseQuitYTop), 325, love.graphics.getHeight( ) - 115)
	love.graphics.print("menu.EggTimer: "..tostring(menu.EggTimer), 325, love.graphics.getHeight( ) - 95)
	love.graphics.print("menu.Egg: "..tostring(menu.Egg), 325, love.graphics.getHeight( ) - 75)
	love.graphics.print("menu.EggCount: "..tostring(menu.EggCount), 325, love.graphics.getHeight( ) - 55)
	love.graphics.print("menu.QuitTimer: "..tostring(menu.QuitTimer), 325, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawoptions()
	
	-- Print all of the options vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( FPSfont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 330, 455)
	love.graphics.rectangle("fill", 330, love.graphics.getHeight( ) - 240, 650, 240)		
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Options", 5, love.graphics.getHeight( ) - 435)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 415)
	love.graphics.print("options.WinState: "..tostring(options.WinState), 5, love.graphics.getHeight( ) - 395)
	love.graphics.print("options.DebState: "..tostring(options.DebState), 5, love.graphics.getHeight( ) - 375)
	love.graphics.print("options.MouState: "..tostring(options.MouState), 5, love.graphics.getHeight( ) - 355)
	love.graphics.print("options.ConState: "..tostring(options.ConState), 5, love.graphics.getHeight( ) - 335)
	love.graphics.print("options.MouseWinArea: "..tostring(options.MouseWinArea), 5, love.graphics.getHeight( ) - 315)
	love.graphics.print("options.MouseDebArea: "..tostring(options.MouseDebArea), 5, love.graphics.getHeight( ) - 295)
	love.graphics.print("options.MouseMouArea: "..tostring(options.MouseMouArea), 5, love.graphics.getHeight( ) - 275)
	love.graphics.print("options.MouseConArea: "..tostring(options.MouseConArea), 5, love.graphics.getHeight( ) - 255)
	love.graphics.print("options.WinArrowY: "..tostring(options.WinArrowY), 5, love.graphics.getHeight( ) - 235)
	love.graphics.print("options.WinArrowX: "..tostring(options.WinArrowX), 5, love.graphics.getHeight( ) - 215)
	love.graphics.print("options.DebArrowY: "..tostring(options.DebArrowY), 5, love.graphics.getHeight( ) - 195)
	love.graphics.print("options.DebArrowX: "..tostring(options.DebArrowX), 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("options.MouArrowY: "..tostring(options.MouArrowY), 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("options.MouArrowX: "..tostring(options.MouArrowX), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("options.FPSState: "..tostring(options.FPSState), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("options.MuteState: "..tostring(options.MuteState), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("options.ChgState: "..tostring(options.ChgState), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("options.CrdState: "..tostring(options.CrdState), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("options.BackState: "..tostring(options.BackState), 5, love.graphics.getHeight( ) - 35)
		
	-- Box 2
	love.graphics.print("options.OptArrowY: "..tostring(options.OptArrowY), 335, love.graphics.getHeight( ) - 215)
	love.graphics.print("options.OptArrowX: "..tostring(options.OptArrowX), 335, love.graphics.getHeight( ) - 195)
	love.graphics.print("options.FPSArrowY: "..tostring(options.FPSArrowY), 335, love.graphics.getHeight( ) - 175)
	love.graphics.print("options.FPSArrowX: "..tostring(options.FPSArrowX), 335, love.graphics.getHeight( ) - 155)
	love.graphics.print("options.MuteArrowY: "..tostring(options.MuteArrowY), 335, love.graphics.getHeight( ) - 135)
	love.graphics.print("options.MuteArrowX: "..tostring(options.MuteArrowX), 335, love.graphics.getHeight( ) - 115)
	love.graphics.print("options.MouseMuteArea: "..tostring(options.MouseMuteArea), 335, love.graphics.getHeight( ) - 95)
	love.graphics.print("options.MouseChgArea: "..tostring(options.MouseChgArea), 335, love.graphics.getHeight( ) - 75)
	love.graphics.print("options.MouseCrdArea: "..tostring(options.MouseCrdArea), 335, love.graphics.getHeight( ) - 55)
	love.graphics.print("options.MouseBackArea: "..tostring(options.MouseBackArea), 335, love.graphics.getHeight( ) - 35)
		
	-- Box 3
	love.graphics.print("options.MouseDetect: "..tostring(options.MouseDetect), 675, love.graphics.getHeight( ) - 215)
	love.graphics.print("options.MouseDetect1: "..tostring(options.MouseDetect1), 675, love.graphics.getHeight( ) - 195)
	love.graphics.print("options.MouseDetect2: "..tostring(options.MouseDetect2), 675, love.graphics.getHeight( ) - 175)
	love.graphics.print("options.MouseDetect3: "..tostring(options.MouseDetect3), 675, love.graphics.getHeight( ) - 155)
	love.graphics.print("options.MouseDetect4: "..tostring(options.MouseDetect4), 675, love.graphics.getHeight( ) - 135)
	love.graphics.print("options.MouseDetect5: "..tostring(options.MouseDetect5), 675, love.graphics.getHeight( ) - 115)
	love.graphics.print("options.MouseDetect6: "..tostring(options.MouseDetect6), 675, love.graphics.getHeight( ) - 95)
	love.graphics.print("options.MouseDetect7: "..tostring(options.MouseDetect7), 675, love.graphics.getHeight( ) - 75)
	love.graphics.print("options.MouseDetect8: "..tostring(options.MouseDetect8), 675, love.graphics.getHeight( ) - 55)
	love.graphics.print("options.MouseOnBtn: "..tostring(options.MouseOnBtn), 675, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawcredits()
	
	-- Print all of the credits vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( FPSfont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 195, 375, 195)	
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Credits", 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("credits.CrdBackBtnY: "..tostring(credits.CrdBackBtnY), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("credits.CrdBackBtnX: "..tostring(credits.CrdBackBtnX), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("credits.CrdArrowX: "..tostring(credits.CrdArrowX), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("credits.MouseBackArea: "..tostring(credits.MouseBackArea), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("credits.MouseDetect: "..tostring(credits.MouseDetect), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("credits.MouseOnBtn: "..tostring(credits.MouseOnBtn), 5, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawcontorls()

	-- Print all of the controls vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( FPSfont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 195, 375, 195)	
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Controls", 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("controls.ConBackBtnY: "..tostring(controls.ConBackBtnY), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("controls.ConBackBtnX: "..tostring(controls.ConBackBtnX), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("controls.ConArrowX: "..tostring(controls.ConArrowX), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("controls.MouseBackArea: "..tostring(controls.MouseBackArea), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("controls.MouseDetect: "..tostring(controls.MouseDetect), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("controls.MouseOnBtn: "..tostring(controls.MouseOnBtn), 5, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawchangelog()
	
	-- Print all of the changlogs vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( FPSfont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 195, 375, 195)	
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Changelog", 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("changelog.ChgBackBtnY: "..tostring(changelog.ChgBackBtnY), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("changelog.ChgBackBtnX: "..tostring(changelog.ChgBackBtnX), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("changelog.ChgArrowX: "..tostring(changelog.ChgArrowX), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("changelog.MouseBackArea: "..tostring(changelog.MouseBackArea), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("changelog.MouseDetect: "..tostring(changelog.MouseDetect), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("changelog.MouseOnBtn: "..tostring(changelog.MouseOnBtn), 5, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

function debugmode:drawhitbox()
	
	-- draw game hitboxs
	sship.bb:draw('line')
	plyr.bb:draw('line')
	pistol.bb:draw('line')

end
--[[
function debugmode:drawgame()
	
	-- Print all of the game vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( DebugFont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 1010, 455)
	love.graphics.rectangle("fill", 1010, love.graphics.getHeight( ) - 80, 280, 80)		
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Game", 5, love.graphics.getHeight( ) - 450)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 435)
	love.graphics.print("plyr.y: "..tostring(plyr.y), 5, love.graphics.getHeight( ) - 420)
	love.graphics.print("plyr.x: "..tostring(plyr.x), 5, love.graphics.getHeight( ) - 405)
	love.graphics.print("plyr.movementstop: "..tostring(plyr.movementstop), 5, love.graphics.getHeight( ) - 390)
	love.graphics.print("player.Tired: "..tostring(player.Tired), 5, love.graphics.getHeight( ) - 375)
	love.graphics.print("playerTiredTime: "..tostring(player.TiredTime), 5, love.graphics.getHeight( ) - 360)
	love.graphics.print("playerSprint: "..tostring(player.Sprint), 5, love.graphics.getHeight( ) - 345)
	love.graphics.print("plyr.speed: "..tostring(plyr.speed), 5, love.graphics.getHeight( ) - 330)
	love.graphics.print("playerSprintTime: "..tostring(player.SprintTime), 5, love.graphics.getHeight( ) - 315)
	--love.graphics.print("PlayerHit1: "..tostring(game.PlayerHit1), 5, love.graphics.getHeight( ) - 300)
	--love.graphics.print("PlayerHit2: "..tostring(game.PlayerHit2), 5, love.graphics.getHeight( ) - 285)
	--love.graphics.print("PlayerHit3: "..tostring(game.PlayerHit3), 5, love.graphics.getHeight( ) - 270)
	--love.graphics.print("PlayerHit4: "..tostring(game.PlayerHit4), 5, love.graphics.getHeight( ) - 255)
	--love.graphics.print("PlayerHit5: "..tostring(game.PlayerHit5), 5, love.graphics.getHeight( ) - 240)
	--love.graphics.print("PlayerHit6: "..tostring(game.PlayerHit6), 5, love.graphics.getHeight( ) - 225)
	--love.graphics.print("PlayerHit7: "..tostring(game.PlayerHit7), 5, love.graphics.getHeight( ) - 210)
	--love.graphics.print("PlayerHit8: "..tostring(game.PlayerHit8), 5, love.graphics.getHeight( ) - 195)
	--love.graphics.print("PlayerHit9: "..tostring(game.PlayerHit9), 5, love.graphics.getHeight( ) - 180)
	--love.graphics.print("PlayerHealth: "..tostring(game.PlayerHealth), 5, love.graphics.getHeight( ) - 165)
	--love.graphics.print("HealthX: "..tostring(game.HealthX), 5, love.graphics.getHeight( ) - 150) 
	love.graphics.print("gun.ShotTime: "..tostring(gun.ShotTime), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("gun.ShotTimePlus: "..tostring(gun.ShotTimePlus), 5, love.graphics.getHeight( ) - 120)
	love.graphics.print("gun.GunShot: "..tostring(gun.GunShot), 5, love.graphics.getHeight( ) - 105)
	love.graphics.print("gun.GunShot1: "..tostring(gun.GunShot1), 5, love.graphics.getHeight( ) - 90)
	love.graphics.print("pistol.y: "..tostring(pistol.y), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("pistol.x: "..tostring(pistol.x), 5, love.graphics.getHeight( ) - 60)
	love.graphics.print("pistol.HaveGun: "..tostring(pistol.HaveGun), 5, love.graphics.getHeight( ) - 45)
	love.graphics.print("pistol.itemx: "..tostring(pistol.itemx), 5, love.graphics.getHeight( ) - 30)
		
	-- Box 2
	love.graphics.print("pistol.itemy: "..tostring(pistol.itemy), 275, love.graphics.getHeight( ) - 420)
	love.graphics.print("sship.x: "..tostring(sship.x), 275, love.graphics.getHeight( ) - 405)
	love.graphics.print("sship.y: "..tostring(sship.y), 275, love.graphics.getHeight( ) - 390)
	love.graphics.print("ship.BoostTired: "..tostring(ship.BoostTired), 275, love.graphics.getHeight( ) - 375)
	love.graphics.print("ship.BoostTiredTime: "..tostring(ship.BoostTiredTime), 275, love.graphics.getHeight( ) - 360)
	love.graphics.print("ship.Boost: "..tostring(ship.Boost), 275, love.graphics.getHeight( ) - 345)
	love.graphics.print("ship.BoostTime: "..tostring(ship.BoostTime), 275, love.graphics.getHeight( ) - 330)
	--love.graphics.print("ShipHit: "..tostring(game.ShipHit), 275, love.graphics.getHeight( ) - 315)
	--love.graphics.print("ShipHit1: "..tostring(game.ShipHit1), 275, love.graphics.getHeight( ) - 300)
	--love.graphics.print("ShipHit2: "..tostring(game.ShipHit2), 275, love.graphics.getHeight( ) - 285)
	--love.graphics.print("ShipHit3: "..tostring(game.ShipHit3), 275, love.graphics.getHeight( ) - 270)
	--love.graphics.print("ShipHit4: "..tostring(game.ShipHit4), 275, love.graphics.getHeight( ) - 255)
	--love.graphics.print("ShipHit5: "..tostring(game.ShipHit5), 275, love.graphics.getHeight( ) - 240)
	--love.graphics.print("ShipHit6: "..tostring(game.ShipHit6), 275, love.graphics.getHeight( ) - 225)
	--love.graphics.print("ShipHit7: "..tostring(game.ShipHit7), 275, love.graphics.getHeight( ) - 210)
	--love.graphics.print("ShipHit8: "..tostring(game.ShipHit8), 275, love.graphics.getHeight( ) - 195)
	--love.graphics.print("ShipHit9: "..tostring(game.ShipHit9), 275, love.graphics.getHeight( ) - 180)
	--love.graphics.print("ShipHealthX: "..tostring(game.ShipHealthX), 275, love.graphics.getHeight( ) - 165)
	--love.graphics.print("ShipHealth: "..tostring(game.ShipHealth), 275, love.graphics.getHeight( ) - 150)
	love.graphics.print("sship.entered: "..tostring(sship.entered), 275, love.graphics.getHeight( ) - 135)
	love.graphics.print("sship.yes: "..tostring(sship.yes), 275, love.graphics.getHeight( ) - 120)
	love.graphics.print("sship.owned: "..tostring(sship.owned), 275, love.graphics.getHeight( ) - 105)
	love.graphics.print("sship.exited: "..tostring(sship.exited), 275, love.graphics.getHeight( ) - 90)
	love.graphics.print("sship.dead: "..tostring(sship.dead), 275, love.graphics.getHeight( ) - 75)
	--love.graphics.print("RockX1: "..tostring(game.RockX1), 275, love.graphics.getHeight( ) - 60)
	--love.graphics.print("RockY1: "..tostring(game.RockY1), 275, love.graphics.getHeight( ) - 45)
	--love.graphics.print("RockX2: "..tostring(game.RockX2), 275, love.graphics.getHeight( ) - 30)
		
	-- Box 3
	--love.graphics.print("RockY2: "..tostring(game.RockY2), 545, love.graphics.getHeight( ) - 420)
	--love.graphics.print("RockX3: "..tostring(game.RockX3), 545, love.graphics.getHeight( ) - 405)
	--love.graphics.print("RockY3: "..tostring(game.RockY3), 545, love.graphics.getHeight( ) - 390)
	--love.graphics.print("RockX4: "..tostring(game.RockX4), 545, love.graphics.getHeight( ) - 375)
	--love.graphics.print("RockY4: "..tostring(game.RockY4), 545, love.graphics.getHeight( ) - 360)
	--love.graphics.print("RockX5: "..tostring(game.RockX5), 545, love.graphics.getHeight( ) - 345)
	--love.graphics.print("RockY5: "..tostring(game.RockY5), 545, love.graphics.getHeight( ) - 330)
	--love.graphics.print("RockX6: "..tostring(game.RockX6), 545, love.graphics.getHeight( ) - 315)
	--love.graphics.print("RockY6: "..tostring(game.RockY6), 545, love.graphics.getHeight( ) - 300)
	--love.graphics.print("RockX7: "..tostring(game.RockX7), 545, love.graphics.getHeight( ) - 285)
	--love.graphics.print("RockY7: "..tostring(game.RockY7), 545, love.graphics.getHeight( ) - 270)
	--love.graphics.print("RockX8: "..tostring(game.RockX8), 545, love.graphics.getHeight( ) - 255)
	--love.graphics.print("RockY8: "..tostring(game.RockY8), 545, love.graphics.getHeight( ) - 240)
	--love.graphics.print("RockX9: "..tostring(game.RockX9), 545, love.graphics.getHeight( ) - 225)
	--love.graphics.print("RockY9: "..tostring(game.RockY9), 545, love.graphics.getHeight( ) - 210)
	--love.graphics.print("RockHealth1: "..tostring(game.RockHealth1), 545, love.graphics.getHeight( ) - 195)
	--love.graphics.print("RockHealth2: "..tostring(game.RockHealth2), 545, love.graphics.getHeight( ) - 180)
	--love.graphics.print("RockHealth3: "..tostring(game.RockHealth3), 545, love.graphics.getHeight( ) - 165)
	--love.graphics.print("RockHealth4: "..tostring(game.RockHealth4), 545, love.graphics.getHeight( ) - 150)
	--love.graphics.print("RockHealth5: "..tostring(game.RockHealth5), 545, love.graphics.getHeight( ) - 135)
	--love.graphics.print("RockHealth6: "..tostring(game.RockHealth6), 545, love.graphics.getHeight( ) - 120)
	--love.graphics.print("RockHealth7: "..tostring(game.RockHealth7), 545, love.graphics.getHeight( ) - 105)
	--love.graphics.print("RockHealth8: "..tostring(game.RockHealth8), 545, love.graphics.getHeight( ) - 90)
	--love.graphics.print("RockHealth9: "..tostring(game.RockHealth9), 545, love.graphics.getHeight( ) - 75)
	--love.graphics.print("RockHit1: "..tostring(game.RockHit1), 545, love.graphics.getHeight( ) - 60)
	--love.graphics.print("RockHit2: "..tostring(game.RockHit2), 545, love.graphics.getHeight( ) - 45)
	--love.graphics.print("RockHit3: "..tostring(game.RockHit3), 545, love.graphics.getHeight( ) - 30)

	-- Box 4
	--love.graphics.print("RockHit4: "..tostring(game.RockHit4), 715, love.graphics.getHeight( ) - 420)
	--love.graphics.print("RockHit5: "..tostring(game.RockHit5), 715, love.graphics.getHeight( ) - 405)
	--love.graphics.print("RockHit6: "..tostring(game.RockHit6), 715, love.graphics.getHeight( ) - 390)
	--love.graphics.print("RockHit7: "..tostring(game.RockHit7), 715, love.graphics.getHeight( ) - 375)
	--love.graphics.print("RockHit8: "..tostring(game.RockHit8), 715, love.graphics.getHeight( ) - 360)
	--love.graphics.print("RockHit9: "..tostring(game.RockHit9), 715, love.graphics.getHeight( ) - 345)
	--love.graphics.print("RockDead1: "..tostring(game.RockDead1), 715, love.graphics.getHeight( ) - 330)
	--love.graphics.print("RockDead2: "..tostring(game.RockDead2), 715, love.graphics.getHeight( ) - 315)
	--love.graphics.print("RockDead3: "..tostring(game.RockDead3), 715, love.graphics.getHeight( ) - 300)
	--love.graphics.print("RockDead4: "..tostring(game.RockDead4), 715, love.graphics.getHeight( ) - 285)
	--love.graphics.print("RockDead5: "..tostring(game.RockDead5), 715, love.graphics.getHeight( ) - 270)
	--love.graphics.print("RockDead6: "..tostring(game.RockDead6), 715, love.graphics.getHeight( ) - 255)
	--love.graphics.print("RockDead7: "..tostring(game.RockDead7), 715, love.graphics.getHeight( ) - 240)
	--love.graphics.print("RockDead8: "..tostring(game.RockDead8), 715, love.graphics.getHeight( ) - 225)
	--love.graphics.print("RockDead9: "..tostring(game.RockDead9), 715, love.graphics.getHeight( ) - 210)
	love.graphics.print("gun.Direction : "..tostring(gun.Direction ), 715, love.graphics.getHeight( ) - 195)
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
	love.graphics.print("plyr.rotation: "..tostring(plyr.rotation), 1010, love.graphics.getHeight( ) - 45)
	love.graphics.print("ship.ShipDir: "..tostring(ship.ShipDir), 1010, love.graphics.getHeight( ) - 30)

	--for i, o in ipairs(game.Bullets) do
		--love.graphics.setColor(255,255,255,160)
		--love.graphics.print("Bullet Speed: "..tostring(o.Speed), 1010, love.graphics.getHeight( ) - 60)
	--end
		
	love.graphics.setColor(255,255,255,255)
end
--]]
function debugmode:drawpause()
	
	-- Print all of the pause vars for when debug mode is active

	-- Font, boxes, color
	love.graphics.setFont( FPSfont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 415, 375, 415)	
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Pause", 5, love.graphics.getHeight( ) - 395)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 375)
	love.graphics.print("pause.ResumeBtnY: "..tostring(pause.ResumeBtnY), 5, love.graphics.getHeight( ) - 355)
	love.graphics.print("pause.ResumeBtnX: "..tostring(pause.ResumeBtnX), 5, love.graphics.getHeight( ) - 335)
	love.graphics.print("pause.MainMenuBtnY: "..tostring(pause.MainMenuBtnY), 5, love.graphics.getHeight( ) - 315)
	love.graphics.print("pause.MainMenuBtnX: "..tostring(pause.MainMenuBtnX), 5, love.graphics.getHeight( ) - 295)
	love.graphics.print("pause.ResumeState: "..tostring(pause.ResumeState), 5, love.graphics.getHeight( ) - 275)
	love.graphics.print("pause.MainMenuState: "..tostring(pause.MainMenuState), 5, love.graphics.getHeight( ) - 255)
	love.graphics.print("pause.ArrowY: "..tostring(pause.ArrowY), 5, love.graphics.getHeight( ) - 235)
	love.graphics.print("pause.ArrowX: "..tostring(pause.ArrowX), 5, love.graphics.getHeight( ) - 215)
	love.graphics.print("pause.MouseResumeArea: "..tostring(pause.MouseResumeArea), 5, love.graphics.getHeight( ) - 195)
	love.graphics.print("pause.MouseMainMenuArea: "..tostring(pause.MouseMainMenuArea), 5, love.graphics.getHeight( ) - 175)
	love.graphics.print("pause.MouseDetect: "..tostring(pause.MouseDetect), 5, love.graphics.getHeight( ) - 155)
	love.graphics.print("pause.MouseDetect1: "..tostring(pause.MouseDetect1), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("pause.MouseOnBtn: "..tostring(pause.MouseOnBtn), 5, love.graphics.getHeight( ) - 115)
	love.graphics.print("pause.MouseResumeYTop: "..tostring(pause.MouseResumeYTop), 5, love.graphics.getHeight( ) - 95)
	love.graphics.print("pause.MouseResumeY: "..tostring(pause.MouseResumeY), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("pause.MouseMainMenuY: "..tostring(pause.MouseMainMenuY), 5, love.graphics.getHeight( ) - 55)
	love.graphics.print("pause.MouseMainMenuYTop: "..tostring(pause.MouseMainMenuYTop), 5, love.graphics.getHeight( ) - 35)
		
	love.graphics.setColor(255,255,255,255)
end

return debugmode