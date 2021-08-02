require 'bank.rb'

describe Bank do
  let(:bank) { Bank.new }
    it 'initializes with an account balance 0' do 
      expect(bank.account_balance).to eq 0
    end

    it 'initializes with an empty array to hold transactions' do
      expect(bank.transaction_history).to eq []
    end

    it 'debiting lowers account balance' do
      bank.debit(500)
      expect(bank.account_balance).to eq -500
    end

    it 'crediting increases the account balance' do
      bank.credit(500)
      expect(bank.account_balance).to eq 500
    end

    it 'debiting 600 and then crediting 500 leaves a debit balance' do
      bank.debit(600)
      bank.credit(500)
      expect(bank.account_balance). to eq -100
    end
    
    it 'stamps the date in a hyphenated convention' do
      @fake_date = Time.now
      @fake_date = @fake_date.strftime("%d/%m/%Y")
      bank.date
      expect(bank.date).to eq @fake_date
    end

    it 'stores credit transaction in an array' do
      bank.save_transaction
      expect(bank.save_transaction).to eq ["14/01/2012 || || 500.00 || 2500.00"]
    end
  end
  