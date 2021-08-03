# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:account) { Account.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }


  it 'initializes with an account balance 0' do
    expect(account.current_balance).to eq 0
  end

  it 'initializes with an empty array to hold transactions' do
    expect(account.transaction_history).to eq []
  end

  it 'debiting decreases account balance' do
    account.debit_account(500)
    expect(account.current_balance).to eq -500 
  end

  it 'crediting increases account balance' do
    account.credit_account(500)
    expect(account.current_balance).to eq 500 
  end

  it 'saves credit transaction' do
    account.credit_account(2000)
    account.save_credit_transaction(2000)
    expect(account.transaction_history).to eq ["#{date} || 2000.00 || || 2000.00"]
  end

  it 'saves debit transaction' do
    account.debit_account(2000)
    account.save_debit_transaction(2000)
    expect(account.transaction_history).to eq ["#{date} || || 2000.00 || -2000.00"]
  end
end