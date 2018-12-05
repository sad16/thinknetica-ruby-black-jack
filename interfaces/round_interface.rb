require_relative "io_interface"

class RoundInterface
  include IOInterface

  attr_reader :round

  def initialize(round)
    @round = round
  end

  def start
    rates
    init
    steps
    open
    result
    prize
  end

  def rates
    output("<RATES>")
    round.rates
  end

  def init
    output("<INIT>")
    round.init
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
    winner = round.winner
    message = winner ? "Winner: #{winner.name}" : "Dead heat"
    output(message)
  end

  def prize
    round.prize
    output("Bank: #{player.bank.sum}")
  end

  def next_round?
    output("Next round? (y/n)")
    input.casecmp("y").zero?
  end

  private

  def diler
    round.diler
  end

  def player
    round.player
  end

  def deck
    round.deck
  end

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
