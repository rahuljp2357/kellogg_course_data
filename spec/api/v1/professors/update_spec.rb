require "rails_helper"

RSpec.describe "professors#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/professors/#{professor.id}", payload
  end

  describe "basic update" do
    let!(:professor) { create(:professor) }

    let(:payload) do
      {
        data: {
          id: professor.id.to_s,
          type: "professors",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ProfessorResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { professor.reload.attributes }
    end
  end
end
