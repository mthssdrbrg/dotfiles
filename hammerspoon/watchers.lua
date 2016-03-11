-- Get rid of pesky warnings from OS X when putting computer
-- to sleep and then disconnecting external drives
function ejectExternalDrivesWatcher(eventType)
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
hs.caffeinate.watcher.new(ejectExternalDrivesWatcher):start()
