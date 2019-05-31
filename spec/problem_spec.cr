require "./spec_helper"

describe OpenSSL::Cipher do
  it "can be decrypted from the bytes returned by the update method" do
    cipher = OpenSSL::Cipher.new "AES256"
    key = cipher.random_key
    iv = cipher.random_iv
    cipher.encrypt
    # data = cipher.update "some test text for testing"
    slice = "some test text for testing".to_slice
    buffer_length = slice.size + LibCrypto.evp_cipher_block_size LibCrypto.evp_cipher_ctx_cipher cipher.@ctx
    buffer = Bytes.new(buffer_length)
    if LibCrypto.evp_cipherupdate(cipher.@ctx, buffer, pointerof(buffer_length), slice, slice.size) != 1
      raise "EVP_CipherUpdate"
    end
    (pp! buffer_length).should_not eq 0
    buffer.empty?.should be_false
    decipher = OpenSSL::Cipher.new "AES256"
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv
    decipher.update(buffer).should eq "some test text for testing".to_slice
  end
end
