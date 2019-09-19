return function(joy_con)
  local range = display.newCircle(joy_con, 0, 0, 100);
  
  range.radius = range.path.radius;
  
  range:setFillColor(1.0, 1.0, 1.0, 0.3)
  range.strokeWidth = 5;
  range:setStrokeColor(1.0, 1.0, 1.0, 1.0);
  
  return range;
end