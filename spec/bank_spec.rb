require 'bank.rb'

describe Bank do
  let(:bank) { Bank.new }
    it 'initializes with an account balance 0' do 
      expect(bank.account_balance).to eq 0
    end

    # it 'stamps the date in a hyphenated convention' do
    #   bank = Bank.new
    #   bank.date
    #   expect(bank.date).to eq 
    # end

    it 'withdrawing an amount of money debits the account balance' do
      bank.withdraw(500)
      expect(bank.account_balance).to eq -500
    end

    it 'depositing an amount of money credits the account balance' do
      bank.deposit(500)
      expect(bank.account_balance).to eq 500
    end

  end