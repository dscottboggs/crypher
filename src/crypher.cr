require "openssl/cipher"
require "./ext/**"

class Crypher
  property key : Bytes
  property iv : Bytes
  property cipher_variant : String
  # :nodoc:
  property cipher : OpenSSL::Cipher
  DEFAULT = "AES256"

  class_property global : Crypher { Crypher.new }

  def initialize(key = nil,
                 iv = nil,
                 @cipher_variant = DEFAULT)
    @cipher = OpenSSL::Cipher.new @cipher_variant
    @key = if k = key
             @cipher.key = k
           else
             @cipher.random_key
           end
    @iv = if iv
            @cipher.iv = iv.not_nil!
          else
            @cipher.random_iv
          end
  end

  def encrypt(data : Bytes)
    @cipher.reset
    @cipher.encrypt
    @cipher.key = @key
    @cipher.iv = @iv
    @cipher.update data
    @cipher.final
  end

  def decrypt(data : Bytes)
    @cipher.reset
    @cipher.decrypt
    @cipher.key = @key
    @cipher.iv = @iv
    @cipher.update data
    @cipher.final
  end
end
