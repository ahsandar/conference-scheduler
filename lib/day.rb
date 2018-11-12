class Day

  attr_accessor :track, :keynote, :closing,  :agenda, :number, :tracks

  def initialize(number, date)
    @number = number
    @date = date
    @keynote = nil
    @closing = nil
    @tracks = []
    @agenda = []
  end

  def setup_daily_track_sessions
    set_daily_track
    assign_daily_sessions_to_tracks
  end

  def set_daily_track
    i = 1
    agenda_dup = agenda.dup
    while (i > 0) do
      track = Track.assign_daily_track(i, agenda_dup)
      @tracks << track
      agenda_dup = agenda_dup - track.talks
      break if agenda_dup.empty?
      i += 1
    end
  end

  def assign_daily_sessions_to_tracks
    @tracks.each do |track|
      track.assign_talks_to_session
    end
  end

  def set_daily_agenda(talk)
    @agenda << talk
    @agenda.flatten!
  end

  def pp_daily_agenda
    agenda_talks = []
    @agenda.each do |talk|
      agenda_talks << talk.pp_talk
    end
    agenda_talks
  end

  def pp_keynote
    keynote.nil? ? 'No Keynote' : keynote.pp_talk
  end

  def pp_closing
    closing.nil? ? 'No Closing' : closing.pp_talk
  end



end
