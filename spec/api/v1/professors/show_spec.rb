require 'rails_helper'

RSpec.describe "professors#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/professors/#{professor.id}", params: params
  end

  describe 'basic fetch' do
    let!(:professor) { create(:professor) }

    it 'works' do
      expect(ProfessorResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('professors')
      expect(d.id).to eq(professor.id)
    end
  end
end
