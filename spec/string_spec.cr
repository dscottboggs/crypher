require "./spec_helper"

describe "string methods" do
  it "work in the global context" do
    txt = "some text"
    data = txt.encrypt
    data.decrypt.should eq txt
  end
  it "work with a specific context" do
    ctx = Crypher.new
    txt = "some text"
    data = txt.encrypt cipher: ctx
    data.decrypt(cipher: ctx).should eq txt
  end
end
