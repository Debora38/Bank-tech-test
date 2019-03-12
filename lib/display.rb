class Display
attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    account_statement = "date || credit || debit || balance\n"
    @transactions.each do |action|
      account_statement += "#{action[:date]} || #{action[:credit]} || #{action[:debit]} || #{action[:balance]}\n"
    end
    account_statement
  end

  def twodecimal(amount)
    format('%.2f', amount)
  end

  def today
    Date.today.strftime('%d/%m/%Y')
  end

end
