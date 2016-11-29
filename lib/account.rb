class Account

	attr_reader :owner

	def initialize(owner: owner)
		@owner = owner
	end

end