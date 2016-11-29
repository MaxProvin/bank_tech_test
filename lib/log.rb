class Log

	attr_reader :display

	def initialize
		@display = []
	end

	def store(d, t, b)
		data = {date: d, transaction: t, balance: b}
		display.push(data)
	end

end