class Track
  attr_accessor :sessions, :talks, :number, :duration

  def initialize(number)
    @sessions = set_track_sessions
    @talks = []
    @number = number
    @duration = DAILY_TRACK_DURATION_MAX
  end

  def set_track_sessions
    sessions_arr = []
    SESSIONS.each_pair do |seq, duration|
      sessions_arr << Session.new(seq, duration)
    end
    sessions_arr
  end

  def self.assign_daily_track(seq, agenda)
    track = self.new(seq)
    total_duration = track.duration
    agenda.each do |talk|
      total_duration -=  talk.duration
      total_duration >= 0 ? track.add_talk_to_track(talk) : break
    end
    track
  end

  def add_talk_to_track(talk)
    @talks << talk
  end

  def pp_track_talks
    track_talks = []
    @talks.each do |talk|
      track_talks << talk.pp_talk
    end
    track_talks
  end

  def assign_talks_to_session
      talks_dup = @talks.dup

      @sessions.each do |session|
      session.assign_talks_to_session(talks_dup)
      talks_dup = talks_dup - session.talks
    end

  end

end
