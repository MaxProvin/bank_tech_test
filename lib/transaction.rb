class Transaction

  attr_reader :value, :history, :date

  def initialize()
    @value = 0
    @date = nil
  end

  def deposit(sum)
    @value = sum
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def withdraw(sum)
    @value = -sum
    @date = Time.now.strftime("%d/%m/%Y")
  end

end