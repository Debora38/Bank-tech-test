require 'display'

RSpec.describe Display do
  context "#transactions" do
    it "should have an array of transactions" do
      expect(subject.transactions).to be_kind_of(Array)
    end
  end
end
