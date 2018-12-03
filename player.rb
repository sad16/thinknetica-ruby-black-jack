require_relative 'user'

class Player < User
  attr_reader :actions

  def self.actions
    {
      "add" => "Add card",
      "pass" => "Pass",
      "open" => "Open cards"
    }
  end

  def init_actions
    self.actions = self.class.actions
  end

  def show_actions
    actions.map { |key, value| "#{value} (#{key})" }.join(', ').to_s
  end

  private

  attr_writer :actions
end
