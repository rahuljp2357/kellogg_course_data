class UserNeedResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :facet_1_need, :integer
  attribute :facet_2_need, :integer
  attribute :facet_3_need, :integer
  attribute :facet_4_need, :integer
  attribute :facet_5_need, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations
end
