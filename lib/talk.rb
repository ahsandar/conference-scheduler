class Talk
  attr_accessor :type, :description, :tag, :title, :duration

  def initialize(type, description, tag, title, duration)
    @type = type
    @description = description
    @tag = tag
    @title = title
    @duration = duration
  end

  def pp_talk
    "#{@title} #{@type}"
  end

end
