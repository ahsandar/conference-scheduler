class App
  attr_reader :conference_schedule

  def initialize(talk_file)
    @talk_file = talk_file
    @talks_json = File.read("#{Dir.pwd}/input/#{@talk_file}")
    @talks_hash = JSON.parse(@talks_json)
    @conference = Conference.new(@talks_hash)
    @conference_schedule  = Schedule.new(@conference)
  end

  def run
    @conference.conf_days.each do |conf_day|
      conf_day.setup_daily_track_sessions
    end
    @conference_schedule.pp
  end

  def conf_schedule
    @conference_schedule.output
  end

end
