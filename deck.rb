require_relative 'num_card'
require_relative 'figure_card'
require_relative 'ace_card'

class Deck
  SUITS = %w(♠ ♥ ♣ ♦)
  NUM_CARDS = %w(2 3 4 5 6 7 8 9 10)
  FIGURE_CARDS = %w(В Д К)
  ACE_CARDS = %w(Т)

  attr_reader :cards

  def initialize
    @cards = init_cards
  end

  def init_cards
    cards = SUITS.map do |suit|
      [
        NUM_CARDS.map { |num_card| NumCard.new("#{num_card}#{suit}") },
        FIGURE_CARDS.map { |figure_card| FigureCard.new("#{figure_card}#{suit}") },
        ACE_CARDS.map { |ace_card| AceCard.new("#{ace_card}#{suit}") }
      ].flatten
    end

    cards.flatten
  end

  def shuffle
    cards.shuffle!
  end

  def card
    cards.delete(cards.first)
  end
end
