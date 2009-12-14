class InterfaceController < Rucola::RCController
  
  def initialize
    @magic_square = MagicSquare.new    
    @encoder = Encoder.new
    @printer = Printer.new
  end
  
  ib_outlets :plain_text_field, :encrypted_text_field, :message_label, :first_information_multiline_label, 
             :second_information_multiline_label

  ib_action :encrypt_button do |sender|
    text = @plain_text_field.stringValue
    side_size = Math.sqrt(text.size).ceil
    magic_square = @magic_square.create(side_size)
    @printer.print_square(@first_information_multiline_label, magic_square)
    filled_magic_square = @encoder.encrypt(magic_square, text)
    @printer.print_square(@second_information_multiline_label, filled_magic_square)
    @printer.print_text(@encrypted_text_field, filled_magic_square)
  end

  ib_action :decrypt_button do |sender|
    
  end

  ib_action :copy_button do |sender|
    
  end
end