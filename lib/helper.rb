class Helper

  def self.time_format(time, hours)
    event_time =  time + (hours*3600)
    event_time.strftime('%H:%M')
  end
end
