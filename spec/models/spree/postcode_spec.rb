describe Spree::Postcode, type: :model do

  let(:postcode) { 'NW61DA' }

  subject { Spree::Postcode.new(postcode) }

  describe '#sanitise_input' do

    let(:postcode) { 'nw61da' }

    it 'should upcase the postcode to avoid case sensitivity issues' do
      expect(subject.send(:sanitise_input, postcode)).to eq('NW61DA')
    end
  end

  describe '#outward_code' do

    it 'should return the outward code of the postcode' do
      expect(subject.outward_code).to eq('NW6')
    end

  end

  describe '#outward_letters' do

    it 'should return the outward letters of the postcode' do
      expect(subject.outward_letters).to eq('NW')
    end

  end

  describe '#outward_numbers' do

    it 'should return the outward numbers of the postcode' do
      expect(subject.outward_numbers).to eq('6')
    end

  end

end
