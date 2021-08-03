# frozen_string_literal: true

class Statement
  STATEMENT_HEADER = 'date || credit || debit || balance'
  attr_reader :transaction_history

  # Heading text for summary STDout
  def print_header
    puts STATEMENT_HEADER
  end

  # Array iteration for summary STDout
  def print_body(transaction_history)
    transaction_history.reverse.each do |transaction|
    debit_or_credit?(transaction) ? deposit_format(transaction) : withdrawal_format(transaction)
    end
  end

  private

  # Formats the print style for withdrawal entries
  def deposit_format(transaction)
    puts "#{transaction.date} || #{add_two_decimals(transaction.credit)} || || #{add_two_decimals(transaction.balance)}"
  end

  # Formats the print style for credit entries
  def withdrawal_format(transaction)
    puts "#{transaction.date} || || #{add_two_decimals(transaction.debit)} || #{add_two_decimals(transaction.balance)}"
  end

  # Converts values to display two decimal places
  def add_two_decimals(value)
    ('%.2f' % value.to_f)
  end

  # Validates whether transaction is debit or credit
  def debit_or_credit?(transaction)
    transaction.debit.nil? && !transaction.credit.nil?
  end
end
