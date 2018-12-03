require_relative 'card'

class AceCard < Card
  def init_value
    { min: min, max: max }
  end

  def min
    1
  end

  def max
    11
  end
end
