require_relative "interfaces/io_interface"
require_relative "diler"
require_relative "player"
require_relative "round"

class Play
  attr_reader :diler, :player

  def initialize
    @diler = Diler.new("Frank")
    @diler.put_bank(100)
  end

  def create_player(player_name)
    self.player = Player.new(player_name)
    player.put_bank(100)
    player
  end

  def create_round
    Round.new(diler, player)
  end

  private

  attr_writer :player
end
