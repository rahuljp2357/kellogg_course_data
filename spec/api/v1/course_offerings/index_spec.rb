require 'rails_helper'

RSpec.describe "course_offerings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_offerings", params: params
  end

  describe 'basic fetch' do
    let!(:course_offering1) { create(:course_offering) }
    let!(:course_offering2) { create(:course_offering) }

    it 'works' do
      expect(CourseOfferingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['course_offerings'])
      expect(d.map(&:id)).to match_array([course_offering1.id, course_offering2.id])
    end
  end
end
