require 'account_history'

RSpec.describe AccountHistory do
  context "#save_deposit" do
    it "should save a deposit into the array" do
      allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
      subject.save_deposit(2000, 2000)
      expect(subject.all_transactions[0][:credit]).to eq 2000
    end
  end
end
