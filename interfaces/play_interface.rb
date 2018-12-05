require_relative "io_interface"
require_relative "round_interface"

class PlayInterface
  include IOInterface

  attr_reader :play

  def initialize(play)
    @play = play
  end

  def start
    output("Black Jack")
    output("Hello! My name is #{diler.name}. I am diler.")

    create_player

    loop do
      round_interface = RoundInterface.new(create_round)
      round_interface.start
      break unless round_interface.next_round?
    end

    output("Thanks for playing, #{player.name}!")
  end

  def create_player
    output("What is you name?")
    player_name = input
    play.create_player(player_name)
  end

  def create_round
    play.create_round
  end

  private

  def diler
    play.diler
  end

  def player
    play.player
  end
end
