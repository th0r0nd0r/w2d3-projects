require 'byebug'
def my_transpose(array)
  cols = Array.new(array.size) { Array.new(array.size) }
  array.each_with_index do |row, idx|
    row.each_index do |jdx|
      cols[jdx][idx] = array[idx][jdx]
    end
  end
  cols
end
