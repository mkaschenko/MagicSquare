class Printer
  def print_square(interface_element, square)
    s = ""
    square.each_with_index do |row, irow|
      row.each_with_index do |column, icolumn|
        s << column.to_s.center(4) + "|"
      end
      s << "\n"
    end
    interface_element.setStringValue(s)
  end

  def print_text(interface_element, text)
    s = text.to_s
    interface_element.setStringValue(s)
  end
  
  def clear(interface_element)
    interface_element.setStringValue("")
  end
end