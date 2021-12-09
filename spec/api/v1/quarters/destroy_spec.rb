require 'rails_helper'

RSpec.describe "quarters#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/quarters/#{quarter.id}"
  end

  describe 'basic destroy' do
    let!(:quarter) { create(:quarter) }

    it 'updates the resource' do
      expect(QuarterResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Quarter.count }.by(-1)
      expect { quarter.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
