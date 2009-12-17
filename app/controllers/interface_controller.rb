class InterfaceController < Rucola::RCController
  ib_outlets :plain_text_field, :encrypted_text_field, :message_label, :first_information_multiline_label, 
             :second_information_multiline_label, :encrypt_button, :decrypt_button

  ib_action :encrypt_button
  ib_action :decrypt_button

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
    @printer.print_text(@message_label, "Текст зашифрован!")
    @decrypt_button.setEnabled(true)
  end

  def decrypt_button(sender)
    encrypted_text = @encrypted_text_field.stringValue
    plain_text = @encoder.decrypt(encrypted_text)
    @printer.print_square(@first_information_multiline_label, @encoder.magic_square)
    @printer.print_square(@second_information_multiline_label, @encoder.formated_magic_square)
    @printer.print_text(@plain_text_field, plain_text)
    @printer.print_text(@message_label, "Текст дешифрован!")
    @encrypt_button.setEnabled(true)
  end

  def controlTextDidChange(notification)
    object = notification.object
    if object.stringValue.empty?
      case object.tag
      when 0
        @encrypt_button.setEnabled(false)
        @printer.print_text(@message_label, "Отсутсвует текст для шифрования!")
      when 1
        @decrypt_button.setEnabled(false)
        @printer.print_text(@message_label, "Отсутсвует зашифрованный текст!")
      end
    else
      case object.tag
      when 0
        @encrypt_button.setEnabled(true)
      when 1
        @decrypt_button.setEnabled(true)
      end
      @printer.clear(@message_label)
    end 
  end

  def awakeFromNib
    font = OSX::NSFont.fontWithName_size_('Monaco', 0)
    @first_information_multiline_label.setFont_(font)
    @second_information_multiline_label.setFont_(font)
  end
end