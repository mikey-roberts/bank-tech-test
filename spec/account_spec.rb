# frozen_string_literal: true

require 'account'

describe Account do
  let(:bank) { Bank.new }
  let(:account) { Account.new }


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

  it 'deposit fails if value is 0' do
    expect { account.credit_account(0) }.to raise_error('Amount must be above 0!')
    expect { account.debit_account(0) }.to raise_error('Amount must be above 0!')
  end
end