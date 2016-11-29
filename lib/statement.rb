class Statement

	HEADER = "date       || credit || debit   || balance\n"
	EMPTY = "        "

	attr_reader :information

	def initialize(transaction_log = Log.new)
		@information = transaction_log.display
	end

	def format
		string = ""
		information.each do |log|
			date = "#{log[:date].strftime("%d/%m/%Y")} ||"
			if log[:transaction] > 0
				credit, debit = "#{log[:transaction]} ||", EMPTY
			else
				credit, debit = EMPTY, " #{log[:transaction]} ||"
			end
			balance = " #{log[:balance]} ||"
			string += (date + credit + debit + balance + "\n")
		end
		puts HEADER + string
	end
end