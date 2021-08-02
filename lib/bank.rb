# frozen_string_literal: true

class Bank
  attr_reader :account_balance, :transaction_history

  # Initializes with account balance of 0
  def initialize
    @account_balance = 0
    @transaction_history = []
  end

  # Actions a bank depoit
  def deposit_transaction(transaction_amount)
    validate_amount(transaction_amount)
    credit_account(transaction_amount)
    save_transaction(deposit_format(transaction_amount))
  end

  # Actions a bank withdraw
  def withdrawal_transaction(transaction_amount)
    validate_amount(transaction_amount)
    debit_account(transaction_amount)
    save_transaction(withdrawal_format(transaction_amount))
  end

  # Provides a statement with a summary of all transactions
  def statement_summary
    statement_header
    statement_body
  end

  private

  # Converts values to display two decimal places
  def add_two_decimals(value)
    ('%.2f' % value)
  end

  # Heading text for summary STDout
  def statement_header
    puts 'date || credit || debit || balance'
  end

  # Array iteration for summary STDout
  def statement_body
    transaction_history.reverse.each { |transaction| puts transaction }
  end

  # Credit method to increase balance
  def credit_account(transaction_amount)
    @account_balance += transaction_amount
  end

  # Debit method to decrease balance
  def debit_account(transaction_amount)
    @account_balance -= transaction_amount
  end

  # Formats the date of transaction
  def transaction_date
    Time.now.strftime('%d/%m/%Y')
  end

  # Pushes transactions into an array to view historically
  def save_transaction(new_transaction)
    @transaction_history.push(new_transaction)
  end

  # Raises error in the event of a value less than 0 and an integer
  def validate_amount(transaction_amount)
    raise 'Balance must be above 0!' if transaction_amount <= 0
  end

  # Formats the print style for credit entries
  def withdrawal_format(transaction_amount)
    "#{transaction_date} || || #{add_two_decimals(transaction_amount)} || #{add_two_decimals(@account_balance)}"
  end

  # Formats the print style for withdrawal entries
  def deposit_format(transaction_amount)
    "#{transaction_date} || #{add_two_decimals(transaction_amount)} || || #{add_two_decimals(@account_balance)}"
  end
end
