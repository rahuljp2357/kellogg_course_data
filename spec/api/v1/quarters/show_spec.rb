require "rails_helper"

RSpec.describe "quarters#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/quarters/#{quarter.id}", params: params
  end

  describe "basic fetch" do
    let!(:quarter) { create(:quarter) }

    it "works" do
      expect(QuarterResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("quarters")
      expect(d.id).to eq(quarter.id)
    end
  end
end
