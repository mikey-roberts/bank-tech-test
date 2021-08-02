class Bank
  attr_reader :account_balance
  def initialize
    @account_balance = 0 
  end

  def deposit(amount)
    @account_balance += amount
  end

  def withdraw(amount)
    @account_balance -= amount
  end
end