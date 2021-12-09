require 'rails_helper'

RSpec.describe "course_ratings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_ratings/#{course_rating.id}", params: params
  end

  describe 'basic fetch' do
    let!(:course_rating) { create(:course_rating) }

    it 'works' do
      expect(CourseRatingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('course_ratings')
      expect(d.id).to eq(course_rating.id)
    end
  end
end
