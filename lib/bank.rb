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
  # Actions a bank depoit
  def deposit_transaction(amount)
    amount = amount
    credit(amount)
    date_today = date
    transaction = ["#{date_today} || || #{'%.2f' % amount} || #{'%.2f' % @account_balance}"]
  end
  # Actions a bank withdraw
  def withdrawal_transaction(amount)
    amount = amount
    debit(amount)
    date_today = date
    transaction = ["#{date_today} || #{'%.2f' % amount} || || #{'%.2f' % @account_balance}"]
  end
end