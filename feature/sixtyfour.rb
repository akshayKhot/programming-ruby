module Base64
  def self.encode64(bin)
    [bin].pack("m")
  end

  def self.decode64(str)
    str.unpack("m")
  end
end