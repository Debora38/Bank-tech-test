require 'date'
require_relative 'transactions'

class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
    @transaction = Transactions
  end

  def save_deposit(amount, balance)
    @all_transactions.unshift(@transaction.new(today, amount, 0, balance))
  end

  def save_withdrawal(amount, balance)
    @all_transactions.unshift(@transaction.new(today, 0, amount, balance))
  end

  def today
    Date.today.strftime('%d/%m/%Y')
  end
end
