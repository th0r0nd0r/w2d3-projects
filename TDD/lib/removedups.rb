def my_uniq(array)
  result=[]
  array.each do |el|
    result << el unless result.include?(el)
  end
  result
end
