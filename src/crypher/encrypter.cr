require "../crypher"

# Read in decrypted bytes, write out encrypted bytes
class Crypher::Encrypter < IO
  property cipher : Crypher
  # property buffer : Bytes
  property buffer = IO::Memory.new
  property pos = 0

  delegate :key, :iv, :key=, :iv=, :cipher_variant, to: @cipher
  delegate :read, :size, :pos, :pos=, :rewind, to: @buffer

  def self.create(key, iv = nil, cipher_variant = Crypher::DEFAULT, buffer = IO::Memory.new)
    new Crypher.new(key, iv, cipher_variant), buffer
  end

  def initialize(@cipher = Crypher.global, @buffer = IO::Memory.new); end

  def write(other : Bytes)
    pp! other
    @buffer.write @cipher.cipher.update other
  end
end
