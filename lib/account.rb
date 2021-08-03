require 'transaction'

class Account
  attr_accessor :current_balance, :transaction_history

  def initialize
    @current_balance = 0
    @transaction_history = []
  end

   # Credit method to increase balance
   def credit_account(transaction_amount)
    @current_balance += transaction_amount
    create_transaction({ credit: transaction_amount } )
  end

  # Debit method to decrease balance
  def debit_account(transaction_amount)
    @current_balance -= transaction_amount
    create_transaction({ debit: transaction_amount } )
  end

  # Pushes credit transactions into an array to view historically
  def save_credit_transaction(transaction_amount)
    @transaction_history.push(deposit_format(transaction_amount))
  end
  
  # Pushes debit transactions into an array to view historically
  def save_debit_transaction(transaction_amount)
    @transaction_history.push(withdrawal_format(transaction_amount))
  end

  # Creates new transaction
  def create_transaction(amount)
    new_transaction = Transaction.new(amount)
    new_transaction.balance = @current_balance
  end

  private

  # Formats the print style for withdrawal entries
  def deposit_format(transaction_amount)
    "#{transaction_date} || #{add_two_decimals(transaction_amount)} || || #{add_two_decimals(@current_balance)}"
  end
  
  # Formats the print style for credit entries
  def withdrawal_format(transaction_amount)
    "#{transaction_date} || || #{add_two_decimals(transaction_amount)} || #{add_two_decimals(@current_balance)}"
  end

  # Formats the date of transaction
  def transaction_date
    Time.now.strftime('%d/%m/%Y')
  end
  
  # Converts values to display two decimal places
  def add_two_decimals(value)
    ('%.2f' % value)
  end
end