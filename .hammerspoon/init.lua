local function keyCode(key, modifiers)
  modifiers = modifiers or {}

  return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(100)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

hs.hotkey.bind({'ctrl'}, 'h', keyCode('left'), nil, keyCode('left'))
hs.hotkey.bind({'ctrl'}, 'j', keyCode('down'), nil, keyCode('down'))
hs.hotkey.bind({'ctrl'}, 'k', keyCode('up'), nil, keyCode('up'))
hs.hotkey.bind({'ctrl'}, 'l', keyCode('right'), nil, keyCode('right'))
hs.hotkey.bind({'shift'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))

hs.eventtap.new({ hs.eventtap.event.types.NSSystemDefined }, function(event)
    -- http://www.hammerspoon.org/docs/hs.eventtap.event.html#systemKey
    event = event:systemKey()
    -- http://stackoverflow.com/a/1252776/1521064
    local next = next
    -- Check empty table
    if next(event) then
        -- if event.key == 'EJECT' and event.down then
           	-- hs.caffeinate.systemSleep()
        -- end
    end
end):start()

browser_handler = require('browser_handler')
browser_handler.start()




-- local function pressFn(mods, key)
--   if key == nil then
--     key = mods
--     mods = {}
--   end

--   return function() hs.eventtap.keyStroke(mods, key, 1000) end
-- end

-- local function remap(mods, key, pressFn)
--   hs.hotkey.bind(mods, key, pressFn, nil, pressFn)  
-- end


-- remap({'ctrl'}, 'h', pressFn('left'))
-- remap({'ctrl'}, 'j', pressFn('down'))
-- remap({'ctrl'}, 'k', pressFn('up'))
-- remap({'ctrl'}, 'l', pressFn('right'))

-- remap({'ctrl', 'shift'}, 'h', pressFn({'shift'}, 'left'))
-- remap({'ctrl', 'shift'}, 'j', pressFn({'shift'}, 'down'))
-- remap({'ctrl', 'shift'}, 'k', pressFn({'shift'}, 'up'))
-- remap({'ctrl', 'shift'}, 'l', pressFn({'shift'}, 'right'))

-- remap({'ctrl', 'cmd'}, 'h', pressFn({'cmd'}, 'left'))
-- remap({'ctrl', 'cmd'}, 'j', pressFn({'cmd'}, 'down'))
-- remap({'ctrl', 'cmd'}, 'k', pressFn({'cmd'}, 'up'))
-- remap({'ctrl', 'cmd'}, 'l', pressFn({'cmd'}, 'right'))

-- remap({'ctrl', 'alt'}, 'h', pressFn({'alt'}, 'left'))
-- remap({'ctrl', 'alt'}, 'j', pressFn({'alt'}, 'down'))
-- remap({'ctrl', 'alt'}, 'k', pressFn({'alt'}, 'up'))
-- remap({'ctrl', 'alt'}, 'l', pressFn({'alt'}, 'right'))

-- remap({'ctrl', 'shift', 'cmd'}, 'h', pressFn({'shift', 'cmd'}, 'left'))
-- remap({'ctrl', 'shift', 'cmd'}, 'j', pressFn({'shift', 'cmd'}, 'down'))
-- remap({'ctrl', 'shift', 'cmd'}, 'k', pressFn({'shift', 'cmd'}, 'up'))
-- remap({'ctrl', 'shift', 'cmd'}, 'l', pressFn({'shift', 'cmd'}, 'right'))

-- remap({'ctrl', 'shift', 'alt'}, 'h', pressFn({'shift', 'alt'}, 'left'))
-- remap({'ctrl', 'shift', 'alt'}, 'j', pressFn({'shift', 'alt'}, 'down'))
-- remap({'ctrl', 'shift', 'alt'}, 'k', pressFn({'shift', 'alt'}, 'up'))
-- remap({'ctrl', 'shift', 'alt'}, 'l', pressFn({'shift', 'alt'}, 'right'))

-- remap({'ctrl', 'cmd', 'alt'}, 'h', pressFn({'cmd', 'alt'}, 'left'))
-- remap({'ctrl', 'cmd', 'alt'}, 'j', pressFn({'cmd', 'alt'}, 'down'))
-- remap({'ctrl', 'cmd', 'alt'}, 'k', pressFn({'cmd', 'alt'}, 'up'))
-- remap({'ctrl', 'cmd', 'alt'}, 'l', pressFn({'cmd', 'alt'}, 'right'))

-- remap({'ctrl', 'cmd', 'alt', 'shift'}, 'h', pressFn({'cmd', 'alt', 'shift'}, 'left'))
-- remap({'ctrl', 'cmd', 'alt', 'shift'}, 'j', pressFn({'cmd', 'alt', 'shift'}, 'down'))
-- remap({'ctrl', 'cmd', 'alt', 'shift'}, 'k', pressFn({'cmd', 'alt', 'shift'}, 'up'))
-- remap({'ctrl', 'cmd', 'alt', 'shift'}, 'l', pressFn({'cmd', 'alt', 'shift'}, 'right'))