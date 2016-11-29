class Account

	INITIAL_BALANCE = 0

	attr_reader :owner, :balance

	def initialize(owner)
		@owner = owner
		@balance = INITIAL_BALANCE
	end

	def deposit(amount)
		@balance += amount
	end

end