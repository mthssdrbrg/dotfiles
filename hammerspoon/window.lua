-- Utility function
local windowSetup = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  return win, f, max
end

-- Use 50% of the left side of the screen
hs.hotkey.bind({'cmd', 'alt'}, 'Left', function()
  local win, f, max = windowSetup()
  f.w = max.w / 2
  win:setFrame(f)
end)

-- Use 50% of the right side of the screen
hs.hotkey.bind({'cmd', 'alt'}, 'Right', function()
  local win, f, max = windowSetup()
  f.x = max.x + (max.w / 2)
  f.w = max.w / 2
  win:setFrame(f)
end)

-- Use 50% of the upper part of the screen
hs.hotkey.bind({'cmd', 'alt'}, 'Up', function()
  local win, f, max = windowSetup()
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Use 50% of the lower part of the screen
hs.hotkey.bind({'cmd', 'alt'}, 'Down', function()
  local win, f, max = windowSetup()
  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Go full screen
hs.hotkey.bind({'cmd', 'alt'}, 'F', function()
  local win, f, max = windowSetup()
  win:setFrame(f)
end)

-- Resize and center window
hs.hotkey.bind({'cmd', 'alt'}, 'C', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = (max.w * 0.85)
  f.h = (max.h * 0.85)
  f.x = (max.w / 2) - (f.w / 2)
  f.y = (max.h / 2) - (f.h / 2)
  win:setFrame(f)
end)

-- Maximize height and center window
hs.hotkey.bind({'ctrl', 'alt'}, 'C', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.h = max.h
  f.x = (max.w / 2) - (f.w / 2)
  f.y = (max.h / 2) - (f.h / 2)
  win:setFrame(f)
end)
