require 'account'

describe Account do
	
	subject(:account) { described_class.new('Max') }
	let(:sample_transaction) {[{
		date: DateTime.new(2016, 1, 15),
		transaction: 100,
		balance: 100
		}, {
		date: DateTime.new(2016, 1, 15),
		transaction: -50,
		balance: 50			
		}]}

	it 'Has an owner' do
		expect(account.owner).to eq 'Max'
	end

	it 'Has a balance, with an initial value of 0'do
		expect(account.balance).to eq 0
	end

	context 'Transactions: ' do
		before do
			allow(DateTime).to receive(:now) { DateTime.new(2016, 1, 15) }
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

		it 'Withdrawal is succesful' do
			account.withdraw(50)
			expect(account.balance).to eq 50
		end

		it 'Are Logged with date, transaction and balance' do
			account.withdraw(50)
			expect(account.transactions).to eq sample_transaction
		end
	end

	context 'Statement: ' do
		xit 'Each transaction has the date it was made' do
			account.deposit(100)
			expect(account.transactions['date'])
		end
	end

end