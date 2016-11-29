class Statement

	attr_reader :date, :credit, :debit, :balance

	def initialize(date, transfer, balance)
		@date = date
		@credit = transfer if transfer > 0
		@debit = -transfer if transfer < 0
		@balance = balance
	end

end