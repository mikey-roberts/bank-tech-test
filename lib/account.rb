# frozen_string_literal: true


class Account
  attr_accessor :account_balance

  def initialize
    @account_balance = 0
  end

  def account_balance
    @account_balance
  end
end