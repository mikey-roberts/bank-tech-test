# frozen_string_literal: true

class Account
  attr_accessor :current_balance, :transaction_history

  def initialize
    @current_balance = 0
    @transaction_history = []
  end

  # Credit method to increase balance
  def credit_account(transaction_amount)
    validate_amount(transaction_amount)
    @current_balance += transaction_amount
    create_transaction({ credit: transaction_amount })
  end

  # Debit method to decrease balance
  def debit_account(transaction_amount)
    validate_amount(transaction_amount)
    @current_balance -= transaction_amount
    create_transaction({ debit: transaction_amount })
  end

  private

  # Creates new transaction
  def create_transaction(amount)
    new_transaction = Transaction.new(amount)
    new_transaction.balance = @current_balance
    save_transaction(new_transaction)
  end

  def save_transaction(amount)
    @transaction_history.push(amount)
  end  

  # Raises error in the event of a value less than 0 and an integer
  def validate_amount(transaction_amount)
    raise 'Amount must be above 0!' if transaction_amount <= 0
  end
end
