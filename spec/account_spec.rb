require 'account'

describe Account do
	
	subject(:account) { described_class.new('Max') }

	it 'Has an owner' do
		expect(account.owner).to eq 'Max'
	end

	it 'Has a balance, with an initial value of 0'do
		expect(account.balance).to eq 0
	end

	context 'Transaction: ' do
		before do
			account.deposit(100)
		end

		it 'Deposit is succesful' do
			expect(account.balance).to eq 100
		end

		it 'Multiple deposits add to the total balance' do
			account.deposit(50)
			expect(account.balance).not_to eq 50
			expect(account.balance).to eq 150
		end
	end

end