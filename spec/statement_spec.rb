require 'statement'

describe Statement do
	
	subject(:statement) { described_class.new(date, 10, 100) }
	subject(:statement2) { described_class.new(date, -10, 100) }
	let(:date) { DateTime.new(2016, 1, 25) }
	let(:sample_output) { File.read('sample_statement.txt') }

	context 'Initialization: ' do
		it 'Has a date in DateTime format' do
			expect(statement.date.class).to eq DateTime
			expect(statement.date).to eq (DateTime.new(2016, 1, 25))
		end

		it 'Has a balance' do
			expect(statement.balance).to eq 100
		end

		context 'Transaction' do
			it 'Credit' do
				expect(statement.credit).to eq 10
				expect(statement.debit).to eq nil
			end

			it 'Debit' do
				expect(statement2.credit).to eq nil
				expect(statement2.debit).to eq 10
			end
		end
	end

	describe ':print' do
		it 'outputs a statement in corrent format' do
			expect(statement.print).to eq sample_output
		end
	end

end