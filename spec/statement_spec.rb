# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'produces a statement header' do
    expect { statement.print_header }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'produces a statement body' do
    expect { allow(statement.print_body([1,2,3])) }.to output("3\n2\n1\n").to_stdout
  end
end