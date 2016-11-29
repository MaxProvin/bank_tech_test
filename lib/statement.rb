class Statement

	HEADER = "date       || credit || debit   || balance"
	EMPTY = "        "

	attr_reader :information

	def initialize(transaction_log)
		@information = transaction_log
	end

	def format
		string = ""
		information.each do |log|
			date = "#{log[:date]}"
			sum = log[:transaction]
		
			balance = "#{log[:balance]}"
			string += date + c + d
		end
	end
end