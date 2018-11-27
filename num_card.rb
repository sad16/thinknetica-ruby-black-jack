require_relative 'card'

class NumCard < Card
  def init_value
    name.to_i
  end
end
