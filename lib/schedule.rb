class Schedule

  attr_accessor :conference, :daily_schedule

  def initialize(conference)
    @conference = conference
    @daily_schedule = {}
  end

  def pp
    @conference.conf_days.each_with_index do |conf_day, index|
      day = conf_day.number
      @daily_schedule["Day"] ||={}
      @daily_schedule["Day"]["#{day}"] ||= {}
      @daily_schedule["Day"]["#{day}"]['KEYNOTE'] =
        "#{Helper.time_format(DAYS[index], DAILY_SCHEDULE_TIMING['KEYNOTE'])} #{conf_day.pp_keynote}"
      @daily_schedule["Day"]["#{day}"]['LUNCH'] = "#{Helper.time_format(DAYS[index], DAILY_SCHEDULE_TIMING['LUNCH'])} LUNCH"
      @daily_schedule["Day"]["#{day}"]['TEA'] = "#{Helper.time_format(DAYS[index], DAILY_SCHEDULE_TIMING['TEA'])} TEA"
      @daily_schedule["Day"]["#{day}"]['CLOSING'] =
        "#{Helper.time_format(DAYS[index], DAILY_SCHEDULE_TIMING['CLOSING'])} #{conf_day.pp_closing}"

      conf_day.tracks.each do |track|
        track.sessions.each do |session|
          @daily_schedule["Day"]["#{day}"]["Track"] ||= {}
          @daily_schedule["Day"]["#{day}"]["Track"]["#{track.number}"] ||= {}
          @daily_schedule["Day"]["#{day}"]["Track"]["#{track.number}"]["Session"] ||={}
          @daily_schedule["Day"]["#{day}"]["Track"]["#{track.number}"]["Session"]["#{session.seq}"] =
          session.schedule(DAYS[index], DAILY_SCHEDULE_TIMING["SESSION:#{session.seq}"])
        end
      end
    end
    self
  end

  def output
    @daily_schedule["Day"].each_pair do |k,v|
      v['Track'].each_pair do |k1,v1|
        puts "Day #{k} Track #{k1}"
        puts v['KEYNOTE']
        puts v1['Session']["1"]
        puts v['LUNCH']
        puts v1['Session']["2"]
        puts v['TEA']
        puts v1['Session']["3"]
        puts v['CLOSING']
      end
    end
  end

end
