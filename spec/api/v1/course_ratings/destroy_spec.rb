require 'rails_helper'

RSpec.describe "course_ratings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/course_ratings/#{course_rating.id}"
  end

  describe 'basic destroy' do
    let!(:course_rating) { create(:course_rating) }

    it 'updates the resource' do
      expect(CourseRatingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CourseRating.count }.by(-1)
      expect { course_rating.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
