require_relative 'display'

class BankAccount
  attr_reader :balance, :transactions, :display

  def initialize(balance = 0)
    @balance = balance
    @display = Display.new
    @account_history = AccountHistory.new
  end

  def deposit(amount)
    @balance += amount
    @account_history.save_deposit(amount, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance - amount < 0
    @balance -= amount
    @display.save_withdrawal(amount, @balance)
  end
end
