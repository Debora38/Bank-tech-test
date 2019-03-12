require 'display'

RSpec.describe Display do
  context "#print_statement" do
    it 'should print out the history of my account: one deposit' do
      subject.transactions.unshift({date: '04/02/2019', credit: subject.twodecimal(2000), debit: "", balance: subject.twodecimal(2000)})
      expect(subject.print_statement).to include('date || credit || debit || balance')
      expect(subject.print_statement).to include('04/02/2019 || 2000.00 ||  || 2000.00')
    end

    it 'should print out the history of my account: multiple transactions' do
      allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
      subject.save_deposit(2000, 2000)
      subject.save_withdrawal(500, 1500)
      expect(subject.print_statement).to include('date || credit || debit || balance')
      expect(subject.print_statement).to include('04/02/2019 || 2000.00 ||  || 2000.00')
      expect(subject.print_statement).to include('04/02/2019 ||  || 500.00 || 1500.00')
    end
  end
end
