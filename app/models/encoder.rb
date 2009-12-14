$KCODE = "utf-8"

class Encoder
  def encrypt(magic_square, text)
    chars = text.chars.to_a
    chars.insert(0, nil)
    magic_square.collect { |row| row.collect { |column| chars[column] } }
  end
end