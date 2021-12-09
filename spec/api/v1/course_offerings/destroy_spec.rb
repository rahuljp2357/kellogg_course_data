require 'rails_helper'

RSpec.describe "course_offerings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/course_offerings/#{course_offering.id}"
  end

  describe 'basic destroy' do
    let!(:course_offering) { create(:course_offering) }

    it 'updates the resource' do
      expect(CourseOfferingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CourseOffering.count }.by(-1)
      expect { course_offering.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
