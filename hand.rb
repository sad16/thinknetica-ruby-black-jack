class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def card(card)
    cards << card
  end

  def points
  end
end
