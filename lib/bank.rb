class Bank
  attr_reader :account_balance, :transaction_history
  # Initializes with account balance of 0
  def initialize
    @account_balance = 0
    @transaction_history = []
  end
  # Credit method to increase balance
  def credit(transaction_amount)
    @account_balance += transaction_amount
  end
  # Debit method to decrease balance
  def debit(transaction_amount)
    @account_balance -= transaction_amount
  end
  # Formats the date of transaction
  def transaction_date
    current_date = Time.now
    current_date.strftime("%d/%m/%Y")
  end
  # Pushes transactions into an array to view historically
  def save_transaction(new_transaction)
    @transaction_history.push(new_transaction)
  end
  # Actions a bank depoit
  def deposit_transaction(transaction_amount)
    credit(transaction_amount)
    save_transaction("#{transaction_date} || #{add_two_decimals(transaction_amount)} || || #{add_two_decimals(@account_balance)}")
  end
  # Actions a bank withdraw
  def withdrawal_transaction(transaction_amount)
    debit(transaction_amount)
    save_transaction("#{transaction_date} || || #{add_two_decimals(transaction_amount)} || #{add_two_decimals(@account_balance)}")
  end
  # Provides a statement with a summary of all transactions
  def statement_summary
    statement_header
    @transaction_history.reverse { |transaction| puts transaction }
  end;
  
  private
  # Converts values to display two decimal places
  def add_two_decimals(value)
    '%.2f' % value
  end

  def statement_header
    puts "date || credit || debit || balance"
  end
end