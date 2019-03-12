class Display
attr_reader :account_history

  def initialize(account_history)
    @account_history = account_history
  end

  def print_statement
    account_statement = ["date || credit || debit || balance"]
    @account_history.all_transactions.each do |action|
      account_statement.push("#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}")
    end
    puts account_statement
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

end
