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
    string = STATEMENT_HEADER
    @history.each do |transaction|
      string += string_constructer(transaction)
    end
    return string.chomp
  end

  private

  def update_account(transaction)
    @balance += transaction.amount
    @history.push({date: transaction.date, amount: transaction.amount, balance: @balance})
  end

  def string_constructer(transaction)
    date = "#{transaction[:date]}"
    amount = " || || #{transaction[:amount].abs} || "
    amount = " || #{transaction[:amount].abs} || || " if transaction[:amount] >= 0
    current_balance = "#{transaction[:balance]}\n"
    return (date + amount + current_balance)
  end

end