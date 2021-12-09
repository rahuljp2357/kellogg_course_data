require 'rails_helper'

RSpec.describe "quarters#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/quarters", params: params
  end

  describe 'basic fetch' do
    let!(:quarter1) { create(:quarter) }
    let!(:quarter2) { create(:quarter) }

    it 'works' do
      expect(QuarterResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['quarters'])
      expect(d.map(&:id)).to match_array([quarter1.id, quarter2.id])
    end
  end
end
