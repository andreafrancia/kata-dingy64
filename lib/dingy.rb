def format_time time
  '%02d:%02d' % [time/60, time%60]
end
def remaining_time now, ring_time
  require 'time'
  Time.parse(ring_time)-Time.parse(now)
end

