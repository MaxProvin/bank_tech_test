require 'account'

describe Account do
	
	subject(:account) { described_class.new(owner: 'Max') }

	it 'Has an owner' do
		expect(account.owner).to eq 'Max'
	end


end