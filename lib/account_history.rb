require 'date'

class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def save_deposit(amount, balance)
    @all_transactions.unshift(date: today, credit: amount, debit: 0, balance: balance)
  end

  def save_withdrawal(amount, balance)
    @all_transactions.unshift(date: today, credit: 0, debit: amount, balance: balance)
  end

  def today
    Date.today.strftime('%d/%m/%Y')
  end
end
