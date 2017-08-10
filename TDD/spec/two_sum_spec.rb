require 'rspec'
require 'two_sum'

describe 'Array#two_sum' do
  it 'finds all pairs of positions whose elements sum to zero' do
    expect([-1,0,1].two_sum).to eq([[0,2]])
  end

  it 'finds pairs with smaller first elements first' do
    expect([-1,0,-1,1].two_sum).to eq([[0,3],[2,3]])
  end
  it 'finds pairs with smaller second elements first' do
    expect([-1,0,1,1].two_sum).to eq([[0,2],[0,3]])
  end

end
