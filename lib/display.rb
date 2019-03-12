class Display
attr_reader :account_history

  def initialize(account_history)
    @account_history = account_history
  end

  def print_statement
    account_statement = ["date || credit || debit || balance"]
    @account_history.all_transactions.each do |action|
      account_statement.push(format_row(action))
    end
    puts account_statement
  end

  def format_row(action)
    "#{action.date} || #{twodecimal(action.credit)} || #{twodecimal(action.debit)} || #{twodecimal(action.balance)}"
  end

  def twodecimal(amount)
    return format('%.2f', amount) if amount != 0
    return ''
  end

end
