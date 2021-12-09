require 'rails_helper'

RSpec.describe "course_offerings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/course_offerings", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'course_offerings',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CourseOfferingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CourseOffering.count }.by(1)
    end
  end
end
