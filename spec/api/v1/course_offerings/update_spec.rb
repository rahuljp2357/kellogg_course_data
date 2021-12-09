require 'rails_helper'

RSpec.describe "course_offerings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/course_offerings/#{course_offering.id}", payload
  end

  describe 'basic update' do
    let!(:course_offering) { create(:course_offering) }

    let(:payload) do
      {
        data: {
          id: course_offering.id.to_s,
          type: 'course_offerings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CourseOfferingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { course_offering.reload.attributes }
    end
  end
end
