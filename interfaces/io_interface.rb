module IOInterface
  def output(message)
    puts message
  end

  def input
    gets.chomp
  end
end
