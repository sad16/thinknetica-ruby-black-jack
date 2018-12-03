require_relative 'bank'
require_relative 'hand'

class User
  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name && name.capitalize
    @bank = Bank.new
    @hand = Hand.new
  end

  def rate
    bank.take(default_rate)
  end

  def put_bank(sum)
    bank.put(sum)
  end

  def card(card)
    hand.add_card(card)
  end

  def points
    hand.points
  end

  def cards
    hand.cards
  end

  def show_cards
    "#{cards.map(&:name).join(' ')}, points: #{points}"
  end

  def hand_clear
    hand.clear
  end

  protected

  def default_rate
    10
  end
end
