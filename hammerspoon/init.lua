hs.window.animationDuration = 0
hs.hints.hintChars = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'}
hs.dockIcon(false)
appKeybindings = {
  {key = 'I', app = 'iTerm' },
  {key = 'C', app = 'Google Chrome' },
  {key = 'S', app = 'Spotify' },
  {key = 'T', app = 'Twitter' },
  {key = 'G', app = 'Kiwi for Gmail' },
  {key = 'W', app = 'Wunderlist' },
  {key = 'Z', app = 'Slack' },
  {key = 'Q', app = 'Quiver' },
  {key = 'X', app = 'GitX', focus = true },
  {key = 'M', app = 'MacVim', focus = true }
}
hyper = {'cmd', 'alt', 'ctrl', 'shift'}

require 'watchers'
require 'window'
require 'util'

-- Toggle VPN
hs.hotkey.bind(hyper, 'v', function()
  hs.execute(os.getenv('HOME') .. '/.dotfiles/bin/toggle-vpn' .. ' "Test VPN"')
end)

-- Show window hints
hs.hotkey.bind(hyper, 'F', function()
  hs.hints.windowHints()
end)

-- Reload Hammerspoon configuration
hs.hotkey.bind(hyper, 'R', function()
  hs.reload()
end)

-- Forcefully paste first item in clipboard
hs.hotkey.bind({'cmd', 'alt'}, 'V', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Set up app shortcuts
hs.fnutils.each(appKeybindings, function(config)
  hs.hotkey.bind(hyper, config.key, function()
    if config.focus then
      local app = hs.application.get(config.app)
      if app then
        app:activate()
      end
    else
      hs.application.launchOrFocus(config.app)
    end
  end)
end)
