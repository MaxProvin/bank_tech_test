class Account

	INITIAL_BALANCE = 0

	attr_reader :owner, :balance, :transactions

	def initialize(owner, log = Log.new)
		@owner = owner
		@balance = INITIAL_BALANCE
		@transactions = log
	end

	def deposit(amount)
		@balance += amount
		transactions.store(DateTime.now, amount, balance)
	end

	def withdraw(amount)
		@balance -= amount
		transactions.store(DateTime.now, -amount, balance)
	end

end