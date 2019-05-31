require "../crypher"

class String
  def encrypt(cipher : Crypher = Crypher.global)
    Base64.encode cipher.encrypt self.to_slice
  end

  def decrypt(cipher : Crypher = Crypher.global)
    String.new cipher.decrypt Base64.decode self
  end
end
