require 'rspec'
require 'mytranspose'

describe '#my_transpose' do
  let(:rows) {[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
  ]}
  let(:cols) {[
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]}

  it "transposes rows and columns" do

    expect(my_transpose(rows)).to eq(cols)
  end
  it "returns original arrays if executed twice" do
    expect(my_transpose(my_transpose(rows))).to eq(rows)
  end
  it "doesn't modify original array" do
     expect(my_transpose(rows)).to_not be(rows)
  end
end
