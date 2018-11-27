class Card
  attr_reader :name, :value

  def initialize(name)
    @name = name
    @value = init_value
  end

  def init_value
    raise NotImplementedError
  end
end
