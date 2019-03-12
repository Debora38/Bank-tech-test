require 'date'

class Display
attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    account_statement = "date || credit || debit || balance\n"
    @transactions.each do |action|
      account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    account_statement
  end

  def save_deposit(amount, balance)
    @transactions.unshift(date: today, credit: twodecimal(amount), debit: '', balance: twodecimal(balance))
  end

  def save_withdrawal(amount, balance)
    @transactions.unshift(date: today, credit: '', debit: twodecimal(amount), balance: twodecimal(balance))
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

  def today
    Date.today.strftime('%d/%m/%Y')
  end

end
