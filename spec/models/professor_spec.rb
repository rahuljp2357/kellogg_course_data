require 'rails_helper'

RSpec.describe Professor, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:course_offerings) }

    end

    describe "InDirect Associations" do

    it { should have_many(:course_ratings) }

    end

    describe "Validations" do

    end
end
