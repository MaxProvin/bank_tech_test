class User

  attr_reader :balance, :history

  INITIAL_BALANCE = 0
  STATEMENT_HEADER = "date || credit || debit || balance\n"


  def initialize
    @balance = INITIAL_BALANCE
    @history = []
  end

  def deposit(sum)
    transaction = Transaction.new(sum)
    update_account(transaction)
  end

  def withdraw(sum)
    transaction = Transaction.new(-sum)
    update_account(transaction)
  end

  def print_statement
    string = ''
    @history.each do |transaction|
      if transaction[:amount] < 0
        pre_pipes = ' || || '
        post_pipes = ' || '
      else
        pre_pipes = ' || '
        post_pipes = ' || || '
      end
      string += "#{transaction[:date]}" + pre_pipes + "#{transaction[:amount].abs}" + post_pipes + "#{transaction[:balance]}\n"
    end
    return (STATEMENT_HEADER + string).chomp
  end

  private

  def update_account(transaction)
    @balance += transaction.amount
    @history.push({date: transaction.date, amount: transaction.amount, balance: @balance})
  end

end