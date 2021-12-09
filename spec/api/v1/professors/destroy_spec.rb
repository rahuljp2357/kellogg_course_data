require 'rails_helper'

RSpec.describe "professors#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/professors/#{professor.id}"
  end

  describe 'basic destroy' do
    let!(:professor) { create(:professor) }

    it 'updates the resource' do
      expect(ProfessorResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Professor.count }.by(-1)
      expect { professor.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
