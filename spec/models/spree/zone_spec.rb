describe Spree::Zone, type: :model do

  subject { create(:zone, kind: 'country') }
  let(:state) { create(:state) }
  let(:country) { state.country }
  let(:address) { create(:address, state: state) }
  before { subject.members.create(zoneable: country) }

  describe '#include?' do

    context 'NW6 single postcode blacklisted' do
      before { subject.blacklist = 'NW6' }

      it 'does not match blacklisted postcode' do
        address.zipcode = 'NW61DA'
        expect(subject.include?(address)).to be false
      end

      it 'does match non-blacklisted postcode' do
        address.zipcode = 'TF118PD'
        expect(subject.include?(address)).to be true
      end
    end

    context 'NW6 single postcode whitelisted' do
      before { subject.whitelist = 'NW6' }

      it 'does match whitelisted postcode' do
        address.zipcode = 'NW61DA'
        expect(subject.include?(address)).to be true
      end

      it 'does not match whitelisted postcode' do
        address.zipcode = 'TF118PD'
        expect(subject.include?(address)).to be false
      end
    end

    context 'Mixed case postcodes' do
      before { subject.blacklist = 'NW1-99' }

      it 'does not match blacklisted postcode' do
        address.zipcode = 'nw61da'
        expect(subject.include?(address)).to be false
      end

    end

    context 'Mixed case ranges' do
      before { subject.blacklist = 'nw1-99' }

      it 'does not match blacklisted postcode' do
        address.zipcode = 'Nw61dA'
        expect(subject.include?(address)).to be false
      end

    end

    context 'Variable whitespace in postcode' do
      before { subject.blacklist = 'NW1-99' }

      it 'does not match blacklisted postcode' do
        address.zipcode = 'N w  61 d     A'
        expect(subject.include?(address)).to be false
      end

    end

    context 'Multiple postcode ranges' do
      before { subject.blacklist = 'NW1-99, TF1-22, NG1-75, B3' }

      it 'does not match blacklisted postcode' do
        address.zipcode = 'NG42 7ET'
        expect(subject.include?(address)).to be false
      end

    end
  end

  describe '#postcode_filter_required?' do
    context 'blacklist defined' do
      before do
        subject.blacklist = 'NW1-10'
        subject.whitelist = ''
      end
      it { expect( subject.send(:postcode_filter_required?) ).to be true }
    end

    context 'both empty' do
      before do
        subject.blacklist = ''
        subject.whitelist = ''
      end
      it { expect( subject.send(:postcode_filter_required?) ).to be false }
    end

    context 'whitelist only' do
      before do
        subject.blacklist = ''
        subject.whitelist = 'NW1-10'
      end
      it { expect( subject.send(:postcode_filter_required?) ).to be true }
    end

    context 'both defined' do
      before do
        subject.blacklist = 'TF11-33'
        subject.whitelist = 'NW1-10'
      end
      it { expect( subject.send(:postcode_filter_required?) ).to be true }
    end
  end

end
