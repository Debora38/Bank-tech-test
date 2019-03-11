require 'date'

class BankAccount

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance - amount < 0
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
  end
end
