function hs.hotkey.bindRepeated(mods, key, func)
  hs.hotkey.bind(mods, key, func, nil, func)
end
