require 'display'

RSpec.describe Display do
  context "#transactions" do
    it "should have an array of transactions" do
      expect(subject.transactions).to be_kind_of(Array)
    end
  end

  context "#print_statement" do
    it 'should print out the history of my account: no deposits' do
      expect(subject.print_statement).to include('date || credit || debit || balance')
    end
  end
end
