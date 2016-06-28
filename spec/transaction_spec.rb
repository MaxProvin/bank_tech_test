require 'transaction'

describe Transaction do

  subject(:transaction){described_class.new}

  describe 'Deposit' do
    before do
      transaction.deposit(1000)
    end

    it 'user should be able to make a deposit' do
      expect(transaction.value).to eq(1000)
    end

    it 'should log the date of the deposit' do
      expect(transaction.date).to eq(Time.now.strftime("%d/%m/%Y"))
    end
  end

  describe 'Withdrawal' do
    before do
      transaction.withdraw(250)
    end

    it 'user should be able to make a deposit' do
      expect(transaction.value).to eq(-250)
    end

    it 'should log the date of the withdrawal' do
      expect(transaction.date).to eq(Time.now.strftime("%d/%m/%Y"))
    end
  end

end