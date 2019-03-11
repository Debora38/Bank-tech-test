require 'date'

class BankAccount

  attr_reader :balance, :actions

  def initialize(balance = 0)
    @balance = balance
    @actions = []
  end

  def deposit(amount)
    @balance += amount
    @actions << {date: today, credit: amount, debit: "", balance: @balance}
  end

  def withdraw(amount)
    if @balance - amount < 0
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
    @actions << {date: today, credit: "", debit: amount, balance: @balance}
  end

  def statement
    account_statement = "date | credit | debit | balance\n"
    @actions.each do |action|
      account_statement += "#{action[:date]} | #{action[:credit]} | #{action[:debit]} | #{action[:balance]}\n"
    end
    return account_statement
  end

  def today
    DateTime.now.day.to_s + "/" + DateTime.now.month.to_s + "/" + DateTime.now.year.to_s
  end
end
