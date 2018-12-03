require_relative "interfaces/io_interface"
require_relative "round"

class Play
  attr_reader :diler, :player, :bank

  def initialize(diler, player)
    @diler = diler
    @diler.put_bank(100)
    @player = player
    @player.put_bank(100)
  end

  def round
    Round.new(diler, player)
  end

  def next_play?
    output("Next play? (y/n)")
    input.casecmp("y").zero?
  end
end
