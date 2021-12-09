require "rails_helper"

RSpec.describe CourseRatingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "course_ratings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CourseRatingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CourseRating.count }.by(1)
    end
  end

  describe "updating" do
    let!(:course_rating) { create(:course_rating) }

    let(:payload) do
      {
        data: {
          id: course_rating.id.to_s,
          type: "course_ratings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CourseRatingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { course_rating.reload.updated_at }
      # .and change { course_rating.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:course_rating) { create(:course_rating) }

    let(:instance) do
      CourseRatingResource.find(id: course_rating.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CourseRating.count }.by(-1)
    end
  end
end
