class Sorter

  def self.talk_sort_for_day(talks_list, conf_days)
    talks_list.each_pair do |talk_type, talk_list|
      talk_list.in_groups(DAYS.size).to_a.each_with_index do |val, index|
        conf_days[index].set_daily_agenda(val.compact)
      end
    end
  end

  def self.keynote_sort_for_day(keynote, conf_days)
    keynote.in_groups(DAYS.size).to_a.each_with_index do |val, index|
      conf_days[index].keynote = val.first
    end


  end

  def self.closing_sort_for_day(closing, conf_days)
    closing.in_groups(DAYS.size).to_a.each_with_index do |val, index|
      conf_days[index].closing = val.first
    end
  end

end
