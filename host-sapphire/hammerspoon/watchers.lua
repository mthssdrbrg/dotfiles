-- Get rid of pesky warnings from OS X when putting computer
-- to sleep and then disconnecting external drives
local ejectExternalDrives = function(eventType)
  if (eventType == hs.caffeinate.watcher.systemWillSleep) then
    for path, volume in pairs(hs.fs.volume.allVolumes()) do
      if volume.NSURLVolumeIsEjectableKey then
        hs.fs.volume.eject(path)
      elseif not volume.NSURLVolumeIsInternalKey then
        hs.execute('diskutil umount "' .. path .. '"')
      end
    end
  end
end
hs.caffeinate.watcher.new(ejectExternalDrives):start()

-- Don't know any better way to declare or deal with this
local previousPosition = nil
-- Move or resize window depending on modifier keys pressed
local moveOrResizeWindow = function(event)
  local modifiers = event:getFlags()
  if modifiers.shift and (modifiers.cmd or modifiers.alt) then
    local win = hs.window.focusedWindow()
    local app = win:application()
    local eventType = event:getType()
    if eventType == hs.eventtap.event.types.leftMouseDown then
      previousPosition = hs.mouse.getAbsolutePosition()
    elseif eventType == hs.eventtap.event.types.leftMouseDragged then
      local currentPosition = hs.mouse.getAbsolutePosition()
      local diff_x = currentPosition.x - previousPosition.x
      local diff_y = currentPosition.y - previousPosition.y
      local f = win:frame()
      if modifiers.cmd then
        f.x = f.x + diff_x
        f.y = f.y + diff_y
      elseif modifiers.alt then
        f.w = f.w + diff_x
        f.h = f.h + diff_y
      end
      previousPosition = currentPosition
      win:setFrame(f)
      return true, {event}
    elseif eventType == hs.eventtap.event.types.leftMouseUp then
      previousPosition = nil
    end
    return true
  end
end

moveWindowTap = hs.eventtap.new({
  hs.eventtap.event.types.leftMouseDown,
  hs.eventtap.event.types.leftMouseDragged,
  hs.eventtap.event.types.leftMouseUp,
}, moveOrResizeWindow)
moveWindowTap:start()
