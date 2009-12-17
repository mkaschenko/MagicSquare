class Printer
  def print_square(interface_element, square)
    s = ""
    square.each_with_index do |row, irow|
      row.each_with_index do |column, icolumn|
        v = column.to_s
        p = v.chars.to_a.size == 2 ? " " : "  "
        s << p + v + "|"
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