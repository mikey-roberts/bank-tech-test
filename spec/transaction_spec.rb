# frozen_string_literal: true

require 'transaction'

describe Statement do
  let(:statement) { Transaction.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'initializes with a credit balance' do
    statement = Transaction.new({ credit: 500 })
    expect(statement.credit).to eq 500
  end
  it 'initializes with a credit balance' do
    statement = Transaction.new({ debit: 500 })
    expect(statement.debit).to eq 500
  end
  it 'initializes with an amount' do
    statement = Transaction.new({ balance: 500 })
    expect(statement.balance).to eq 500
  end

  it 'initializes with the date the transaction was made' do
    statement = Transaction.new({ debit: 500 })
    expect(statement.date).to eq date
  end
end