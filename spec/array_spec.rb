require 'takeout'

describe Array do
  describe '#remove_once' do
    it 'returns single instance of given elements from an array' do
      expect([1, 2, 3, 1].remove_once([1, 3, 4])).to eql([2, 1])
    end 
  end
end
