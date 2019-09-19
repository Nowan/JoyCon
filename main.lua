local JoyCon = require("joycon.JoyCon");
local joy_con = nil;

local character = display.newCircle(display.contentCenterX, display.contentCenterY, 10);
local velocity = {x = 0, y = 0};
local speed = 10;
local tween = nil;
local animation = require("plugin.animation");

local function onStickMoved(event)
  velocity.x = event.xStrength * speed;
  velocity.y = event.yStrength * speed;
end

local function touchHandler(event) 
  if (event.phase == "began") then
    joy_con = JoyCon();
    joy_con.x = event.xStart;
    joy_con.y = event.yStart;
    joy_con:addEventListener("stick", onStickMoved);
    
  elseif (event.phase == "ended") then
    joy_con:removeSelf();
    joy_con = nil;
    tween = animation.to(velocity, {x = 0, y = 0}, {time = 500});
    
  end
end

Runtime:addEventListener("touch", touchHandler);

Runtime:addEventListener("enterFrame", function(event) 
  character.x = character.x + velocity.x;
  character.y = character.y + velocity.y;
end);