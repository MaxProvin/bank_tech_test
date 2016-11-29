require 'log'

describe Log do

	subject(:log) { described_class.new }
	let(:sample_transaction) {[{
		date: DateTime.new(2016, 1, 15),
		transaction: 100,
		balance: 100
		}, {
		date: DateTime.new(2016, 1, 15),
		transaction: -50,
		balance: 50			
		}]}

	it 'is initialized with an empty array' do
		expect(log.display).to eq []
	end

	it 'Logs date, transaction and balance in a hash' do
		log.store(DateTime.new(2016, 1, 15), 100, 100)
		log.store(DateTime.new(2016, 1, 15), -50, 50)
		expect(log.display).to eq sample_transaction
	end
end