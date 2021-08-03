# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'initializes with a credit balance' do
    transaction = Transaction.new({ credit: 500 })
    expect(transaction.credit).to eq 500
  end
  it 'initializes with a credit balance' do
    transaction = Transaction.new({ debit: 500 })
    expect(transaction.debit).to eq 500
  end
  it 'initializes with an amount' do
    transaction = Transaction.new({ balance: 500 })
    expect(transaction.balance).to eq 500
  end

  it 'initializes with the date the transaction was made' do
    transaction = Transaction.new({ debit: 500 })
    expect(transaction.date).to eq date
  end
end