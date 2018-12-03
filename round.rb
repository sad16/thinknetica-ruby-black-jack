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
    output("<RATES>")
    bank.put(player.rate + diler.rate)
  end

  def start
    output("<START>")
    deck.shuffle

    2.times { player.card(deck.card) }
    2.times { diler.card(deck.card) }

    output("Player cards: #{player.show_cards}")
    output("Dealer сards: * *")
  end

  def steps
    output("<STEPS>")

    loop do
      break unless player_step

      diler_step
    end
  end

  def open
    output("<OPEN>")
    output("Player cards: #{player.show_cards}")
    output("Dealer сards: #{diler.show_cards}")
  end

  def result
    output("<RESULT>")
    winner = self.winner
    sum = bank.take(bank.sum)

    if winner
      output("Winner: #{winner.name}")
      winner.put_bank(sum)
    else
      output("Dead heat")
      half_sum = sum/2
      diler.put_bank(half_sum)
      player.put_bank(half_sum)
    end

    output("Bank: #{player.bank.sum}")
  end

  def winner
    diler_points = diler.points
    player_points = player.points

    return if diler_points == player_points || (diler_points > MAX_POINTS && player_points > MAX_POINTS)
    return diler if player_points > MAX_POINTS
    return player if diler_points > MAX_POINTS

    player_points > diler_points ? player : diler
  end

  def next_round?
    output("Next round? (y/n)")
    input.downcase == "y"
  end

  private

  def player_step
    output("<PLAYER STEP>")
    output("Actions: #{player.show_actions}")

    case input
    when "add"
      player.actions.delete("add")
      player.card(deck.card)
      output("Player cards: #{player.show_cards}")
      true
    when "open"
      open
      false
    when "pass"
      player.actions.delete("pass")
      true
    end
  end

  def diler_step
    output("<DILER STEP>")
    diler.card(deck.card) if diler.points < diler.max_points
  end
end
