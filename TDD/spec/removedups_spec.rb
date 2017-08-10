require 'rspec'
require 'removedups'

describe '#my_uniq' do
  it "removes duplicates from array" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end
  it "does not modify original array" do
    test_array = [1,2,1,3,3]
    my_uniq(test_array)
    expect(my_uniq(test_array)).to_not be(test_array)
  end
end
