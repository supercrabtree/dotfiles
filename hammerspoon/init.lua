-- local function keyCode(key, modifiers)
--   modifiers = modifiers or {}

--   return function()
--       hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
--       hs.timer.usleep(100)
--       hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
--   end
-- end

-- hs.hotkey.bind({'ctrl'}, 'h', keyCode('left'),  nil, keyCode('left'))
-- hs.hotkey.bind({'ctrl'}, 'j', keyCode('down'),  nil, keyCode('down'))
-- hs.hotkey.bind({'ctrl'}, 'k', keyCode('up'),    nil, keyCode('up'))
-- hs.hotkey.bind({'ctrl'}, 'l', keyCode('right'), nil, keyCode('right'))

-- hs.hotkey.bind({'ctrl', 'cmd'}, 'h', keyCode('left',  {'cmd'}), nil, keyCode('left',  {'cmd'}))
-- hs.hotkey.bind({'ctrl', 'cmd'}, 'j', keyCode('down',  {'cmd'}), nil, keyCode('down',  {'cmd'}))
-- hs.hotkey.bind({'ctrl', 'cmd'}, 'k', keyCode('up',    {'cmd'}), nil, keyCode('up',    {'cmd'}))
-- hs.hotkey.bind({'ctrl', 'cmd'}, 'l', keyCode('right', {'cmd'}), nil, keyCode('right', {'cmd'}))

-- hs.hotkey.bind({'ctrl', 'alt'}, 'h', keyCode('left',  {'alt'}), nil, keyCode('left',  {'alt'}))
-- hs.hotkey.bind({'ctrl', 'alt'}, 'j', keyCode('down',  {'alt'}), nil, keyCode('down',  {'alt'}))
-- hs.hotkey.bind({'ctrl', 'alt'}, 'k', keyCode('up',    {'alt'}), nil, keyCode('up',    {'alt'}))
-- hs.hotkey.bind({'ctrl', 'alt'}, 'l', keyCode('right', {'alt'}), nil, keyCode('right', {'alt'}))

-- hs.hotkey.bind({'ctrl', 'shift'}, 'h', keyCode('left',  {'shift'}), nil, keyCode('left',  {'shift'}))
-- hs.hotkey.bind({'ctrl', 'shift'}, 'j', keyCode('down',  {'shift'}), nil, keyCode('down',  {'shift'}))
-- hs.hotkey.bind({'ctrl', 'shift'}, 'k', keyCode('up',    {'shift'}), nil, keyCode('up',    {'shift'}))
-- hs.hotkey.bind({'ctrl', 'shift'}, 'l', keyCode('right', {'shift'}), nil, keyCode('right', {'shift'}))

-- hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'h', keyCode('left',  {'shift', 'alt'}), nil, keyCode('left',  {'shift', 'alt'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'j', keyCode('down',  {'shift', 'alt'}), nil, keyCode('down',  {'shift', 'alt'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'k', keyCode('up',    {'shift', 'alt'}), nil, keyCode('up',    {'shift', 'alt'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'l', keyCode('right', {'shift', 'alt'}), nil, keyCode('right', {'shift', 'alt'}))

-- hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'h', keyCode('left',  {'shift', 'cmd'}), nil, keyCode('left',  {'shift', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'j', keyCode('down',  {'shift', 'cmd'}), nil, keyCode('down',  {'shift', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'k', keyCode('up',    {'shift', 'cmd'}), nil, keyCode('up',    {'shift', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'l', keyCode('right', {'shift', 'cmd'}), nil, keyCode('right', {'shift', 'cmd'}))

-- hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'h', keyCode('left',  {'alt', 'cmd'}), nil, keyCode('left',  {'alt', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'j', keyCode('down',  {'alt', 'cmd'}), nil, keyCode('down',  {'alt', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'k', keyCode('up',    {'alt', 'cmd'}), nil, keyCode('up',    {'alt', 'cmd'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'l', keyCode('right', {'alt', 'cmd'}), nil, keyCode('right', {'alt', 'cmd'}))

-- hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'h', keyCode('left',  {'alt', 'cmd', 'shift'}), nil, keyCode('left',  {'alt', 'cmd', 'shift'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'j', keyCode('down',  {'alt', 'cmd', 'shift'}), nil, keyCode('down',  {'alt', 'cmd', 'shift'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'k', keyCode('up',    {'alt', 'cmd', 'shift'}), nil, keyCode('up',    {'alt', 'cmd', 'shift'}))
-- hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'l', keyCode('right', {'alt', 'cmd', 'shift'}), nil, keyCode('right', {'alt', 'cmd', 'shift'}))


browser_handler = require('browser_handler')
browser_handler.start()

hs.alert.show('Hammerspoon reloaded', 1)

-- hs.hotkey.bind({'shift'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))

-- hs.eventtap.new({ hs.eventtap.event.types.NSSystemDefined }, function(event)
--     -- http://www.hammerspoon.org/docs/hs.eventtap.event.html#systemKey
--     event = event:systemKey()
--     -- http://stackoverflow.com/a/1252776/1521064
--     local next = next
--     -- Check empty table
--     if next(event) then
--         -- if event.key == 'EJECT' and event.down then
--            	-- hs.caffeinate.systemSleep()
--         -- end
--     end
-- end):start()
