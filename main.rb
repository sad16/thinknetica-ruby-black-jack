require_relative "interfaces/io_interface"
require_relative "diler"
require_relative "player"
require_relative "play"

include IOInterface

output("Black Jack")

diler = Diler.new("Frank")

output("What is you name?")
player_name = input
player = Player.new(player_name)
# player = Player.new("Artyom")

output("Hello, #{player.name}! My name is #{diler.name}. I am diler.")

loop do
  play = Play.new(diler, player)

  loop do
    round = play.round

    round.rates
    round.start
    round.steps
    round.result

    break unless round.next_round?
  end

  break unless play.next_play?
end

output("Thanks for playing, #{player.name}!")
