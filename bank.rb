class Bank
  attr_reader :sum

  def initialize(sum = 0)
    @sum = sum
  end

  def take(sum)
    return unless sum?(sum)
    self.sum -= sum
    sum
  end

  def put(sum)
    self.sum += sum
  end

  def empty?
    sum.zero?
  end

  def sum?(sum)
    self.sum >= sum
  end

  private

  attr_writer :sum
end
