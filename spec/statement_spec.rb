# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'initializes with an empty array to hold transactions' do
    expect(statement.transaction_history).to eq []
  end

  # it 'stores deposit transaction in an array' do
  #   statement.deposit_transaction(500)
  #   expect(bank.transaction_history).to eq ["#{date} || 500.00 || || 500.00"]
  # end
  it 'expect transaction date to equal current date' do
    expect(statement.transaction_date).to eq date
  end

  it 'adds two decimal places to method' do
    expect(statement.add_two_decimals(200)).to eq "200.00"
  end
end