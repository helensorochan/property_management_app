require 'rails_helper'

RSpec.describe Floor do

  subject{ described_class.new(params) }
  let(:property) { create :property }

  describe '#validate' do
    context 'range when start from greather then end to' do
      let(:params){ { start_from: 4, end_to: 3, property_id: property.id } }

      it 'should be invalid on end date' do
        subject.validate
        expect(subject.errors.full_messages).to eq(['End to must be greater than or equal to 4'])
      end
    end

    context 'range when start from equals end to' do
      let(:params){ { start_from: 4, end_to: 4, property_id: property.id } }

      it 'should be valid on end date' do
        subject.validate
        expect(subject.errors.full_messages).to be_empty
      end
    end

    context 'range when overlaps an existing range' do
      let!(:floor){ create :floor, property_id: property.id, start_from: 1, end_to: 4 }
      let(:params){ { start_from: 4, end_to: 7, property_id: property.id } }

      it 'should be invalid on end date' do
        subject.validate
        expect(subject.errors.full_messages).to eq(['New range overlaps existing range for property'])
      end
    end
  end
end
