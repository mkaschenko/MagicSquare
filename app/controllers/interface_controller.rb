class InterfaceController < Rucola::RCController
  ib_outlets :plain_text_field, :encrypted_text_field, :message_label, :first_information_multiline_label, 
             :second_information_multiline_label

  ib_action :encrypt_button
  ib_action :decrypt_button
  ib_action :copy_button

  def initialize
    @encoder = Encoder.new
    @printer = Printer.new
  end

  def encrypt_button(sender)
    plain_text = @plain_text_field.stringValue
    encrypted_text = @encoder.encrypt(plain_text)
    @printer.print_square(@first_information_multiline_label, @encoder.magic_square)
    @printer.print_square(@second_information_multiline_label, @encoder.filled_magic_square)
    @printer.print_text(@encrypted_text_field, encrypted_text)
    @printer.print_text(@message_label, "Текст зашифрован")
  end

  def decrypt_button(sender)
    encrypted_text = @encrypted_text_field.stringValue
    plain_text = @encoder.decrypt(encrypted_text)
    @printer.print_square(@first_information_multiline_label, @encoder.magic_square)
    @printer.clear(@second_information_multiline_label)
    @printer.print_text(@plain_text_field, plain_text)
    @printer.print_text(@message_label, "Текст дешифрован")
  end

  def copy_button(sender)
  end
end