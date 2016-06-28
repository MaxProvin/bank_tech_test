require 'transaction'

describe Transaction do

  subject(:transaction){described_class.new(1000)}

  it 'should be created with current date' do
    expect(transaction.date).to eq(Time.now.strftime("%d/%m/%Y"))
  end

  it 'should be initialized with an amount for the transaction' do
    expect(transaction.amount).to eq(1000)
  end

end