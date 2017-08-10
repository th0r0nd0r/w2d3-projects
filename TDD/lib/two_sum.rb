class Array
  def two_sum
    result = []
    self.each_with_index do |el1, i|
      self[i+1..-1].each_with_index do |el2, j|
        result << [i,j+i+1] if el2 + el1 == 0
      end
    end
    result
  end
end
