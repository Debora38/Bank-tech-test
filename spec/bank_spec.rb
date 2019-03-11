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

    it 'should raise an error if I do not have enough money to withdraw' do
      expect { subject.withdraw(1) }.to raise_error('Insufficient funds')
    end
  end

  context "#statement" do
    it "should print out the history of my account: one deposit" do
      allow(subject).to receive(:today).and_return('14/2/2019')
      subject.deposit(2000)
      expect(subject.statement).to include('date || credit || debit || balance')
      expect(subject.statement).to include('14/2/2019 || 2000 ||  || 2000')
    end

    it "should print out the history of my account: multiple actions" do
      allow(subject).to receive(:today).and_return('14/2/2019')
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.statement).to include('date || credit || debit || balance')
      expect(subject.statement).to include('14/2/2019 || 2000 ||  || 2000')
      expect(subject.statement).to include('14/2/2019 ||  || 500 || 1500')
    end
  end
end
