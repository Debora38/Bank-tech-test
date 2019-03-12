require 'account_history'

RSpec.describe AccountHistory do
  context "#save_deposit" do
    it "should save a deposit in the history" do
      allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
      subject.save_deposit(2000, 2000)
      expect(subject.all_transactions[0].credit).to eq 2000
    end
  end

  context "#save_withdrawal" do
    it "should save a withdrawal in the history" do
      allow(Date).to receive_message_chain(:today, :strftime).and_return '04/02/2019'
      subject.save_deposit(2000, 2000)
      subject.save_withdrawal(200, 1800)
      expect(subject.all_transactions[0].debit).to eq 200
    end
  end
end
