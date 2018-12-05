require_relative "interfaces/io_interface"
require_relative "bank"
require_relative "deck"

class Round
  MAX_POINTS = 21

  attr_reader :diler, :player, :bank, :deck

  def initialize(diler, player)
    @diler = diler
    @diler.hand_clear

    @player = player
    @player.init_actions
    @player.hand_clear

    @bank = Bank.new
    @deck = Deck.new
  end

  def rates
    bank.put(player.rate + diler.rate)
  end

  def init
    deck.shuffle
    2.times { player.card(deck.card) }
    2.times { diler.card(deck.card) }
  end

  def winner
    diler_points = diler.points
    player_points = player.points

    return if diler_points == player_points || (diler_points > MAX_POINTS && player_points > MAX_POINTS)
    return diler if player_points > MAX_POINTS
    return player if diler_points > MAX_POINTS

    player_points > diler_points ? player : diler
  end

  def prize
    sum = bank.take(bank.sum)
    return winner.put_bank(sum) if winner

    half_sum = sum/2
    diler.put_bank(half_sum)
    player.put_bank(half_sum)
  end
end
