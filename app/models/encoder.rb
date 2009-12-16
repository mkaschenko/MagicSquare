$KCODE = "utf-8"

class Encoder
  include MagicSquare
  
  attr_reader :magic_square, :filled_magic_square, :formated_magic_square
  
  def encrypt(plain_text)
    side_size = get_side_size(plain_text) 
    @magic_square = create_magic_square(side_size)
    chars = plain_text.chars.to_a
    chars.insert(0, nil)
    @filled_magic_square = @magic_square.collect { |row| row.collect { |column| chars[column].nil? ? "-" : chars[column] } }
    @filled_magic_square.flatten.delete_if { |element| element == "-" }.to_s
  end

  def decrypt(crypted_text)
    side_size = get_side_size(crypted_text)
    @magic_square = create_magic_square(side_size)
    text_length = crypted_text.size
    chars = crypted_text.chars.to_a
    h = {}
    s = ""
    @formated_magic_square = @magic_square.collect { |row| row.collect { |column| column > text_length ? "-" : column } }
    a = @formated_magic_square.flatten.delete_if { |element| element == "-" }
    a.each_with_index { |element, index| h[element] = chars[index] }
    h.keys.sort.each { |key| s << h[key] }
    s
  end
  
  private

  def get_side_size(text)
    Math.sqrt(text.size).ceil
  end
end