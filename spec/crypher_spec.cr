require "./spec_helper"

describe Crypher do
  describe "encryption" do
    it "works" do
      e = Crypher.new
      key = e.key
      encrypted = e.encrypt "some text".to_slice
      e.key.should eq key
      String.new(e.decrypt encrypted).should eq "some text"
    end
  end
end
