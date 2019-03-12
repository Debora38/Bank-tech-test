require 'display'

RSpec.describe Display do
  context "#transactions" do
    it "should have an array of transactions" do
      expect(subject.transactions).to be_kind_of(Array)
    end
  end

  context "#print_statement" do
    it 'should print out the history of my account: no deposits' do
      subject.transactions.unshift({date: '04/02/2019', credit: subject.twodecimal(2000), debit: "", balance: subject.twodecimal(2000)})
      expect(subject.print_statement).to include('date || credit || debit || balance')
      expect(subject.print_statement).to include('04/02/2019 || 2000.00 ||  || 2000.00')
    end
  end
end
