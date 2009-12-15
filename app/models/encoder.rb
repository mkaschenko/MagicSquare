$KCODE = "utf-8"

class Encoder
  def encrypt(magic_square, text)
    chars = text.chars.to_a
    chars.insert(0, nil)
    magic_square.collect { |row| row.collect { |column| chars[column] } }
  end

  def decrypt(magic_square, crypted_text)
    text_length = crypted_text.size
    chars = crypted_text.chars.to_a
    h = {}
    s = ""
    a = magic_square.flatten.delete_if { |element| element > text_length }
    a.each_with_index { |element, index| h[element] = chars[index] }
    h.keys.sort.each { |key| s << h[key] }
    s
  end
end