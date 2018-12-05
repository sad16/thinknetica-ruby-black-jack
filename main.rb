require_relative "interfaces/play_interface"
require_relative "play"

PlayInterface.new(Play.new).start
