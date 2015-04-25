-- Loads gamestate script
local Gamestate = require 'libs/hump/gamestate'

-- Creates debug as a new gamestate
debugmode = Gamestate.new()


function debugmode:main()

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

function debugmode:menu()
	
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

function debugmode:options()
	
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

function debugmode:credits()
	
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

function debugmode:controls()

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

function debugmode:changelog()
	
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

function debugmode:hitbox()
	
	-- draw game hitboxs
	sship.bb:draw('line')
	plyr.bb:draw('line')
	pistol.bb:draw('line')

	-- Bullet hit boxes
	for i, o in ipairs(gun.Bullets) do
		o.bb:draw('line')
	end

	-- Astroid hit boxes
	for i, o in ipairs(rocks) do
		o.bb:draw('line')
	end
end

function debugmode:astroids()

	-- Astroid debug info
	for i, o in ipairs(rocks) do
		
		-- rock health and postions
		love.graphics.setFont( gun.InteractFont )
		love.graphics.setColor(255,255,255)
		love.graphics.print("rock.health: "..tostring(o.health), o.x, o.y + 40)
		love.graphics.print("rock.x: "..tostring(o.x), o.x, o.y + 50)
		love.graphics.print("rock.y: "..tostring(o.y), o.x, o.y + 60)
		
		-- rock healthbar
		love.graphics.setColor(0, 255, 0)
		love.graphics.rectangle("fill", o.x, o.y + 30, o.health/2, 2 )
	end
end

function debugmode:bullets()
	
	-- Bullet debug info
	for i, o in ipairs(gun.Bullets) do
		
		-- Bullet direction, postions and speed
		love.graphics.setFont( gun.InteractFont )
		love.graphics.setColor(255,255,255)
		love.graphics.print("bullet.x: "..tostring(o.x), plyr.x, plyr.y + 30)
		love.graphics.print("bullet.y: "..tostring(o.y), plyr.x, plyr.y + 40)
		love.graphics.print("bullet.Dir: "..tostring(o.Dir), plyr.x, plyr.y + 50)
		love.graphics.print("bullet.Speed: "..tostring(o.Speed), plyr.x, plyr.y + 60)
	end
end

