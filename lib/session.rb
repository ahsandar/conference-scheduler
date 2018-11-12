class Session
  attr_accessor :seq, :duration, :talks, :talk_time

  def initialize(seq, duration)
    @seq = seq
    @duration = duration
    @talk_time = nil
    @talks = []
  end

  def add_talk_to_session(talk)
    @talks << talk
  end

  def pp_session_talks
    session_talks = []
    @talks.each do |talk|
      session_talks << talk.pp_talk
    end
    session_talks
  end

  def assign_talks_to_session(talks)
    session_duration = self.duration
    talks.each do |talk|
      session_duration -= talk.duration
      session_duration >= 0 ? self.add_talk_to_session(talk) : break
    end
  end

  def schedule(day, start_time)
     session_schedule = []
     @talks.each_with_index do |talk, index|
       start_time = start_time + (talk.duration/HOURLY).round(2) if index > 0
       session_schedule << "#{Helper.time_format(day, start_time)}: #{talk.pp_talk}"
     end
     session_schedule
  end


end
