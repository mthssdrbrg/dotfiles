IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] ||= []
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
  IRB.conf[:LOAD_MODULES] << 'irb/completion'
end
IRB.conf[:SAVE_HISTORY] = 10_000
