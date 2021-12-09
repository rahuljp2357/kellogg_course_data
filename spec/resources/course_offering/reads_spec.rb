require "rails_helper"

RSpec.describe CourseOfferingResource, type: :resource do
  describe "serialization" do
    let!(:course_offering) { create(:course_offering) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(course_offering.id)
      expect(data.jsonapi_type).to eq("course_offerings")
    end
  end

  describe "filtering" do
    let!(:course_offering1) { create(:course_offering) }
    let!(:course_offering2) { create(:course_offering) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: course_offering2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([course_offering2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:course_offering1) { create(:course_offering) }
      let!(:course_offering2) { create(:course_offering) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      course_offering1.id,
                                      course_offering2.id,
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
                                      course_offering2.id,
                                      course_offering1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
