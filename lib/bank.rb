require 'date'

class BankAccount

  attr_reader :balance, :actions

  def initialize(balance = 0)
    @balance = balance
    @actions = []
  end

  def deposit(amount)
    @balance += amount
    @actions << { date: today, credit: twodecimal(amount), debit: "", balance: twodecimal(@balance)}
  end

  def withdraw(amount)
    if @balance - amount < 0
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
    @actions << { date: today, credit: "", debit: twodecimal(amount), balance: twodecimal(@balance)}
  end

  def statement
    account_statement = "date || credit || debit || balance\n"
    @actions.each do |action|
      account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    return account_statement
  end

  def today
    Date.today.day.to_s + "/" + Date.today.month.to_s + "/" + Date.today.year.to_s
  end

  def twodecimal(amount)
    sprintf('%.2f', amount)
  end
end
