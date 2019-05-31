require "../crypher"

# Read in encrypted bytes, write out decrypted bytes.
class Crypher::Decrypter < IO
  property buffer : IO::Memory
  property cipher : Crypher

  def initialize(@cipher = Crypher.global, @buffer = IO::Memory.new)
    @cipher.cipher.encrypt
  end

  def self.create(key,
                  iv = nil,
                  cipher_variant = Crypher::DEFAULT,
                  buffer = IO::Memory.new)
    new Crypher.new(key, iv, cipher_variant), buffer
  end

  def write(other : Bytes)
    plainbytes = @cipher.cipher.update other
    @buffer.read plainbytes
  end

  delegate :read, :size, :pos, :rewind, to: buffer
  delegate :key, :iv, :key=, :iv=, :cipher_variant, to: cipher
end
