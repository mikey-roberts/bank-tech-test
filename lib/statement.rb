require 'bank'

class Statement

  attr_accessor :account_balance
  attr_reader :transaction_history
  # Initializes with an empty array
  def initialize
    @transaction_history = []
    @account_balance = 0
  end

  # Pushes credit transactions into an array to view historically
  def save_credit_transaction(transaction_amount)
    @transaction_history.push(deposit_format(transaction_amount))
  end

  # Pushes debit transactions into an array to view historically
  def save_debit_transaction(transaction_amount)
    @transaction_history.push(withdrawal_format(transaction_amount))
  end
 
  # Formats the date of transaction
  def transaction_date
    Time.now.strftime('%d/%m/%Y')
  end

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

   # Formats the print style for withdrawal entries
   def deposit_format(transaction_amount)
    "#{transaction_date} || #{add_two_decimals(transaction_amount)} || || #{add_two_decimals(@account_balance)}"
  end

   # Formats the print style for credit entries
   def withdrawal_format(transaction_amount)
    "#{transaction_date} || || #{add_two_decimals(transaction_amount)} || #{add_two_decimals(@account_balance)}"
  end
end