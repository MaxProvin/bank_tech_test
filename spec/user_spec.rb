require 'user'

describe User do

  subject(:user){described_class.new}

  it 'balance should be 0 when initiated' do
    expect(user.balance).to eq(0)
  end

  it 'should be able to make a deposit' do
    user.deposit(1000)
    expect(user.balance).to eq(1000)
  end

  it 'should be able to make a withdrawal' do
    user.deposit(1000)
    user.withdraw(250)
    expect(user.balance).to eq(750)
  end

  describe 'Transaction History' do
    before do
      user.deposit(1000)
    end

    it 'should keep track of each transaction' do
      expect{user.deposit(300)}.to change{user.history.length}.by(1)
    end

    it 'each logged transaction records date' do
      expect(user.history[0][:date]).to eq(Time.now.strftime("%d/%m/%Y"))
    end

    it 'each logged transaction records amount' do
      expect(user.history[0][:amount]).to eq(1000)
    end

    it 'each logged transaction records current balance' do
      user.withdraw(500)
      expect(user.history[0][:balance]).to eq(1000)
      expect(user.history[1][:balance]).to eq(500)
    end
  end

  describe 'print statement' do
    it 'should output users account history in the correct format' do
      user.deposit(100)
      expect(user.print_statement).to eq(("date || credit || debit || balance"+ "\n" + "28/06/2016 || 100 || || 100"))
    end
  end

end