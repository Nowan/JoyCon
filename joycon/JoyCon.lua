local LIB_DIR = (...):match("(.-)[^%.]+$");

local Range = require(LIB_DIR.."Range");
local Stick = require(LIB_DIR.."Stick");
local touchHandler = require(LIB_DIR.."touchHandler");

return function()
  local joy_con = display.newGroup();
  
  --------------------------------------------------------------------------------
  --	Private fields
  --------------------------------------------------------------------------------
  
  local _touchHandler, _onRangeChange;
  local _removeSelf = joy_con.removeSelf;
  --------------------------------------------------------------------------------
  --	Public fields
  --------------------------------------------------------------------------------
  
  function joy_con:removeSelf()
    Runtime:removeEventListener("touch", _touchHandler);
    _removeSelf(self);
    
  end
  --------------------------------------------------------------------------------
  --	Visual composites
  --------------------------------------------------------------------------------
  
  joy_con.range = Range(joy_con);
  joy_con.stick = Stick(joy_con);
  --------------------------------------------------------------------------------
  --	Private methods implementation
  --------------------------------------------------------------------------------
  
  _touchHandler = function(event)
    touchHandler(joy_con, event);
  end
  
  Runtime:addEventListener("touch", _touchHandler);
  
  return joy_con;
end