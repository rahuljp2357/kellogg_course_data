require 'rails_helper'

RSpec.describe ProfessorResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'professors',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ProfessorResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Professor.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:professor) { create(:professor) }

    let(:payload) do
      {
        data: {
          id: professor.id.to_s,
          type: 'professors',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ProfessorResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { professor.reload.updated_at }
      # .and change { professor.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:professor) { create(:professor) }

    let(:instance) do
      ProfessorResource.find(id: professor.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Professor.count }.by(-1)
    end
  end
end
