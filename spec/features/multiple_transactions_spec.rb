require 'bankaccount'

RSpec.describe BankAccount do
  context 'features: full_journey' do
    it 'should allow multiple actions' do
      allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
      account = BankAccount.new
      account.deposit(2000)
      account.withdraw(900)
      expect { account.display.print_statement }.to output("date || credit || debit || balance\n04/02/2019 ||  || 900.00 || 1100.00\n04/02/2019 || 2000.00 ||  || 2000.00\n").to_stdout
      expect { account.withdraw(9000) }.to raise_error('Insufficient funds')
    end
  end
end
