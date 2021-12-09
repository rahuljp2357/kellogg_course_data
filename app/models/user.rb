class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_one    :user_need,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  has_many   :course_ratings,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
