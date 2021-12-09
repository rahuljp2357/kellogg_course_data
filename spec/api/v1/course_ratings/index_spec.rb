require "rails_helper"

RSpec.describe "course_ratings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_ratings", params: params
  end

  describe "basic fetch" do
    let!(:course_rating1) { create(:course_rating) }
    let!(:course_rating2) { create(:course_rating) }

    it "works" do
      expect(CourseRatingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["course_ratings"])
      expect(d.map(&:id)).to match_array([course_rating1.id, course_rating2.id])
    end
  end
end
