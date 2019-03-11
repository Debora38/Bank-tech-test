require 'date'

class BankAccount

  attr_reader :balance, :actions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
    @account_statement = "date || credit || debit || balance\n"
  end

  def deposit(amount)
    @balance += amount
    enter_deposit(amount)
  end

  def withdraw(amount)
    if @balance - amount < 0
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
    enter_withdrawal(amount)
  end

  def statement
    @transactions.each do |action|
      @account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    @account_statement
  end

  def today
    "#{twochar(Date.today.day)}/#{twochar(Date.today.month)}/#{Date.today.year}"
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

  def twochar(date)
    format('%02i', date)
  end

  def enter_withdrawal(amount)
    @transactions << { date: today, credit: '', debit: twodecimal(amount), balance: twodecimal(@balance)}
  end

  def enter_deposit(amount)
    @transactions << { date: today, credit: twodecimal(amount), debit: '', balance: twodecimal(@balance)}
  end
end
