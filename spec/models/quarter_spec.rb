require "rails_helper"

RSpec.describe Quarter, type: :model do
  describe "Direct Associations" do
    it { should have_many(:course_offerings) }
  end

  describe "InDirect Associations" do
    it { should have_many(:courses) }
  end

  describe "Validations" do
  end
end
