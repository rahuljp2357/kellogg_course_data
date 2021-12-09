require 'rails_helper'

RSpec.describe QuarterResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'quarters',
          attributes: { }
        }
      }
    end

    let(:instance) do
      QuarterResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Quarter.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:quarter) { create(:quarter) }

    let(:payload) do
      {
        data: {
          id: quarter.id.to_s,
          type: 'quarters',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      QuarterResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { quarter.reload.updated_at }
      # .and change { quarter.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:quarter) { create(:quarter) }

    let(:instance) do
      QuarterResource.find(id: quarter.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Quarter.count }.by(-1)
    end
  end
end
