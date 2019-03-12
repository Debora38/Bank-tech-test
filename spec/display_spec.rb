require 'display'

RSpec.describe Display do

  context "#print_statement" do
    it 'should print out the history of my account: one deposit' do
      account_history = double('account_history')
      display = Display.new(account_history)
      allow(account_history).to receive(:all_transactions).and_return([{date: '04/02/2019', credit: display.twodecimal(2000), debit: "", balance: display.twodecimal(2000)}])
      expect { display.print_statement }.to output("date || credit || debit || balance\n04/02/2019 || 2000.00 ||  || 2000.00\n").to_stdout
    end

    # it 'should print out the history of my account: one deposit' do
    #   allow(@account_history).to receive(:all_transactions).and_return([{date: '04/02/2019', credit: 2000, debit: "", balance: 2000}])
    #   expect { display.print_statement }.to output("date || credit || debit || balance\n04/02/2019 || 2000.00 ||  || 2000.00\n").to_stdout
    # end

    # it 'should print out the history of my account: multiple transactions' do
    #   allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
    #   subject.save_deposit(2000, 2000)
    #   subject.save_withdrawal(500, 1500)
    #   expect { subject.print_statement }.to output("date || credit || debit || balance\n04/02/2019 ||  || 500.00 || 1500.00\n04/02/2019 || 2000.00 ||  || 2000.00\n").to_stdout
    # end
  end
end
