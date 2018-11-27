require_relative 'bank'
require_relative 'hand'

class User
  DEFAULT_RATE = 10

  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name && name.capitalize
    @bank = Bank.new
    @hand = Hand.new
  end

  def rate
    bank.take(DEFAULT_RATE)
  end

  def take_win(sum)
    bank.put(sum)
  end
end
