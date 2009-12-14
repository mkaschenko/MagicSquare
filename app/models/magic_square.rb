require "matrix"

class MagicSquare
  def create(side_size)
    side_size += 1 if side_size.even?
    square = Matrix.zero(side_size).to_a
    prepared_value_minus = (side_size - 1) / 2
    prepared_value_plus  = (side_size + 1) / 2
    square.each_with_index do |row, irow|
      row.each_index do |icolumn|
        square[irow][icolumn] = 1 + ((irow - icolumn + prepared_value_minus) % side_size * side_size) + 
                                     (irow + icolumn + prepared_value_plus) % side_size
      end
    end
  end
end