require "rails_helper"

RSpec.describe UserNeedResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_needs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserNeedResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserNeed.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_need) { create(:user_need) }

    let(:payload) do
      {
        data: {
          id: user_need.id.to_s,
          type: "user_needs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserNeedResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_need.reload.updated_at }
      # .and change { user_need.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_need) { create(:user_need) }

    let(:instance) do
      UserNeedResource.find(id: user_need.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserNeed.count }.by(-1)
    end
  end
end
