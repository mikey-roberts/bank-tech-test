require_relative 'statement'
# frozen_string_literal: true

class Bank
  attr_reader :account_balance, :statement

  # Initializes with account balance of 0
  def initialize
    @account_balance = 0
    @statement = Statement.new
  end

  # Actions a bank depoit
  def deposit_transaction(transaction_amount)
    validate_amount(transaction_amount)
    credit_account(transaction_amount)
    statement.save_credit_transaction(transaction_amount)
  end

  # Actions a bank withdraw
  def withdrawal_transaction(transaction_amount)
    validate_amount(transaction_amount)
    debit_account(transaction_amount)
    statement.save_debit_transaction(transaction_amount)
  end

  # Provides a statement with a summary of all transactions
  def statement_summary
    statement.print_header
    statement.print_body
  end

  private

  # Credit method to increase balance
  def credit_account(transaction_amount)
    statement.account_balance += transaction_amount
    @account_balance += transaction_amount
  end

  # Debit method to decrease balance
  def debit_account(transaction_amount)
    statement.account_balance -= transaction_amount
    @account_balance -= transaction_amount
  end

  # Raises error in the event of a value less than 0 and an integer
  def validate_amount(transaction_amount)
    raise 'Balance must be above 0!' if transaction_amount <= 0
  end
end
