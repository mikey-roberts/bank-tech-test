# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit
  attr_accessor :balance

  def initialize(amount)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = amount[:credit]
    @debit = amount[:debit]
    @balance = amount[:balance]
  end
end