function debugmode:game()
	
	-- Print all of the game vars for when debug mode is active	

	-- Font, boxes, color
	love.graphics.setFont( DebugFont )
	love.graphics.setColor(0,0,0,160)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight( ) - 455, 675, 455)		
	love.graphics.setColor(255,255,255,160)

	-- Box 1
	love.graphics.print("Game", 5, love.graphics.getHeight( ) - 450)
	love.graphics.print("--------------------------", 5, love.graphics.getHeight( ) - 435)
	love.graphics.print("BtnY: "..tostring(game.BtnY), 5, love.graphics.getHeight( ) - 420)
	love.graphics.print("BtnX: "..tostring(game.BtnX), 5, love.graphics.getHeight( ) - 405)
	love.graphics.print("ZoomCam: "..tostring(game.ZoomCam), 5, love.graphics.getHeight( ) - 390)
	love.graphics.print("ArrowX: "..tostring(game.ArrowX), 5, love.graphics.getHeight( ) - 375)
	love.graphics.print("WelcomeButtonArea: "..tostring(game.WelcomeButtonArea), 5, love.graphics.getHeight( ) - 360)
	love.graphics.print("WelcomeMouseDetect: "..tostring(game.WelcomeMouseDetect), 5, love.graphics.getHeight( ) - 345)
	love.graphics.print("WelcomeMouseOnBtn: "..tostring(game.WelcomeMouseOnBtn), 5, love.graphics.getHeight( ) - 330)
	love.graphics.print("Welcome: "..tostring(game.Welcome), 5, love.graphics.getHeight( ) - 315)
	love.graphics.print("GameOver: "..tostring(game.GameOver), 5, love.graphics.getHeight( ) - 300)
	love.graphics.print("GameOverMouseBackArea: "..tostring(game.GameOverMouseBackArea), 5, love.graphics.getHeight( ) - 285)
	love.graphics.print("GameOverMouseDetect: "..tostring(game.GameOverMouseDetect), 5, love.graphics.getHeight( ) - 270)
	love.graphics.print("GameOverMouseOnBtn: "..tostring(game.GameOverMouseOnBtn), 5, love.graphics.getHeight( ) - 255)
	love.graphics.print("GameOverArrowX: "..tostring(game.GameOverArrowX), 5, love.graphics.getHeight( ) - 240)
	love.graphics.print("plyr.y: "..tostring(plyr.y), 5, love.graphics.getHeight( ) - 225)
	love.graphics.print("plyr.x: "..tostring(plyr.x), 5, love.graphics.getHeight( ) - 210)
	love.graphics.print("plyr.w: "..tostring(plyr.w), 5, love.graphics.getHeight( ) - 195)
	love.graphics.print("plyr.h: "..tostring(plyr.h), 5, love.graphics.getHeight( ) - 180)
	love.graphics.print("plyr.health: "..tostring(plyr.health), 5, love.graphics.getHeight( ) - 165)
	love.graphics.print("plyr.speed: "..tostring(plyr.speed), 5, love.graphics.getHeight( ) - 150)
	love.graphics.print("plyr.movementstop: "..tostring(plyr.movementstop), 5, love.graphics.getHeight( ) - 135)
	love.graphics.print("plyr.rotation: "..tostring(plyr.rotation), 5, love.graphics.getHeight( ) - 120)
	love.graphics.print("player.Tired: "..tostring(player.Tired), 5, love.graphics.getHeight( ) - 105)
	love.graphics.print("player.TiredTime: "..tostring(player.TiredTime), 5, love.graphics.getHeight( ) - 90)
	love.graphics.print("player.Sprint: "..tostring(player.Sprint), 5, love.graphics.getHeight( ) - 75)
	love.graphics.print("player.SprintTime: "..tostring(player.SprintTime), 5, love.graphics.getHeight( ) - 60)
	love.graphics.print("sship.x: "..tostring(sship.x), 5, love.graphics.getHeight( ) - 45)
	love.graphics.print("sship.y: "..tostring(sship.y), 5, love.graphics.getHeight( ) - 30)

	-- Box 2
	love.graphics.print("sship.w: "..tostring(sship.w), 375, love.graphics.getHeight( ) - 360)
	love.graphics.print("sship.h: "..tostring(sship.h), 375, love.graphics.getHeight( ) - 345)
	love.graphics.print("sship.health: "..tostring(sship.health), 375, love.graphics.getHeight( ) - 330)
	love.graphics.print("sship.entered: "..tostring(sship.entered), 375, love.graphics.getHeight( ) - 315)
	love.graphics.print("sship.yes: "..tostring(sship.yes), 375, love.graphics.getHeight( ) - 300)
	love.graphics.print("sship.owned: "..tostring(sship.owned), 375, love.graphics.getHeight( ) - 285)
	love.graphics.print("sship.exited: "..tostring(sship.exited), 375, love.graphics.getHeight( ) - 270)
	love.graphics.print("sship.dead: "..tostring(sship.dead), 375, love.graphics.getHeight( ) - 255)
	love.graphics.print("ship.ShipDir: "..tostring(ship.ShipDir), 375, love.graphics.getHeight( ) - 240)
	love.graphics.print("ship.BoostTired: "..tostring(ship.BoostTired), 375, love.graphics.getHeight( ) - 225)
	love.graphics.print("ship.BoostTiredTime: "..tostring(ship.BoostTiredTime), 375, love.graphics.getHeight( ) - 210)
	love.graphics.print("ship.Boost: "..tostring(ship.Boost), 375, love.graphics.getHeight( ) - 195)
	love.graphics.print("ship.BoostTime: "..tostring(ship.BoostTime), 375, love.graphics.getHeight( ) - 180)
	love.graphics.print("gun.ShotTime: "..tostring(gun.ShotTime), 375, love.graphics.getHeight( ) - 165)
	love.graphics.print("gun.ShotTimePlus: "..tostring(gun.ShotTimePlus), 375, love.graphics.getHeight( ) - 150)
	love.graphics.print("gun.GunShot: "..tostring(gun.GunShot), 375, love.graphics.getHeight( ) - 135)
	love.graphics.print("gun.GunShot1: "..tostring(gun.GunShot1), 375, love.graphics.getHeight( ) - 120)
	love.graphics.print("pistol.GunY: "..tostring(pistol.GunY), 375, love.graphics.getHeight( ) - 105)
	love.graphics.print("pistol.GunX: "..tostring(pistol.GunX), 375, love.graphics.getHeight( ) - 90)
	love.graphics.print("pistol.HaveGun: "..tostring(pistol.HaveGun), 375, love.graphics.getHeight( ) - 75)
	love.graphics.print("pistol.yes: "..tostring(pistol.yes), 375, love.graphics.getHeight( ) - 60)
	love.graphics.print("pistol.itemx: "..tostring(pistol.itemx), 375, love.graphics.getHeight( ) - 45)
	love.graphics.print("pistol.itemy: "..tostring(pistol.itemy), 375, love.graphics.getHeight( ) - 30)
	
	love.graphics.setColor(255,255,255,255)
end

function debugmode:pause()
	
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