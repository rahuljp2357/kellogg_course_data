require 'rails_helper'

RSpec.describe "user_needs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_needs/#{user_need.id}", params: params
  end

  describe 'basic fetch' do
    let!(:user_need) { create(:user_need) }

    it 'works' do
      expect(UserNeedResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('user_needs')
      expect(d.id).to eq(user_need.id)
    end
  end
end
