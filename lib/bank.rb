require 'date'

class BankAccount

  attr_reader :balance, :actions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: today, credit: twodecimal(amount), debit: "", balance: twodecimal(@balance)}
  end

  def withdraw(amount)
    if @balance - amount < 0
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
    @transactions << { date: today, credit: "", debit: twodecimal(amount), balance: twodecimal(@balance)}
  end

  def statement
    account_statement = "date || credit || debit || balance\n"
    @transactions.each do |action|
      account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    account_statement
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
end
