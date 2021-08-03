require_relative 'statement'
require_relative 'account'
# frozen_string_literal: true

class Bank
  attr_reader :current_balance, :statement, :account

  # Initializes with account balance of 0
  def initialize
    @account = Account.new
    @statement = Statement.new
  end

  # Actions a bank depoit
  def deposit_transaction(transaction_amount)
    validate_amount(transaction_amount)
    account.credit_account(transaction_amount)
    account.save_credit_transaction(transaction_amount)
  end

  # Actions a bank withdraw
  def withdrawal_transaction(transaction_amount)
    validate_amount(transaction_amount)
    account.debit_account(transaction_amount)
    account.save_debit_transaction(transaction_amount)
  end

  # Provides a statement with a summary of all transactions
  def statement_summary
    statement.print_header
    statement.print_body(account.transaction_history)
  end

  private

  # Raises error in the event of a value less than 0 and an integer
  def validate_amount(transaction_amount)
    raise 'Amount must be above 0!' if transaction_amount <= 0
  end
end
