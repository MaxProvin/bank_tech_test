require 'account'

describe Account do
	
	subject(:account) { described_class.new('Max') }

	it 'Has an owner' do
		expect(account.owner).to eq 'Max'
	end

	it 'Has a balance, with an initial value of 0'do
		expect(account.balance).to eq 0
	end

end