require "../spec_helper"

describe "Crypher::Decrypter and Crypher::Encrypter" do
  it "work" do
    encrypter = Crypher::Encrypter.new
    decrypter = Crypher::Decrypter.new cipher: encrypter.cipher # key: encrypter.key
    # decrypter.iv = encrypter.iv
    encrypter << "some text"
    encrypter.rewind
    IO.copy encrypter, decrypter
    decrypter.rewind.gets_to_end.should eq "some text"
  end
end
