require 'date'

class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def save_deposit(amount, balance)
    @all_transactions.unshift(date: today, credit: twodecimal(amount), debit: '', balance: twodecimal(balance))
  end

  def save_withdrawal(amount, balance)
    @all_transactions.unshift(date: today, credit: '', debit: twodecimal(amount), balance: twodecimal(balance))
  end

  def today
    Date.today.strftime('%d/%m/%Y')
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

end
