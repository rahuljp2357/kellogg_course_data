require "rails_helper"

RSpec.describe UserNeedResource, type: :resource do
  describe "serialization" do
    let!(:user_need) { create(:user_need) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_need.id)
      expect(data.jsonapi_type).to eq("user_needs")
    end
  end

  describe "filtering" do
    let!(:user_need1) { create(:user_need) }
    let!(:user_need2) { create(:user_need) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_need2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_need2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_need1) { create(:user_need) }
      let!(:user_need2) { create(:user_need) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_need1.id,
                                      user_need2.id,
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
                                      user_need2.id,
                                      user_need1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
