class Statement

	HEADER = "date       || credit || debit   || balance"

	attr_reader :information

	def initialize(transaction_log)
		@information = transaction_log
	end

	def print
		information.each do |log|
			date = "#{log['date']} ||"
			credit = "#{log['credit']}"
		end
	end

end