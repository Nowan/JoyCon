local function dist(x1, y1, x2, y2)
  return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2));
end

return function(joy_con, event)
  local xPos, yPos = joy_con:localToContent(0, 0);
  local dx = event.x - xPos;
  local dy = event.y - yPos;
  local dist = math.sqrt(math.pow(dx, 2) + math.pow(dy, 2));
  local radius = joy_con.range.radius;
  
  --if (dist < radius) then
    radius = radius - joy_con.stick.radius;
    local angle = math.atan2(dy, dx);
    local strength = event.phase == "ended" and 0 or math.min(dist, radius) / radius;
    local horizontal = strength * math.cos(angle);
    local vertical = strength * math.sin(angle);
    
    joy_con.stick.x = radius * horizontal;
    joy_con.stick.y = radius * vertical;
    
    joy_con:dispatchEvent({name = "stick", xStrength = horizontal, yStrength = vertical});
  --end
end