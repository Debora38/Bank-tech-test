require 'bank'

RSpec.describe BankAccount do
  context '#deposit' do
    it 'should allow me to deposit money in my account' do
      subject.deposit(2000)
      expect(subject.balance).to eq 2000
    end
  end

  context '#withdrawal' do
    it 'should allow me to withdraw money from my account' do
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.balance).to eq 1500
    end

    it 'should raise an error if I do not have enough money to withdraw' do
      expect { subject.withdraw(1) }.to raise_error('Insufficient funds')
    end
  end

  context '#statement' do
    it 'should print out the history of my account: one deposit' do
      allow(Date).to receive_message_chain(:today, :day).and_return 4
      allow(Date).to receive_message_chain(:today, :month).and_return 2
      allow(Date).to receive_message_chain(:today, :year).and_return 2019
      subject.deposit(2000)
      expect(subject.statement).to include('date || credit || debit || balance')
      expect(subject.statement).to include('04/02/2019 || 2000.00 ||  || 2000.00')
    end

    it 'should print out the history of my account: multiple actions' do
      allow(Date).to receive_message_chain(:today, :day).and_return 4
      allow(Date).to receive_message_chain(:today, :month).and_return 2
      allow(Date).to receive_message_chain(:today, :year).and_return 2019
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.statement).to include('date || credit || debit || balance')
      expect(subject.statement).to include('04/02/2019 || 2000.00 ||  || 2000.00')
      expect(subject.statement).to include('04/02/2019 ||  || 500.00 || 1500.00')
    end
  end
end
