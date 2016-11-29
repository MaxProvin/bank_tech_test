class Account

	INITIAL_BALANCE = 0

	attr_reader :owner, :balance, :transactions

	def initialize(owner)
		@owner = owner
		@balance = INITIAL_BALANCE
		@transactions = []
	end

	def deposit(amount)
		@balance += amount
		transactions.push({
			date: DateTime.now,
			transaction: amount,
			balance: balance
			})
	end

	def withdraw(amount)
		@balance -= amount
		transactions.push({
			date: DateTime.now,
			transaction: -amount,
			balance: balance
			})
	end

end