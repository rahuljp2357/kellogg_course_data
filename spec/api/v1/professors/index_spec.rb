require 'rails_helper'

RSpec.describe "professors#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/professors", params: params
  end

  describe 'basic fetch' do
    let!(:professor1) { create(:professor) }
    let!(:professor2) { create(:professor) }

    it 'works' do
      expect(ProfessorResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['professors'])
      expect(d.map(&:id)).to match_array([professor1.id, professor2.id])
    end
  end
end
