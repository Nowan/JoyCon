return function(joy_con)
  local stick = display.newCircle(joy_con, 0, 0, 25);
  
  stick.radius = stick.path.radius;
  
  stick:setFillColor(1.0, 1.0, 1.0, 0.5)
  stick.strokeWidth = 5;
  stick:setStrokeColor(1.0, 1.0, 1.0, 1.0);
  
  return stick;
end