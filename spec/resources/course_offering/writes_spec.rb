require 'rails_helper'

RSpec.describe CourseOfferingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'course_offerings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CourseOfferingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CourseOffering.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:course_offering) { create(:course_offering) }

    let(:payload) do
      {
        data: {
          id: course_offering.id.to_s,
          type: 'course_offerings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CourseOfferingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { course_offering.reload.updated_at }
      # .and change { course_offering.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:course_offering) { create(:course_offering) }

    let(:instance) do
      CourseOfferingResource.find(id: course_offering.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CourseOffering.count }.by(-1)
    end
  end
end
