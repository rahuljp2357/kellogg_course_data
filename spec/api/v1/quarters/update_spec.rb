require 'rails_helper'

RSpec.describe "quarters#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/quarters/#{quarter.id}", payload
  end

  describe 'basic update' do
    let!(:quarter) { create(:quarter) }

    let(:payload) do
      {
        data: {
          id: quarter.id.to_s,
          type: 'quarters',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(QuarterResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { quarter.reload.attributes }
    end
  end
end
