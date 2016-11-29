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
			sum > 0 ? c = "|| #{sum} ||" : d = EMPTY
			sum > 0 ? c = EMPTY : d = "|| #{sum.abs} ||"
			balance = "|| #{log[:balance]} ||"
			string += (date + c + d + balance)
		end
		string
	end

end