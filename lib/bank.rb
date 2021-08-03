# frozen_string_literal: true

require_relative 'statement'
require_relative 'account'
require_relative 'transaction'

class Bank
  attr_reader :statement, :account

  # Initializes with account balance of 0
  def initialize
    @account = Account.new
    @statement = Statement.new
  end

  # Actions a bank depoit
  def deposit_transaction(transaction_amount)
    account.credit_account(transaction_amount)
  end

  # Actions a bank withdraw
  def withdrawal_transaction(transaction_amount)
    account.debit_account(transaction_amount)
  end

  # Provides a statement with a summary of all transactions
  def statement_summary
    statement.print_header
    statement.print_body(account.transaction_history)
  end
end
