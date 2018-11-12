#Monkeypatch - ActiveSupport method patch for Array grouping
class Array
  def in_groups(number)
    group_size = size / number
    leftovers = size % number

    groups = []
    start = 0
    number.times do |index|
      length = group_size + (leftovers > 0 && leftovers > index ? 1 : 0)
      groups << slice(start, length)
      start += length
    end

    groups
  end
end
