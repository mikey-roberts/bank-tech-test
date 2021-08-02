class Bank
  attr_reader :account_balance, :transaction_history
  # Initializes with account balance of 0
  def initialize
    @account_balance = 0
    @transaction_history = []
  end
  # Credit method to increase balance
  def credit(amount)
    @account_balance += amount
  end
  # Debit method to decrease balance
  def debit(amount)
    @account_balance -= amount
  end
  # Formats the date of transaction
  def date
    transaction_date = Time.now
    transaction_date.strftime("%d/%m/%Y")
  end
  # Pushes transactions into an array to view historically
  def save_transaction(transaction)
    @transaction_history.push(transaction)
  end

  
end