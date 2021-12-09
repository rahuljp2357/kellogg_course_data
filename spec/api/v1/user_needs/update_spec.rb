require "rails_helper"

RSpec.describe "user_needs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_needs/#{user_need.id}", payload
  end

  describe "basic update" do
    let!(:user_need) { create(:user_need) }

    let(:payload) do
      {
        data: {
          id: user_need.id.to_s,
          type: "user_needs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserNeedResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_need.reload.attributes }
    end
  end
end
