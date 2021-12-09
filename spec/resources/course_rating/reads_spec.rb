require "rails_helper"

RSpec.describe CourseRatingResource, type: :resource do
  describe "serialization" do
    let!(:course_rating) { create(:course_rating) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(course_rating.id)
      expect(data.jsonapi_type).to eq("course_ratings")
    end
  end

  describe "filtering" do
    let!(:course_rating1) { create(:course_rating) }
    let!(:course_rating2) { create(:course_rating) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: course_rating2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([course_rating2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:course_rating1) { create(:course_rating) }
      let!(:course_rating2) { create(:course_rating) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      course_rating1.id,
                                      course_rating2.id,
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
                                      course_rating2.id,
                                      course_rating1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
