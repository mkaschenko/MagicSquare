class InterfaceController < Rucola::RCController
  ib_outlets :plain_text_field, :encrypted_text_field, :message_label, :first_information_multiline_label, 
             :second_information_multiline_label

  ib_action :encrypt_button do |sender|
  end

  ib_action :decrypt_button do |sender|
  end

  ib_action :copy_button do |sender|
  end
end
