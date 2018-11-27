class Hand
  MAX_POINTS = 21

  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def points
    points_without_aces = not_aces_cards.map(&:value).sum
    max_points_aces = aces_cards.map(&:max).sum
    return points_without_aces if max_points_aces.zero?

    max_points = points_without_aces + max_points_aces
    return max_points if max_points <= MAX_POINTS

    aces_cards.reduce(points_without_aces) do |acc, ace|
      max = acc + ace.max
      min = acc + ace.min
      max < MAX_POINTS ? max : min
    end
  end

  private

  def not_aces_cards
    cards.select { |card| card unless card.instance_of?(AceCard) }
  end

  def aces_cards
    cards.select { |card| card if card.instance_of?(AceCard) }
  end
end
