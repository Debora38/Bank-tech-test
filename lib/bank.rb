require 'date'

class BankAccount
  attr_reader :balance, :actions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    save_deposit(amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance - amount < 0
    @balance -= amount
    save_withdrawal(amount)
  end

  def print_statement
    account_statement = "date || credit || debit || balance\n"
    @transactions.each do |action|
      account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    account_statement
  end

  private

  def today
    Date.today.strftime('%d/%m/%Y')
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

  def save_withdrawal(amount)
    @transactions << { date: today, credit: '', debit: twodecimal(amount), balance: twodecimal(@balance) }
  end

  def save_deposit(amount)
    @transactions << { date: today, credit: twodecimal(amount), debit: '', balance: twodecimal(@balance) }
  end
end
