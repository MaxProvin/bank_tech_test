require 'statement'

describe Statement do
	
	subject(:statement) { described_class.new(log_obj) }

	let(:date) { DateTime.new(2016, 1, 25) }
	let(:sample_output) { File.read('sample_statement.txt') }
	let(:log_obj) { double :log_obj, display: [log1, log2] }
	let(:log1) { {date: date, transaction: 10, balance: 10} }
	let(:log2) { {date: date, transaction: -5, balance: 5} }

	context 'Initialization: ' do
		it 'Is supplied an array of logs' do
			expect(statement.information).to eq [log1, log2]
		end
	end

	describe ':print' do
		it 'outputs a statement in corrent format' do
			expect(statement.format).to eq sample_output
		end
	end

end