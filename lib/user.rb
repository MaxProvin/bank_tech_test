class User

  attr_reader :balance, :history

  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
    @history = []
  end

  def deposit(sum)
    transaction = Transaction.new
    transaction.deposit(sum)
    update_account(transaction)
  end

  def withdraw(sum)
    transaction = Transaction.new
    transaction.withdraw(sum)
    update_account(transaction)
  end

  def print_statement
    head = "date || credit || debit || balance \n"
    string = ''
    @history.each do |transaction|
      if transaction[:amount] < 0
        pre_pipes = ' || || '
        post_pipes = ' || '
      else
        pre_pipes = ' || '
        post_pipes = ' || || '
      end
      string + ("#{transaction[:date]}" + pre_pipes + "#{transaction[:amount].abs}" + post_pipes + "#{transaction[:balance]}\n")
    end
    return (head + string)
  end

  private

  def update_account(transaction)
    @balance += transaction.value
    @history.push({date: transaction.date, amount: transaction.value, balance: @balance})
  end

end