class Statement

	HEADER = "date       || credit || debit   || balance\n"
	NO_CREDIT = "        "
	NO_DEBIT = "         "

	attr_reader :information

	def initialize(transaction_log = Log.new)
		@information = transaction_log.display
	end

	def print
		string = ""
		information.reverse.each do |log|
			date = log[:date].strftime("%d/%m/%Y") + ' '
			transaction = log[:transaction].to_f
			balance = '%.2f' % log[:balance].to_f
			string += (date + credit_debit_string(transaction) + balance + "\n")
		end
		puts (HEADER + string)
	end

	private

	def credit_debit_string(transaction)
		if transaction > 0
			credit, debit = '%.2f' % transaction, NO_DEBIT
		else
			credit, debit = NO_CREDIT, '%.2f' % transaction.abs
		end
		if credit != NO_CREDIT
			(NO_CREDIT.length - credit.length).times { credit += ' ' }
		elsif debit != NO_DEBIT
			(NO_DEBIT.length - debit.length).times { debit += ' ' }
		end
		"||#{credit}||#{debit}||"
	end
end