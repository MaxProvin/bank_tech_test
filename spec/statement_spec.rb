require 'statement'

describe Statement do
	
	subject(:statement) { described_class.new(DateTime.new(2016, 1, 25)) }

	context 'Initialization: ' do
		it 'Has a date in DateTime format' do
			expect(statement.date.class).to eq DateTime
			expect(statement.date).to eq (DateTime.new(2016, 1, 25))
		end
	end
end