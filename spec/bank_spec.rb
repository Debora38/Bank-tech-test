require 'bank'

RSpec.describe BankAccount do

  context "@balance" do
    it "should have a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  context "#deposit" do
    it "should allow me to deposit money in my account" do
      subject.deposit(2000)
      expect(subject.balance).to eq 2000
    end
  end

  context "#withdrawal" do
    it 'should allow me to withdraw money from my account' do
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.balance).to eq 1500
    end
  end
end
