require 'display'

RSpec.describe Display do

  context "#print_statement" do
    it 'should print out the history of my account: no deposits' do
      account_history = double('account_history')
      display = Display.new(account_history)
      allow(account_history).to receive(:all_transactions).and_return([])
      expect { display.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
