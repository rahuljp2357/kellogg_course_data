require "rails_helper"

RSpec.describe "course_offerings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_offerings/#{course_offering.id}", params: params
  end

  describe "basic fetch" do
    let!(:course_offering) { create(:course_offering) }

    it "works" do
      expect(CourseOfferingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("course_offerings")
      expect(d.id).to eq(course_offering.id)
    end
  end
end
