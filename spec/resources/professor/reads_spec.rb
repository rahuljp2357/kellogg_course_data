require "rails_helper"

RSpec.describe ProfessorResource, type: :resource do
  describe "serialization" do
    let!(:professor) { create(:professor) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(professor.id)
      expect(data.jsonapi_type).to eq("professors")
    end
  end

  describe "filtering" do
    let!(:professor1) { create(:professor) }
    let!(:professor2) { create(:professor) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: professor2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([professor2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:professor1) { create(:professor) }
      let!(:professor2) { create(:professor) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      professor1.id,
                                      professor2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      professor2.id,
                                      professor1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
