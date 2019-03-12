require_relative 'display'
require_relative 'account_history'

class BankAccount
  attr_reader :balance, :transactions, :display

  def initialize(balance = 0)
    @balance = balance
    @account_history = AccountHistory.new
    @display = Display.new(@account_history)
  end

  def deposit(amount)
    @balance += amount
    @account_history.save_deposit(amount, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance - amount < 0
    @balance -= amount
    @account_history.save_withdrawal(amount, @balance)
  end
end
