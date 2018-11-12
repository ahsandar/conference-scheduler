class Conference
  attr_accessor :talks_list, :conf_days

  def initialize(talks_hash)
    @talks_list = populate_talk_list(talks_hash)
    @keynote = @talks_list.delete('KEYNOTE')
    @closing = @talks_list.delete('CLOSING')
    @conf_days = setup_days
    assign_daily_conference_agenda
  end

  def setup_days
    days = []
    DAYS.each_with_index do |day, index|
      conf_day = Day.new(index+1, day)
      days << conf_day
    end
    days
  end

  def populate_talk_list(talks_hash)
    talks = {}
    talks_hash['talks'].each do |talk|
      talk_type = talk['type']
      description = talk['description']
      tag = talk['tag']
      title = talk['title']
      duration = TALK_DURATION[talk_type]
      talks[talk_type] ||= []
      talks[talk_type] << Talk.new(talk_type, description, tag, title,  duration)
    end
    talks
  end

  def assign_daily_conference_agenda
    Sorter.talk_sort_for_day(@talks_list, @conf_days)
    Sorter.keynote_sort_for_day(@keynote, @conf_days)
    Sorter.closing_sort_for_day(@closing, @conf_days)
  end

  def pp_agenda
    agenda = []
    @conf_days.each do |conf_day|
      agenda << conf_day.pp_daily_agenda
    end
    agenda
  end




end
