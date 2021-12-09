require "rails_helper"

RSpec.describe "user_needs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_needs", params: params
  end

  describe "basic fetch" do
    let!(:user_need1) { create(:user_need) }
    let!(:user_need2) { create(:user_need) }

    it "works" do
      expect(UserNeedResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_needs"])
      expect(d.map(&:id)).to match_array([user_need1.id, user_need2.id])
    end
  end
end
