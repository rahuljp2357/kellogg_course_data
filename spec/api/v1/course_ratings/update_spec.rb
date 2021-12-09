require "rails_helper"

RSpec.describe "course_ratings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/course_ratings/#{course_rating.id}", payload
  end

  describe "basic update" do
    let!(:course_rating) { create(:course_rating) }

    let(:payload) do
      {
        data: {
          id: course_rating.id.to_s,
          type: "course_ratings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CourseRatingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { course_rating.reload.attributes }
    end
  end
end
