require "rails_helper"

RSpec.describe CourseRating, type: :model do
  describe "Direct Associations" do
    it { should have_many(:comments) }

    it { should belong_to(:course_offering) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:prof) }
  end

  describe "Validations" do
  end
end
