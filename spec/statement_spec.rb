# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:deposit) { double(:transaction, date: date, credit: 500, debit: nil, balance: 500) }
  let(:withdrawal) { double(:transaction, date: date, credit: nil, debit: 500, balance: 500) }

  it 'produces a statement header' do
    expect { statement.print_header }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'produces a statement body' do
    expect { allow(statement.print_body([deposit])) }.to output("#{date} || 500.00 || || 500.00\n").to_stdout
  end

  it 'produces a debit statement' do
    expect { statement.deposit_format(deposit) }.to output("#{date} || 500.00 || || 500.00\n").to_stdout
  end

  it 'produces a withdrawal statement' do
    expect { statement.withdrawal_format(withdrawal) }.to output("#{date} || || 500.00 || 500.00\n").to_stdout
  end
end
