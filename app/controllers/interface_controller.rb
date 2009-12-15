class InterfaceController < Rucola::RCController
  ib_outlets :plain_text_field, :encrypted_text_field, :message_label, :first_information_multiline_label, 
             :second_information_multiline_label

  ib_action :encrypt_button
  ib_action :decrypt_button
  ib_action :copy_button

  def initialize
    @magic_square = MagicSquare.new    
    @encoder = Encoder.new
    @printer = Printer.new
  end


  # модуль магический квадрат, енкодер атрибуты на чтение мк и змк, encrypt(text) decrypt(text)

  def encrypt_button(sender)
    text = @plain_text_field.stringValue
    side_size = Math.sqrt(text.size).ceil
    @m_square = @magic_square.create(side_size)
    @printer.print_square(@first_information_multiline_label, @m_square)
    filled_m_square = @encoder.encrypt(@m_square, text)
    @printer.print_square(@second_information_multiline_label, filled_m_square)
    @printer.print_text(@encrypted_text_field, filled_m_square)
    @printer.print_text(@message_label, "Текст зашифрован")
  end

  def decrypt_button(sender)
    crypted_text = @encrypted_text_field.stringValue
    decrypted_text = @encoder.decrypt(@m_square, crypted_text)
    
    @printer.print_text(@plain_text_field, decrypted_text)
    @printer.print_text(@message_label, "Текст дешифрован")
  end

  def copy_button(sender)
  end
end