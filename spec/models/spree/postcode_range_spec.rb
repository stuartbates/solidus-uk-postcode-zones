describe Spree::PostcodeRange, type: :model do

  let(:range) { 'NW1-99' }
  let(:postcode) { Spree::Postcode.new('NW61DA') }

  subject { Spree::PostcodeRange.new(range) }

  describe '#include?' do

    it 'should return true as postcode is contained inside range' do
      expect(subject.include?(postcode)).to be true
    end

    let(:range) { 'NW6' }
    it 'should be able to deal with single outward numbers - non-ranges' do
      expect(subject.include?(postcode)).to be true
    end

  end



end
