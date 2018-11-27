class Bank
  DEFAULT_SUM = 100

  attr_reader :sum

  def initialize(sum = nil)
    @sum = sum || DEFAULT_SUM
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
