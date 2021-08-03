# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'depositing increases account balance' do
    bank.deposit_transaction(500)
    expect(bank.account.current_balance).to eq 500
  end

  it 'withdrawing lowers the account balance' do
    bank.withdrawal_transaction(500)
    expect(bank.account.current_balance).to eq(-500)
  end

  it 'debiting 600 and then crediting 500 leaves a debit balance' do
    bank.withdrawal_transaction(600)
    bank.deposit_transaction(500)
    expect(bank.account.current_balance).to eq(-100)
  end

  it 'prints a statement with various transactions included' do
    bank.deposit_transaction(500)
    bank.deposit_transaction(600)
    expect { bank.statement_summary }.to output("date || credit || debit || balance\n#{date} || 600.00 || || 1100.00\n#{date} || 500.00 || || 500.00\n").to_stdout
  end
end
