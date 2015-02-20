local Gamestate = require 'vendors/gamestate'
pause = Gamestate.new()


function pause:init()
  ht = false
 
  ResumeBtnY = 300
  ResumeBtnX = 548
  
  MainMenuBtnY = 382
  MainMenuBtnX = 512
  
  ResumeState = false
  MainMenuState = false
 
  ArrowY = (ResumeBtnY)
  ArrowX = 450
  
  Enter = love.audio.newSource("audio/enter.ogg")
  Select1 = love.audio.newSource("audio/sel.ogg")
  Select2 = love.audio.newSource("audio/sel.ogg")
  
  PauseMusic = love.audio.newSource("audio/pausemusic.ogg")

  PauseBtn = love.graphics.newFont("fonts/xen3.ttf", 50)
  Title = love.graphics.newFont("fonts/xen3.ttf", 90)

  SelectM = love.audio.newSource("audio/sel.ogg")
  Select1M = love.audio.newSource("audio/sel.ogg")

  ResumeState = false
  MainMenuState = false

  MouseResumeArea = false
  MouseMainMenuArea = false

  MouseDetect = 0
  MouseDetect1 = 0
  MouseOnBtn = false

  MouseResumeYTop = 300
  MouseResumeY = 360
  MouseMainMenuY = 380
  MouseMainMenuYTop = 440

  MainMenuAct = false
end


function pause:keypressed(key)
  if key == 'escape' then
    ht = true
    paused = false
  end

  if key == "up" and MouseOnBtn == true or key == "w" and MouseOnBtn == true then
    love.mouse.setX(835)
  end

  if key == "down" and MouseOnBtn == true or key == "s" and MouseOnBtn == true then
    love.mouse.setX(835)
  end

  if key == "up" or key == "w" then
    MouseMainMenuArea = false
    MouseResumeArea = false
    MouseOnBtn = false
    love.audio.play(Select1)
    love.audio.play(Select2)
    ArrowY = ArrowY - 100
  end

  if key == "down" or key == "s" then
    MouseMainMenuArea = false
    MouseResumeArea = false
    MouseOnBtn = false
    love.audio.play(Select1)
    love.audio.play(Select2)
    ArrowY = ArrowY + 100
  end
 
  if key == "return" and ResumeState == true then
    love.audio.play(Enter)
    ht = true
  end
  
  if key == "return" and MainMenuState == true then
    love.audio.play(Enter)
    Gamestate.switch(menu)
    love.audio.play(MenuMusic)
    MenuMusic:setLooping(true)
    love.audio.stop(PauseMusic)
    love.audio.stop(GameMusic)
    Restart = true
  end
end


function pause:mousepressed(mx, my, button)
    if button == "l" and MainMenuState and MouseMainMenuArea == true then
      love.audio.play(Enter)
      Gamestate.switch(menu)
      
      love.audio.play(MenuMusic)
      MenuMusic:setLooping(true)
      love.audio.stop(PauseMusic)
      love.audio.stop(GameMusic)
     
      Restart = true
    end

    if button == "l" and ResumeState and MouseResumeArea == true then
      love.audio.play(Enter)
      ht = true
    end
end


function pause:update(dt)

  if ht == false then
    love.audio.play(PauseMusic)
    PauseMusic:setLooping(true)
    love.audio.pause(GameMusic)
  end

  if ht == true then
    Gamestate.switch(game)
    paused = false
    love.mouse.setCursor(crosshair)

    love.audio.resume(GameMusic)
    GameMusic:setLooping(true)
    love.audio.stop(PauseMusic)
  end 

  if ArrowY == ResumeBtnY then
    ResumeState = true
    MainMenuState = false
    love.audio.stop(Select1)
  end

  if ArrowY == MainMenuBtnY then
    ResumeState = false
    MainMenuState = true
    love.audio.stop(Select2)
  end
  
  if ArrowY > MainMenuBtnY then
    ArrowY = MainMenuBtnY
  end

  if ArrowY < ResumeBtnY then
    ArrowY = ResumeBtnY
  end

  if MouseOnBtn == false then
    MouseDetect = 0
    MouseDetect1 = 0
    love.audio.stop(SelectM)
    love.audio.stop(Select1M)
  end

  if MouseDetect == 1 and SetMute == false then
    love.audio.play(SelectM)
    love.audio.stop(Select1M)
  end

  if MouseDetect1 == 1 and SetMute == false then
    love.audio.play(Select1M)
    love.audio.stop(SelectM)
  end

  if love.mouse.getX() > (ArrowX + 385) then
    MouseOnBtn = false
    MouseMainMenuArea = false
    MouseResumeArea = false
  end
  
  if love.mouse.getX() < ArrowX then
    MouseOnBtn = false
    MouseMainMenuArea = false
    MouseResumeArea = false
  end

  if love.mouse.getY() < MouseResumeY then
    MouseOnBtn = false
    MouseMainMenuArea = false
    MouseResumeArea = false
  end

  if love.mouse.getY() > MouseMainMenuYTop then
    MouseOnBtn = false
    MouseMainMenuArea = false
    MouseResumeArea = false
  end
  
  if love.mouse.getY() > MouseMainMenuY and love.mouse.getY() < MouseMainMenuYTop and love.mouse.getX() > ArrowX and love.mouse.getX() < (ArrowX + 385) then
    ArrowY = MainMenuBtnY
    MouseOnBtn = true
    MouseMainMenuArea = true
    MouseResumeArea = false
    MouseDetect = MouseDetect + 1
    MouseDetect1 = 0
  end

  if love.mouse.getY() < MouseResumeY and love.mouse.getY() > MouseResumeYTop and love.mouse.getX() > ArrowX and love.mouse.getX() < (ArrowX + 385) then
    ArrowY = ResumeBtnY
    MouseOnBtn = true
    MouseResumeArea = true
    MouseMainMenuArea = false
    MouseDetect1 = MouseDetect1 + 1
    MouseDetect = 0
  end
end


function pause:draw()
  love.graphics.rectangle("fill", ArrowX, ArrowY + 5, 29, 35 )
  love.graphics.rectangle("fill", ArrowX + 350, ArrowY + 5, 29, 35 )
  love.graphics.setFont( PauseBtn )
  love.graphics.print('Resume', ResumeBtnX, ResumeBtnY)
  love.graphics.print('Main Menu', MainMenuBtnX, MainMenuBtnY)
  love.graphics.setFont( Title )
  love.graphics.print('Paused', 480, 200)
end

return pause