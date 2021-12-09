require 'rails_helper'

RSpec.describe "user_needs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_needs/#{user_need.id}"
  end

  describe 'basic destroy' do
    let!(:user_need) { create(:user_need) }

    it 'updates the resource' do
      expect(UserNeedResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { UserNeed.count }.by(-1)
      expect { user_need.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
