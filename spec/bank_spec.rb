# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'initializes with an account balance 0' do
    expect(bank.account_balance).to eq 0
  end

  it 'initializes with an empty array to hold transactions' do
    expect(bank.transaction_history).to eq []
  end

  it 'depositing increases account balance' do
    bank.deposit_transaction(500)
    expect(bank.account_balance).to eq 500
  end

  it 'withdrawing lowers the account balance' do
    bank.withdrawal_transaction(500)
    expect(bank.account_balance).to eq(-500)
  end

  it 'debiting 600 and then crediting 500 leaves a debit balance' do
    bank.withdrawal_transaction(600)
    bank.deposit_transaction(500)
    expect(bank.account_balance).to eq(-100)
  end

  it 'stores deposit transaction in an array' do
    bank.deposit_transaction(500.00)
    expect(bank.transaction_history).to eq ["#{date} || 500.00 || || 500.00"]
  end

  it 'deposit transaction' do
    expect(bank.deposit_transaction(500)).to eq ["#{date} || 500.00 || || 500.00"]
  end

  it 'withdraw transaction' do
    expect(bank.withdrawal_transaction(2000)).to eq ["#{date} || || 2000.00 || -2000.00"]
  end

  it 'prints a statement with various transactions included' do
    bank.deposit_transaction(500)
    bank.deposit_transaction(600)
    expect { bank.statement_summary }.to output("date || credit || debit || balance\n#{date} || 600.00 || || 1100.00\n#{date} || 500.00 || || 500.00\n").to_stdout
  end

  it 'deposit fails if value is 0' do
    expect { bank.deposit_transaction(0) }.to raise_error('Balance must be above 0!')
  end

  it 'deposit fails if value is 0' do
    expect { bank.withdrawal_transaction(0) }.to raise_error('Balance must be above 0!')
  end
end
