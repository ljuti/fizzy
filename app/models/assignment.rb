class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :bubble

  validates :user_id, uniqueness: { scope: :bubble_id }
end
