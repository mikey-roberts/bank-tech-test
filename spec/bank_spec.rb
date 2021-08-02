require 'bank.rb'

describe Bank do
  it 'initializes with an account balance 0' do
    bank = Bank.new
    expect(bank.account_balance).to eq 0
  end
end