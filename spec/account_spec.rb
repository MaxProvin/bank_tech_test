require 'account'

describe Account do
	
	subject(:account) { described_class.new('Max', log) }
	let(:log) { double :log, store: nil }
	let(:statement) { double :statement, print: 'Pretty info'}
	it 'Has an owner' do
		expect(account.owner).to eq 'Max'
	end

	it 'Has a balance, with an initial value of 0'do
		expect(account.balance).to eq 0
	end

	it 'Is initialized with a transactions log' do
		expect(account.transactions).to eq log
	end

	it 'Can print a statement' do
		expect(account.print_statement(statement)).to eq 'Pretty info'
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
	end
end